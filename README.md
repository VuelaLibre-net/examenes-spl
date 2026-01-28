# 🛩️ VuelaLibre.net - Guía de Estudio SPL

**Guía de Estudio Oficial para la Licencia de Piloto de Planeador (SPL)**

[![Build Status](https://github.com/VuelaLibre-net/examenes-spl/workflows/Build/badge.svg)](https://github.com/VuelaLibre-net/examenes-spl/actions)
[![License](https://img.shields.io/badge/License-CC%20BY--NC--SA%204.0-blue.svg)](https://creativecommons.org/licenses/by-nc-sa/4.0/)
[![Latest Release](https://img.shields.io/github/v/release/VuelaLibre-net/examenes-spl)](https://github.com/VuelaLibre-net/examenes-spl/releases/latest)

## 📖 Acerca de esta Guía

Esta guía de estudio es un recurso integral diseñado para ayudar a los pilotos de planeador a prepararse para el examen oficial de la SPL (Sailplane Pilot License) en España. El contenido está estructurado según el temario oficial de AESA e incluye:

- **Teoría completa** de todos los módulos exigidos
- **Preguntas trampa** identificadas de exámenes oficiales
- **Explicaciones detalladas** de conceptos complejos
- **Referencias cruzadas** entre temas relacionados
- **Formatos múltiples**: HTML web, PDF descargable, y EPUB

---

## 🚀 Descarga Rápida

### Versión PDF (Recomendada para estudio offline)
- [**Descargar Última Versión PDF**](https://github.com/VuelaLibre-net/examenes-spl/releases/latest/download/preguntas-aesa-spl.pdf)

### Versión EPUB (Para lectores electrónicos)
- [**Descargar Última Versión EPUB**](https://github.com/VuelaLibre-net/examenes-spl/releases/latest/download/preguntas-aesa-spl.epub)

### Versión Web (Para navegación online)
- [**Ver Versión Web**](https://VuelaLibre-net.github.io/examenes-spl)

---

## 📚 Contenido

### Módulos de Estudio

1. **📜 Derecho Aéreo** - Reglamentación internacional y nacional
2. **🧠 Factores Humanos** - Fisiología, psicología y limitaciones humanas
3. **🌦️ Meteorología** - Condiciones atmosféricas para el vuelo sin motor
4. **📡 Comunicaciones** - Procedimientos y fraseología aeronáutica
5. **✈️ Principios de Vuelo** - Aerodinámica y mecánica del vuelo
6. **🛫 Procedimientos Operacionales** - Seguridad y operaciones
7. **📊 Performance y Planificación** - Cálculos y planificación de vuelo
8. **🔧 Conocimiento General** - Equipamiento y sistemas
9. **🧭 Navegación** - Orientación y navegación aérea

### Secciones Especiales

- **⚠️ Índice de Trampas AESA**: Preguntas confusas frecuentes en exámenes oficiales
- **📋 Resumen Ejecutivo**: Puntos clave para repaso rápido
- **📎 Anexo: Syllabus Completo**: Referencia oficial del temario

---

## 🛠️ para Contribuidores

Este proyecto utiliza **AsciiDoc** para la generación de contenido y **Antora** para la publicación web moderna.

### Requisitos Previos

```bash
# Node.js y npm (para Antora)
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install -y nodejs

# Ruby y Asciidoctor (para PDF/EPUB)
sudo apt-get install ruby-full
sudo gem install asciidoctor asciidoctor-pdf asciidoctor-epub3

# Python 3 (para scripts de automatización)
sudo apt-get install python3 python3-pip
```

### Construcción del Proyecto

```bash
# Clonar el repositorio
git clone https://github.com/VuelaLibre-net/examenes-spl.git
cd examenes-spl

# Instalar dependencias
npm install
pip3 install -r requirements.txt

# Construir todo el proyecto
./build.sh

# O para desarrollo con recarga automática
./watch.sh
```

### Scripts Disponibles

| Script | Descripción |
|--------|-------------|
| `./build.sh` | Construye web, PDF y EPUB |
| `./watch.sh` | Recarga automática en desarrollo |
| `./build-final.sh` | Versión final para lanzamiento |

---

## 📂 Estructura del Proyecto

```
examenes-spl/
├── 📁 modules/ROOT/pages/     # Contenido principal (.adoc)
├── 📁 supplemental-ui/         # Personalización web (CSS, plantillas)
├── 📁 book/                   # Archivos binarios (PDF, EPUB)
├── 📁 tools/                  # Scripts de automatización Python
├── 📄 antora.yml             # Configuración Antora
├── 📄 antora-playbook.yml    # Playbook de publicación
├── 📄 build.sh              # Script de construcción
└── 📄 watch.sh              # Desarrollo con recarga
```

---

## 🎯 Características Técnicas

### Web Moderna con Antora
- **Diseño responsivo** para móviles, tablets y escritorio
- **Navegación intuitiva** con menú lateral contextual
- **Búsqueda integrada** para encontrar rápidamente información
- **Icons tematizados** para mejor identificación visual
- **Estilo moderno** con tipografía mejorada y colores consistentes

### PDF/EPUB Profesionales
- **Formato optimizado** para impresión y lectura
- **Índice interactivo** con enlaces internos
- **Diseño profesional** con encabezados y numeración de páginas
- **Control de calidad** con Versiones y fechas

### Automatización Avanzada
- **Índice automático** de trampas AESA
- **Anclas automáticas** para referencias cruzadas
- **Validación de enlaces** y estructura del documento
- **Integración continua** con GitHub Actions

---

## 🤝 Cómo Contribuir

¡Todas las contribuciones son bienvenidas!

### Tipos de Contribuciones

1. **📝 Contenido**: Corrección de errores, añadir explicaciones, mejorar redacción
2. **🐛 Errores**: Reportar problemas con enlaces, formato o construcción
3. **💡 Mejoras**: Sugerir nuevas funcionalidades o mejoras de diseño
4. **🌍 Traducciones**: Ayudar a traducir a otros idiomas

### Flujo de Trabajo

1. **Hacer Fork** del repositorio
2. **Crear Rama** para tu contribución (`feature/nueva-funcionalidad`)
3. **Hacer Commit** de tus cambios
4. **Hacer Push** a tu rama
5. **Abrir Pull Request** con descripción clara

### Estilo del Contenido

- **Una frase por línea** (semantic line breaks) para facilitar diffs
- **Markdown y Asciidoctor** para el formato
- **Referencias cruzadas** usando `<<anchor,text>>`
- **Advertencias AESA** marcar con `[red]#icon:stop-circle[]#`

---

## 📄 Licencia

Este proyecto está licenciado bajo **Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License**.

Puedes:
- ✅ Compartir y adaptar el material
- ✅ Usarlo para fines educativos no comerciales

Debes:
- ⚠️ Dar crédito apropiado
- ⚠️ No usar para fines comerciales
- ⚠️ Compartir bajo la misma licencia

---

## 📞 Contacto

- **Issues y sugerencias**: [GitHub Issues](https://github.com/VuelaLibre-net/examenes-spl/issues)
- **Discusiones**: [GitHub Discussions](https://github.com/VuelaLibre-net/examenes-spl/discussions)
- **Web**: [VuelaLibre.net](https://VuelaLibre.net)

---

## 🏆 Agradecimientos

- **Comunidad de pilotos** de planeador españoles por sus contribuciones
- **AESA** por el temario oficial y estándares de seguridad
- **Contribuidores Open Source** que hacen posible estas herramientas
- **Proyecto Antora** por la plataforma de documentación moderna

---

<div align="center">

**[⬆️ Volver arriba](#vuelalibernet---guía-de-estudio-spl)**

Made with ❤️ by the Spanish gliding community

</div>