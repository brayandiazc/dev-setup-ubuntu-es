# 0002. Usar gestores de versión para instalar lenguajes

- **Estado**: Aceptada
- **Fecha**: 2026-07-03
- **Decisores**: Brayan Diaz C

## Contexto y problema

Los lenguajes (Node.js, Python, Ruby, Java) pueden instalarse desde los paquetes
de APT, pero esos paquetes suelen quedar desactualizados y fijan una única versión
a nivel de sistema. El desarrollo real necesita alternar versiones por proyecto y
actualizarlas sin privilegios de root.

## Opciones consideradas

- **Paquetes de APT** — simples, pero versión única, desactualizada y ligada a root.
- **Gestores de versión por lenguaje** — `nodenv`, `pyenv`, `rbenv`, SDKMAN!:
  múltiples versiones por usuario, seleccionables por proyecto.

## Decisión

Instalamos los lenguajes mediante **gestores de versión**: `nodenv` (Node.js),
`pyenv` (Python), `rbenv` (Ruby) y **SDKMAN!** (Java). Cada script configura el
gestor en los archivos de entorno (`.bashrc`, `.zshrc`, `.profile`, `.zprofile`).

## Consecuencias

**Positivas:**

- Se pueden instalar y alternar varias versiones por proyecto.
- No dependen de root ni de la cadencia de APT.

**Negativas / costos:**

- Requiere reiniciar la terminal o recargar el entorno tras instalar.
- Compilar algunas versiones necesita dependencias de build adicionales.

**Neutras / a vigilar:**

- Mantener al día las URLs/instaladores oficiales de cada gestor.

## Referencias

- [`../architecture/stack.md`](../architecture/stack.md)
