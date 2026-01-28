# Guía de Estudio para el examen SPL (Piloto de Planeadores) en España.

Este repositorio contiene la **Guía de Estudio SPL**, con una recopilación estructurada de los puntos clave, preguntas frecuentes y "trampas" de examen para la obtención de la Licencia de Piloto de Planeador (SPL) en España.

La guía está basada en los apuntes de nuestro estimado **Iñaqui**, enfocándose en diferenciar el conocimiento práctico y seguro de la pura burocracia teórica exigida por AESA.

## 🚀 Características principales

- **Enfoque en el examen**: Identifica las preguntas que pueden aparecer en los exámenes oficiales de AESA.
- **Iconografía de advertencia**: Las secciones marcadas con círculos rojos indican _"preguntitas AESA"_ (datos arbitrarios o irrelevantes para el vuelo real pero, lamentablemente, necesarios para aprobar).
- **Formato profesional**: Generado en PDF de calidad mediante Asciidoctor.

## 📂 Estructura del Libro

El contenido sigue el Syllabus oficial de EASA:

1.  **Reglamentación**: Derecho aéreo y procedimientos ATC.
2.  **Factores Humanos**: Fisiología y psicología aplicada al vuelo.
3.  **Meteorología**: Dinámica atmosférica e interpretación de informes.
4.  **Comunicaciones**: Fraseología y procedimientos de radio.
5.  **Principios de Vuelo**: Aerodinámica y mecánica de vuelo.
6.  **Procedimientos Operacionales**: Lanzamientos, tomas y emergencias.
7.  **Performance y Planificación**: Carga, centrado y planificación de tareas.
8.  **Conocimiento General de la Aeronave**: Estructuras, sistemas e instrumentos.
9.  **Navegación**: Magnetismo, cartas y uso de GNSS.

## 🛠️ Generación del PDF y EPUB

El libro se escribe en formato **AsciiDoc**. Para generar el PDF y EPUB automáticamente cada vez que realices un cambio, puedes usar el script incluido:

```bash
./watch_book.sh
```

### Requisitos

Para compilar el libro, necesitas tener instalado:

- **Asciidoctor PDF**: `gem install asciidoctor-pdf` si tienes ruby.
- **Asciidoctor EPUB3**: `gem install asciidoctor-epub3`
- **inotify-tools** (opcional, para el script de auto-watch): `sudo apt install inotify-tools` en linux.

## 📄 Archivos del Proyecto

- `book/book.adoc`: Archivo principal que organiza todos los capítulos.
- `book/theme.yml`: Configuración visual del PDF.
- `SYLLABUS.md`: Referencia al temario oficial EASA.
- `watch_book.sh`: Script de automatización de compilación.

---
*Vuela libre, vuela seguro.*
