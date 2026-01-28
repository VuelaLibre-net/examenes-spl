import os
import re
import unicodedata


def slugify(value):
    value = (
        unicodedata.normalize("NFKD", value).encode("ascii", "ignore").decode("ascii")
    )
    value = re.sub(r"[^\w\s-]", "", value).strip().lower()
    return re.sub(r"[-\s]+", "-", value)


book_dir = "modules/ROOT/pages"
for filename in os.listdir(book_dir):
    if filename.endswith(".adoc") and filename not in [
        "book.adoc",
        "indice-trampas.adoc",
    ]:
        path = os.path.join(book_dir, filename)
        with open(path, "r", encoding="utf-8") as f:
            content = f.read()

        # This regex looks for sections that DON'T have an anchor already
        # We look for [.trampa] NOT preceded by [#trap-...]
        def replace_func(match):
            full_match = match.group(0)
            if "[#trap-" in full_match:
                return full_match

            # If we are here, it means we matched [.trampa]\n== Title without leading anchor
            title_line = match.group(1)
            title_text = re.sub(r"={2,5}\s+", "", title_line).strip()
            # Remove icons from title for slugification
            clean_title = re.sub(
                r"\[red\]#icon:stop-circle\[\]#", "", title_text
            ).strip()
            anchor = f"trap-{slugify(clean_title)}"
            return f"[#{anchor}]\n[.trampa]\n{title_line}"

        # Match either:
        # 1. An existing anchor + [.trampa] + title (to keep it as is)
        # 2. Just [.trampa] + title (to add the anchor)
        pattern = r"(\[#trap-.*\]\s*\n)?\[\.trampa\]\s*\n(={2,5}\s+.*)"
        new_content = re.sub(pattern, replace_func, content)

        if new_content != content:
            with open(path, "w", encoding="utf-8") as f:
                f.write(new_content)
