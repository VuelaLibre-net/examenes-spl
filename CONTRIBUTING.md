# Contribuir a la Guía de Estudio SPL

¡Gracias por querer ayudar a otros pilotos a superar el examen de AESA! Esta guía vive gracias a la experiencia compartida.

## Cómo colaborar

### 1. Corregir o añadir contenido

Si encuentras un error o conoces una nueva "trampa" de AESA:

**RECUERDA:** No buscamos la respuesta correcta. Buscamos la respuesta que AESA exige para aprobar según lo que nos han comentado otros alumnos que han suspendido por chorradas.

- Puedes añadir un comentario en https://github.com/VuelaLibre-net/examenes-spl/issues/new y lo revisaremos.

- O bien, si quieres puedes hacer tú mismo la corrección o el añadido directamente:

1. Haz un **Fork** del repositorio.
2. Crea una nueva rama (`git checkout -b mejora-temario`).
3. Edita los archivos `.adoc` correspondientes en la carpeta `book/`.
4. Haz un **Pull Request** explicando el cambio.

### 2. Formato de las "Trampas AESA"
Para mantener la consistencia y que aparezcan en el índice automático, usa el siguiente formato:

```asciidoc
[trampa]
=== Título de la pregunta o trampa
Contenido explicando la pregunta de AESA, la respuesta "oficial" y por qué es una trampa o dato irrelevante.
```

### 3. Compilación local
Antes de enviar tu cambio, verifica que el PDF y EPUB se generan correctamente:
```bash
./watch_book.sh
```
(Requiere `asciidoctor-pdf` y `asciidoctor-epub3`).

## Estilo de redacción
- Mantén el tono de **Iñaqui**: práctico, enfocado a la seguridad, pero irónico con la burocracia innecesaria.
- Diferencia claramente entre:
  - **Vuelo Real**: Lo que te mantiene seguro.
  - **Examen AESA**: Lo que tienes que marcar para aprobar.

---
*Vuela libre, vuela seguro.*
