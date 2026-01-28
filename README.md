# Guía de Estudio para el examen SPL (Piloto de Planeadores) en España

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

### Sitio Web (HTML)
El sitio web se genera usando [Antora](https://antora.org/).

**Requisitos**: Node.js (v16+).

```bash
# Instalar dependencias
npm install

# Generar sitio localmente
npx antora antora-playbook.yml
```
El resultado estará disponible en `build/site/index.html`.

### PDF y EPUB
Para generar los documentos portables (PDF y EPUB), utilizamos Asciidoctor directamente.

**Requisitos**: Ruby, `asciidoctor-pdf`, `asciidoctor-epub3`.

```bash
# Generar PDF y EPUB
./build_book.sh
```
Los archivos se generarán en la carpeta `book/` con el formato `preguntas-aesa-spl.{FECHA}.{VERSION}.pdf`.

## 📄 Archivos Clave

- `modules/ROOT/pages/book.adoc`: Archivo "maestro" para la generación del PDF.
- `modules/ROOT/nav.adoc`: Menú de navegación para el sitio web.
- `supplemental-ui/`: Personalización del tema visual (CSS para las marcas rojas).

---
*Vuela libre, vuela seguro.*
