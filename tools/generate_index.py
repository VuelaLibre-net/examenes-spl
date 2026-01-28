import os
import re


def generate_trap_index():
    book_dir = "book"
    output_file = os.path.join(book_dir, "indice-trampas.adoc")
    trap_pattern = re.compile(r"\[\.trampa\]\s*\n(={2,5})\s+(.*)")

    traps = []

    # Files to scan in order
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
                level = len(match.group(1))
                title = match.group(2).strip()
                # Create a safe anchor name if not present, or use title
                anchor = (
                    title.lower().replace(" ", "-").replace("¿", "").replace("?", "")
                )
                traps.append({"title": title, "file": filename, "anchor": anchor})

    with open(output_file, "w", encoding="utf-8") as f:
        f.write("= Índice de Trampas AESA\n\n")
        f.write(
            "En esta sección se recopilan todos los puntos críticos identificados en el temario que suelen ser objeto de preguntas confusas o arbitrarias en los exámenes oficiales.\n\n"
        )

        if not traps:
            f.write("_(No se han marcado trampas todavía en el temario)_\n")
        else:
            for trap in traps:
                # Use double quotes around the title to handle commas in cross-references
                f.write(f'- <<"{trap["title"]}">>\n')


if __name__ == "__main__":
    generate_trap_index()
