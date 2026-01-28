import os
import re
import unicodedata


def slugify(value):
    value = (
        unicodedata.normalize("NFKD", value).encode("ascii", "ignore").decode("ascii")
    )
    value = re.sub(r"[^\w\s-]", "", value).strip().lower()
    return re.sub(r"[-\s]+", "-", value)


def generate_trap_index():
    book_dir = "modules/ROOT/pages"
    output_file = os.path.join(book_dir, "indice-trampas.adoc")
    # This pattern matches the anchor, the trap mark, and the title
    # It handles cases with and without anchor
    trap_pattern = re.compile(r"(\[#trap-.*\]\s*\n)?\[\.trampa\]\s*\n(={2,5})\s+(.*)")

    traps = []

    files = [
        "resumen-ejecutivo.adoc",
        "1-reglamentacion.adoc",
        "2-factores-humanos.adoc",
        "3-meteorologia.adoc",
        "4-comunicaciones.adoc",
        "5-principios-vuelo.adoc",
        "6-procedimientos-operacionales.adoc",
        "7-performance-planificacion.adoc",
        "8-conocimiento-general-aeronave.adoc",
        "9-navegacion.adoc",
    ]

    for filename in files:
        filepath = os.path.join(book_dir, filename)
        if not os.path.exists(filepath):
            continue

        with open(filepath, "r", encoding="utf-8") as f:
            content = f.read()
            matches = trap_pattern.finditer(content)
            for match in matches:
                existing_anchor_match = match.group(1)
                title = match.group(3).strip()

                anchor = None
                if existing_anchor_match:
                    # Extract anchor name from [#anchor-name]
                    m = re.search(r"\[#(.*)\]", existing_anchor_match)
                    if m:
                        anchor = m.group(1)

                if not anchor:
                    # Clean title for slugification
                    # Remove [red]#icon:stop-circle[]# OR the unicode 🛑
                    clean_title = re.sub(
                        r"(\[red\]#icon:stop-circle\[\]#|🛑)", "", title
                    ).strip()
                    anchor = f"trap-{slugify(clean_title)}"

                traps.append({"title": title, "anchor": anchor, "filename": filename})

    with open(output_file, "w", encoding="utf-8") as f:
        f.write("= Índice de Trampas AESA\n\n")
        f.write(
            "En esta sección se recopilan todos los puntos críticos identificados en el temario que suelen ser objeto de preguntas confusas o arbitrarias en los exámenes oficiales.\n\n"
        )

        if not traps:
            f.write("_(No se han marcado trampas todavía en el temario)_\n")
        else:
            for trap in traps:
                # Conditional linking for Antora (HTML) vs PDF
                f.write("ifdef::env-antora[]\n")
                f.write(
                    f"- xref:{trap['filename']}#{trap['anchor']}[{trap['title']}]\n"
                )
                f.write("endif::[]\n")
                f.write("ifndef::env-antora[]\n")
                f.write(f"- <<{trap['anchor']},{trap['title']}>>\n")
                f.write("endif::[]\n")


if __name__ == "__main__":
    generate_trap_index()
