# Workflows de CI/CD

Esta carpeta contiene los workflows de [GitHub Actions](https://docs.github.com/actions)
del proyecto.

## Workflows incluidos

| Workflow                 | Propósito                                                  |
| ------------------------ | ---------------------------------------------------------- |
| [`ci.yml`](ci.yml)       | Ejecuta [ShellCheck](https://www.shellcheck.net/) sobre los scripts en cada push y PR a `main`/`develop`. |

## Workflows recomendados (opcionales)

| Workflow      | Propósito                                          |
| ------------- | -------------------------------------------------- |
| `labeler.yml` | Auto-etiquetado de PRs (usa `../labeler.yml`).     |

## Secrets

Define en **Settings → Secrets and variables → Actions** los secretos que
necesiten tus workflows. Ver [`../../docs/conventions/secrets.md`](../../docs/conventions/secrets.md).
