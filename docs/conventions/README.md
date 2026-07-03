# Convenciones

Esta carpeta documenta **cómo trabajamos** en dev-setup-ubuntu-es: reglas y
estándares transversales, independientes de cualquier script concreto.

> Diferencia con `docs/architecture/`: aquí van las **reglas** ("cómo se escribe
> un script"); en `architecture/` va **este** proyecto en concreto ("cómo están
> organizados los scripts").

## Convenciones incluidas

| Convención                                     | Tema                                     |
| ---------------------------------------------- | ---------------------------------------- |
| [shell-scripts.md](shell-scripts.md)           | Cómo se escribe y estructura un script   |
| [quality-tooling.md](quality-tooling.md)       | ShellCheck, shfmt, EditorConfig y CI     |
| [secrets.md](secrets.md)                       | Manejo de claves SSH/GPG y credenciales  |

## Agregar una convención

Copia [`_template.md`](_template.md), renómbralo en `kebab-case` y documenta el
nuevo tema. Añádelo a la tabla de arriba.
