# Configuración de Labels en GitHub

Los labels categorizan Issues y Pull Requests. El archivo [`labeler.yml`](labeler.yml)
asigna automáticamente labels a los PRs según los archivos modificados.

## Labels Automáticos (asignados por labeler)

Deben existir en el repositorio para que el labeler funcione.

| Label           | Color     | Descripción                             |
| --------------- | --------- | --------------------------------------- |
| `documentation` | `#0075CA` | Cambios en documentación                |
| `scripts`       | `#1D76DB` | Cambios en los scripts de instalación   |
| `config`        | `#D4C5F9` | Cambios en configuración del repo       |
| `ci-cd`         | `#F9D0C4` | Cambios en CI/CD y workflows            |
| `github`        | `#333333` | Cambios en templates y config de GitHub |

## Labels Manuales

| Label              | Color     | Descripción                       |
| ------------------ | --------- | --------------------------------- |
| `bug`              | `#D73A4A` | Algo no funciona correctamente    |
| `enhancement`      | `#A2EEEF` | Nueva funcionalidad o mejora      |
| `dependencies`     | `#0366D6` | Actualizaciones de dependencias   |
| `task`             | `#C5DEF5` | Tarea de trabajo                  |
| `needs review`     | `#FBCA04` | Requiere revisión                 |
| `help wanted`      | `#008672` | Se necesita ayuda externa         |
| `good first issue` | `#7057FF` | Bueno para nuevos contribuidores  |
| `duplicate`        | `#CFD3D7` | Issue o PR duplicado              |
| `wontfix`          | `#FFFFFF` | No se trabajará en esto           |
| `question`         | `#D876E3` | Solicitud de información          |

## Crear Labels

### Opción 1: Script automático (recomendado)

```bash
gh auth login
bash .github/scripts/setup-labels.sh
```

### Opción 2: Manual en GitHub

1. Ve a tu repositorio → **Issues** → **Labels**.
2. Click en **New label**.
3. Crea cada label con el nombre, color y descripción de las tablas anteriores.

## Personalizar

Para agregar un nuevo label automático:

1. Crea el label en GitHub (manual o con el script).
2. Agrega la regla en [`labeler.yml`](labeler.yml).
3. Documéntalo en este archivo y en `setup-labels.sh`.
