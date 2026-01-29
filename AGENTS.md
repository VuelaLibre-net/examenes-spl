# Agent Guidelines: VuelaLibre.net SPL Exams

This repository contains the study guide for the SPL (Sailplane Pilot License) exam in Spain, managed as a documentation-as-code project using Asciidoctor, Antora, and Python automation tools.

## 🛠 Build, Lint & Test Commands

### Documentation Build Commands
| Task | Command | Description |
| :--- | :--- | :--- |
| **Full Build** | `./build.sh` | Generates Web, PDF, and EPUB artifacts |
| **Development** | `./watch.sh` | Auto-rebuilds on source changes |
| **Web Only** | `npx antora antora-playbook.yml` | Generates only the static website |
| **Pre-processing** | `python3 tools/add_anchors.py && python3 tools/generate_index.py` | Adds anchors and regenerates trap index |
| **Manual PDF** | `asciidoctor-pdf modules/ROOT/pages/book.adoc -o book/manual_output.pdf` | Generate PDF manually for testing |

### Python Code Quality Commands
| Tool | Command | Purpose |
| :--- | :--- | :--- |
| **Linting** | `ruff check tools/*.py` | Fast Python linting and error detection |
| **Formatting** | `black --check tools/*.py` | Code formatting verification |
| **Auto-format** | `black tools/*.py` | Apply automatic code formatting |
| **Test Runner** | `pytest tools/` | Run tests (when test files exist) |

### Running a Single Test
Currently, no test suite exists. When adding tests:
```bash
# Create test file: tools/test_add_anchors.py
# Run specific test: pytest tools/test_add_anchors.py::test_slugify
# Run with verbose output: pytest -v tools/
```

### Pre-commit Verification
```bash
./build.sh                                      # Full build
git diff book/indice-trampas.adoc               # Check trap index
grep -r "your-change" build/site/               # Verify HTML changes
```

---

## 📂 Project Structure

Follow the **Antora Standard Directory Layout**:

```
├── antora.yml                 # Component descriptor
├── antora-playbook.yml        # Site generation config
├── modules/ROOT/pages/        # AsciiDoc content files
│   ├── book.adoc             # Main book (version on line 3)
│   ├── nav.adoc              # Navigation structure
│   ├── indice-trampas.adoc    # Auto-generated trap index
│   └── *.adoc                # Chapter files (kebab-case)
├── book/                      # Binary artifacts (PDF/EPUB)
├── supplemental-ui/           # Custom templates and CSS
├── tools/                     # Python automation scripts
└── build/                     # Generated website (git-ignored)
```

**Never create new top-level directories for content** - use `modules/ROOT/pages/`.

---

## 📝 Content & Code Style Guidelines

### AsciiDoc Content Standards

#### Formatting
- **Semantic line breaks**: One sentence per line for better git diffs
- **File naming**: `kebab-case.adoc` (e.g., `2-factores-humanos.adoc`)
- **Encoding**: UTF-8 with Unix line endings (LF)

#### Traps (Trampas) - Critical Pattern
Every tricky AESA question must be marked with:
```asciidoc
[#trap-unique-id]                           # Unique anchor ID
[.trampa]                                    # Trap marker
== Title with 🛑 or {trampa-icon} icon  # Title with icon
```

Use `tools/add_anchors.py` to automate anchor generation.

#### Admonitions
Use Spanish captions from `antora.yml`: Nota, Consejo, Importante, Precaución, Advertencia

### Python Code Standards

#### Imports Organization
```python
# Standard library imports
import os
import re
import unicodedata

# Third-party imports
# import requests

# Local imports
# from . import utils
```

#### Naming Conventions
- **Functions**: `verb_phrase` (e.g., `generate_trap_index`, `slugify`)
- **Variables**: `descriptive_name` (e.g., `book_dir`, `trap_pattern`)
- **Constants**: `UPPER_SNAKE_CASE` (e.g., `BOOK_DIR`, `OUTPUT_FILE`)
- **Private functions**: `_private_function` (leading underscore)

#### Function Design
- **Keep functions small**: Aim for < 50 lines
- **Single responsibility**: One function, one purpose
- **Pure functions**: Same input → same output, minimize side effects
- **Explicit returns**: Always return a value or None

#### Error Handling
```python
# Preferred: EAFP (Easier to Ask for Forgiveness than Permission)
try:
    with open(filepath, "r", encoding="utf-8") as f:
        content = f.read()
except FileNotFoundError:
    print(f"Warning: File not found: {filepath}")
    continue
except UnicodeDecodeError as e:
    print(f"Error reading {filepath}: {e}")
    raise
```

#### Type Hints (Recommended)
```python
from typing import List, Dict, Optional

def slugify(value: str) -> str:
    """Convert string to URL-friendly slug."""
    ...
```

### Shell Script Standards
```bash
#!/bin/bash
set -euo pipefail  # Exit on error, undefined vars, pipe failures

# Use descriptive variable names
BOOK_DIR="modules/ROOT/pages"
BUILD_SCRIPT="./build.sh"

# Quote variables
cd "${BOOK_DIR}"

# Use functions for reusable logic
generate_pdf() {
    local input_file="$1"
    local output_file="$2"
    asciidoctor-pdf "$input_file" -o "$output_file"
}
```

### Handlebars Template Standards
- **Indentation**: 2 spaces (no tabs)
- **Quotes**: Double quotes for attributes
- **Variables**: `{{{variable}}}` for unescaped, `{{variable}}` for escaped

---

## 🤖 Workflow Expectations

### 1. Content Changes
- Edit files in `modules/ROOT/pages/`
- Use semantic line breaks (one sentence per line)
- Run `./build.sh` to regenerate all artifacts
- Verify `book/indice-trampas.adoc` was updated

### 2. Adding New Chapters
1. Create file: `modules/ROOT/pages/N-name.adoc` (kebab-case)
2. Add to `modules/ROOT/nav.adoc` navigation
3. Update version in `modules/ROOT/pages/book.adoc` (line 3)
4. Run `./build.sh`

### 3. Binary Artifacts
- **Versioned files**: `book/preguntas-aesa-spl.{YYYY-MM-DD}.{VERSION}.{pdf|epub}`
- **Convenience copies**: `book/preguntas-aesa-spl.{pdf|epub}` (ignored by git)
- **Never commit**: Intermediate files like `modules/ROOT/pages/book.pdf`

### 4. Style Preservation
- Preserve `[red]` roles and `icon:stop-circle[]` icons
- Check `supplemental-ui/partials/head-scripts.hbs` if styling breaks
- Verify FontAwesome 4 compatibility (not FA5)

### 5. Python Tool Changes
- Run `ruff check tools/*.py` before committing
- Run `black tools/*.py` to auto-format
- Add docstrings for new functions
- Keep functions pure and testable

---

## 🧪 Verification Steps

After any modification:

1. **Run full build**: `./build.sh`
2. **Check trap index**: `git diff book/indice-trampas.adoc`
3. **Verify HTML**: `grep -r "your-change" build/site/`
4. **Check PDF**: Open `book/preguntas-aesa-spl.pdf` to verify formatting
5. **Test web**: `cd build/site && python3 -m http.server 8000`

### Pre-Commit Checklist
- [ ] Ran `./build.sh` successfully
- [ ] Version updated in `modules/ROOT/pages/book.adoc` (if needed)
- [ ] `book/indice-trampas.adoc` regenerated (if traps modified)
- [ ] Python tools pass: `ruff check tools/*.py`
- [ ] No intermediate files committed
- [ ] Only versioned artifacts in `book/` directory

---

## 🆘 Troubleshooting

### Build Failures
- **asciidoctor-pdf not found**: `gem install asciidoctor-pdf`
- **inotifywait not found**: `sudo apt-get install inotify-tools`
- **Antora errors**: Check `antora-playbook.yml` syntax

### Python Tool Errors
- **Import errors**: Check Python 3.8+ is installed
- **Encoding errors**: Ensure files are UTF-8
- **Ruff errors**: Run `black tools/*.py` to auto-fix formatting

### PDF/EPUB Generation Issues
- **Font issues**: Check `theme.yml` configuration
- **Icon issues**: Verify FontAwesome 4 CSS is loaded
- **Styling broken**: Check `supplemental-ui/partials/head-scripts.hbs`

---

## 🌿 Git Workflow & Branching Strategy

### Branch Structure
- **`main`**: Producción - solo recibe merges via Pull Requests
- **`dev`**: Desarrollo - rama principal de trabajo

### Workflow Rules (CRITICAL)

#### ❌ NEVER push directly to `main`
- All changes must go through Pull Requests from `dev` → `main`
- Direct pushes to `main` are prohibited

#### ✅ ALWAYS work on `dev` branch
```bash
# Start new work
git checkout dev
git pull origin dev

# Create feature branch if needed
git checkout -b feature/nueva-caracteristica
```

#### 🔄 Creating Pull Requests
```bash
# After committing changes to dev
git push origin dev

# Create PR via GitHub CLI (preferred)
gh pr create --base main --head dev --title "Descripción clara" --body "Detalles del cambio"

# Or visit: https://github.com/VuelaLibre-net/examenes-spl/pull/new/dev
```

### Release Process
1. **Update version** in `modules/ROOT/pages/book.adoc` (line 3)
2. **Run build**: `./build.sh`
3. **Commit to dev**: `git commit -m "Release vX.Y.Z"`
4. **Push dev**: `git push origin dev`
5. **Create PR**: From `dev` to `main`
6. **Review & merge**: Requiere aprobación antes de merge

### Emergency Fixes
Para hotfixes críticos:
1. Crear rama desde `main`: `git checkout -b hotfix/critical-bug main`
2. Aplicar fix y hacer commit
3. Crear PR directo a `main` (excepción a la regla)
4. Mergear a `main` y luego mergear `main` → `dev`

---

*Last updated: 2026-01-29*
*AGENTS.md version: 2.1*
