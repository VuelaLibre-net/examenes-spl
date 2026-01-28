# Agent Guidelines: VuelaLibre.net SPL Exams

This repository contains the study guide for the SPL (Sailplane Pilot License) exam in Spain, managed as a documentation-as-code project.

## 🛠 Build & Automation

The project uses Asciidoctor for document generation and Antora for the web portal.

| Task | Command |
| :--- | :--- |
| **Full Build** | `./build.sh` (Generates Web, PDF, and EPUB) |
| **Development** | `./watch.sh` (Auto-rebuilds on source changes) |
| **Web Only** | `npx antora antora-playbook.yml` |
| **Pre-processing** | `python3 tools/add_anchors.py && python3 tools/generate_index.py` |

### Manual PDF Generation
If needed, generate a specific file using:
`asciidoctor-pdf modules/ROOT/pages/book.adoc -o book/manual_output.pdf`

---

## 📂 Project Structure

Agents must follow the **Antora Standard Directory Layout**:

- `antora.yml`: Component descriptor (defines name, version, and navigation).
- `antora-playbook.yml`: Site generation configuration.
- `modules/ROOT/pages/`: All content files (`.adoc`).
- `modules/ROOT/nav.adoc`: Defines the sidebar structure.
- `book/`: Destination for binary artifacts (PDF/EPUB). **Do not place source files here.**
- `supplemental-ui/`: Custom Handlebars (`.hbs`) templates and CSS for the web site.
- `tools/`: Python scripts for automated content indexing.

---

## 📝 Content Guidelines

### AsciiDoc Formatting
- Use semantic line breaks (one sentence per line) to simplify git diffs.
- **Trampas (Traps)**: Any tricky AESA question must be marked with:
  ```asciidoc
  [#trap-unique-id]
  [.trampa]
  == Title 🛑
  ```
- **Admonitions**: Use Spanish captions defined in `antora.yml` (Nota, Consejo, Advertencia).

### Naming Conventions
- **Files**: `kebab-case.adoc` (e.g., `2-factores-humanos.adoc`).
- **Anchors**: `[#trap-slugified-title]`. Use `tools/add_anchors.py` to automate this.

---

## 🤖 Workflow Expectations

1.  **Restructuring**: Never create new top-level directories for content. Always use the `modules/ROOT/pages` structure.
2.  **Binary Artifacts**:
    - When content changes, you **must** run `./build.sh` to update the PDF/EPUB.
    - Public artifacts in `book/` should follow the naming convention: `preguntas-aesa-spl.{YYYY-MM-DD}.{VERSION}.pdf`.
3.  **Versioning**: Update the version string in `modules/ROOT/pages/book.adoc` (line 3) before a release.
4.  **Style Preservation**:
    - Ensure `[red]` roles and `icon:stop-circle[]` are preserved.
    - If styling breaks in HTML, verify `supplemental-ui/partials/head-scripts.hbs`.
5.  **Cleanliness**:
    - Do not commit intermediate files like `modules/ROOT/pages/book.pdf`.
    - Only commit the final versioned artifacts in `book/` as requested.

---

## 🧪 Verification Steps
After any modification:
1. Run `./build.sh`.
2. Check that `book/indice-trampas.adoc` was updated by the Python tools.
3. Verify the generated HTML in `build/site/` contains the expected changes using `grep`.
