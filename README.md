# Guía de Estudio para el examen SPL (Piloto de Planeadores) en España

![Release](https://img.shields.io/github/v/release/VuelaLibre-net/examenes-spl?label=version)
![License](https://img.shields.io/badge/license-CC--BY--4.0-blue.svg)
![GitHub Pages](https://img.shields.io/github/deployments/VuelaLibre-net/examenes-spl/github-pages?label=docs)

Este repositorio contiene la **Guía de Estudio SPL**, con una recopilación estructurada de los puntos clave, preguntas frecuentes y "trampas" de examen para la obtención de la Licencia de Piloto de Planeador (SPL) en España.

🌐 **[Ver Sitio Web Online](https://VuelaLibre-net.github.io/examenes-spl)**

La guía está basada en los apuntes de nuestro estimado **Iñaqui**, enfocándose en diferenciar el conocimiento práctico y seguro de la pura burocracia teórica exigida por AESA.

## 🚀 Características principales

- **Enfoque en el examen**: Identifica las preguntas que pueden aparecer en los exámenes oficiales de AESA.
- **Trampas Señaladas**: Las secciones marcadas como "Trampa" o con iconos rojos [red]#icon:stop-circle[]# indican datos arbitrarios, traducciones confusas o "preguntitas AESA" necesarias para aprobar pero discutibles en la práctica.
- **Multi-formato**: Disponible en **Web** (Antora), **PDF** y **EPUB**.

## 📂 Estructura del Proyecto

El proyecto sigue la estructura estándar de **Antora**:

- `modules/ROOT/pages/`: Contiene los capítulos del libro en formato `.adoc`.
- `antora-playbook.yml`: Configuración para generar el sitio web.
- `book/`: Directorio de salida para los artefactos PDF y EPUB.

## 🛠️ Generación de Documentos

### Generación Completa (Web, PDF y EPUB)

Para generar todos los formatos a la vez, puedes usar el script de construcción:

```bash
# Instalar dependencias (primera vez)
npm install

# Generar todo
./build.sh
```

El sitio web estará en `build/site/` y los documentos portables en `book/`.

### Modo Desarrollo (Auto-regeneración)

Si estás editando el contenido y quieres ver los cambios al instante:

```bash
./watch.sh
```

Este script vigilará cambios en los archivos fuente y reconstruirá todos los formatos automáticamente.

### Requisitos

- **Sitio Web**: Node.js (v16+).
- **PDF y EPUB**: Ruby, `asciidoctor-pdf`, `asciidoctor-epub3`.
- **Automatización**: `inotify-tools` (solo para `watch.sh` en Linux).

## 📄 Archivos Clave

- `modules/ROOT/pages/book.adoc`: Archivo "maestro" para la generación del PDF.
- `modules/ROOT/nav.adoc`: Menú de navegación para el sitio web.
- `supplemental-ui/`: Personalización del tema visual (CSS para las marcas rojas).

---
*Vuela libre, vuela seguro.*
