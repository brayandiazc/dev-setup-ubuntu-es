# Documentación de dev-setup-ubuntu-es

Mapa de la documentación del proyecto. Empieza por aquí para saber qué documento
responde cada pregunta.

| Documento                                                      | Pregunta que responde                     | Cuándo leerlo                    |
| -------------------------------------------------------------- | ----------------------------------------- | -------------------------------- |
| [`architecture/architecture.md`](architecture/architecture.md) | ¿Cómo están organizados los scripts?      | Al entender el panorama general  |
| [`architecture/stack.md`](architecture/stack.md)               | ¿Qué herramientas instala y con qué?      | Al elegir qué ejecutar           |
| [`decisions/`](decisions/README.md)                            | ¿Por qué tomamos cada decisión?           | Antes de re-debatir algo         |
| [`conventions/`](conventions/README.md)                        | ¿Cómo escribimos y probamos los scripts?  | Antes de escribir un script      |
| [`product/roadmap.md`](product/roadmap.md)                     | ¿Qué herramientas faltan por agregar?     | Para conocer prioridades         |
| [`glossary.md`](glossary.md)                                   | ¿Qué significa cada término?              | Ante vocabulario desconocido     |

## Sobre la distinción `architecture/` vs `conventions/`

- **`architecture/`** describe **este** proyecto en concreto (cómo se organizan
  sus scripts, qué instala cada uno).
- **`conventions/`** describe **reglas reusables** de cómo trabajamos (cómo se
  escribe un script, cómo se prueba, cómo se manejan los secretos).

## Cómo mantener esta documentación

- Actualiza la línea **"Última actualización"** al editar un documento.
- Registra las decisiones relevantes como [ADRs](decisions/README.md).
- Mantén este índice al día si agregas o quitas documentos.
