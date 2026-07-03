# Guía de Contribución

¡Gracias por tu interés en contribuir a **dev-setup-ubuntu-es**! Esta guía describe el flujo de trabajo, los estándares de código y el proceso de Pull Requests.

## Tabla de Contenidos

- [Configuración del Entorno](#configuración-del-entorno)
- [Flujo de Trabajo](#flujo-de-trabajo)
- [Estándares de Código](#estándares-de-código)
- [Commits y Mensajes](#commits-y-mensajes)
- [Pull Requests](#pull-requests)
- [Revisión de Código](#revisión-de-código)
- [Verificación](#verificación)

## Configuración del Entorno

No hay dependencias que instalar para editar los scripts. Para probarlos con seguridad, usa un entorno desechable (una VM de Ubuntu, un contenedor o WSL) — nunca ejecutes cambios sin probar directamente sobre tu sistema principal, ya que los scripts usan `sudo` e instalan software.

Herramientas recomendadas para contribuir:

- [`shellcheck`](https://www.shellcheck.net/) — análisis estático de scripts de shell.
- [`shfmt`](https://github.com/mvdan/sh) — formateo consistente de scripts.

## Flujo de Trabajo

Usamos un flujo **Git Flow** simplificado.

### Estrategia de Branching

| Rama       | Propósito                                        | Origen    | Destino            |
| ---------- | ------------------------------------------------ | --------- | ------------------ |
| `main`     | Código estable y publicado.                      | —         | —                  |
| `develop`  | Integración de cambios. Pre-release.             | `main`    | `main`             |
| `feat/*`   | Nueva funcionalidad o script.                    | `develop` | `develop`          |
| `fix/*`    | Corrección de bug no urgente.                    | `develop` | `develop`          |
| `hotfix/*` | Corrección urgente.                              | `main`    | `main` y `develop` |
| `docs/*`   | Cambios solo de documentación.                   | `develop` | `develop`          |
| `chore/*`  | Tareas de mantenimiento, tooling, configuración. | `develop` | `develop`          |

### Flujo de una funcionalidad

```bash
# 1. Parte de develop actualizado
git checkout develop
git pull origin develop

# 2. Crea tu rama
git checkout -b feat/nombre-descriptivo

# 3. Trabaja y commitea (ver formato abajo)
git add .
git commit -m "feat: agrega X"

# 4. Sube tu rama y abre un PR hacia develop
git push origin feat/nombre-descriptivo
```

### Nombrado de ramas

- En minúsculas, con prefijo de tipo y descripción en `kebab-case`: `feat/instalar-golang`, `fix/ruta-rbenv`, `docs/actualizar-readme`.

## Estándares de Código

### Estilo de los scripts

- Shebang portable: `#!/usr/bin/env bash`.
- Aborta ante errores: `set -e` al inicio de cada script.
- Indentación de **2 espacios**, finales de línea **LF**, codificación **UTF-8** (ver [`.editorconfig`](.editorconfig)).
- Un script por herramienta, con prefijo numérico de orden: `NN-instalar-<herramienta>.sh`.
- Scripts **idempotentes** siempre que sea posible: comprueba si algo ya está instalado antes de reinstalarlo.
- Mensajes de progreso claros para el usuario (usa el estilo `[n/total]` ya presente en los scripts).

### Comentarios

- Comenta el _por qué_, no el _qué_. El código debe explicarse solo.
- Encabeza cada script con una breve descripción, autor y fecha.

Más detalle en [`docs/conventions/shell-scripts.md`](docs/conventions/shell-scripts.md).

## Commits y Mensajes

Usamos [Conventional Commits](https://www.conventionalcommits.org/es/v1.0.0/):

```
<tipo>(<ámbito opcional>): <descripción breve en imperativo>

<cuerpo opcional>

<footer opcional: BREAKING CHANGE, Closes #123>
```

Tipos comunes: `feat`, `fix`, `docs`, `style`, `refactor`, `chore`, `ci`.

Ejemplos:

```
feat(scripts): agrega instalador de Go con gvm
fix(ruby): corrige la ruta de rbenv en .zprofile
docs: actualiza el orden recomendado de instalación
```

## Pull Requests

- Usa la [plantilla de PR](.github/PULL_REQUEST_TEMPLATE.md) (se carga automáticamente).
- Un PR por cambio lógico; mantenlos pequeños y enfocados.
- Vincula los issues relacionados (`Closes #123`).
- Verifica que `shellcheck` no reporte errores en los scripts modificados.

## Revisión de Código

**Como autor:**

- Haz una auto-revisión antes de pedir review.
- Responde a los comentarios y marca las conversaciones resueltas.

**Como revisor:**

- Sé respetuoso y específico; sugiere, no impongas.
- Verifica correctitud, idempotencia, seguridad (uso de `sudo`, descargas) y legibilidad.

## Verificación

Antes de abrir el PR:

```bash
shellcheck scripts/*.sh           # análisis estático
shfmt -d -i 2 scripts/*.sh        # diferencias de formato (2 espacios)
```

Prueba el script afectado en un entorno limpio (VM/contenedor/WSL) y documenta los pasos en el PR. Ver [`docs/conventions/quality-tooling.md`](docs/conventions/quality-tooling.md).
