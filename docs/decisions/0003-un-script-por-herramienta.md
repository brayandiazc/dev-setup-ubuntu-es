# 0003. Un script independiente por herramienta

- **Estado**: Aceptada
- **Fecha**: 2026-07-03
- **Decisores**: Brayan Diaz C

## Contexto y problema

Configurar un entorno de desarrollo implica instalar muchas herramientas. Podría
hacerse con un único script monolítico, pero eso dificulta ejecutar solo una parte,
depurar fallos y mantener el conjunto.

## Opciones consideradas

- **Script monolítico único** — un solo `setup.sh` que lo instala todo.
- **Un script por herramienta** — archivos `NN-instalar-<herramienta>.sh`
  ejecutables de forma independiente y ordenados por prefijo numérico.

## Decisión

Usamos **un script por herramienta**, con prefijo numérico que sugiere el orden de
ejecución. El usuario puede ejecutar todo en secuencia o solo los scripts que
necesite.

## Consecuencias

**Positivas:**

- Ejecución selectiva y depuración más sencilla.
- Cada script es corto, legible y con responsabilidad única.

**Negativas / costos:**

- Reordenar herramientas obliga a renumerar archivos.
- Hay algo de configuración repetida entre scripts (p. ej. `apt update`).

**Neutras / a vigilar:**

- El orden numérico debe mantenerse coherente con el README y el roadmap.

## Referencias

- [`../architecture/architecture.md`](../architecture/architecture.md)
- [`../conventions/shell-scripts.md`](../conventions/shell-scripts.md)
