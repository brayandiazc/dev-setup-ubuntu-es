# Stack de herramientas

> Qué instala cada script y con qué método.
> **Última actualización**: 2026-07-03

Este documento inventaría las tecnologías que el proyecto instala. No son
dependencias del repositorio, sino el resultado de ejecutar los scripts.

| #   | Herramienta        | Método de instalación               | Notas                                              |
| --- | ------------------ | ----------------------------------- | -------------------------------------------------- |
| 01  | Base del sistema   | APT                                 | build-essential, compresión, utilidades, FS.       |
| 02  | Zsh                | APT + Oh My Zsh                     | No cambia el shell automáticamente.                |
| 03  | Zsh (config)       | Plugins + fuentes Powerline         | Tras reiniciar la terminal.                        |
| 04  | Git                | PPA oficial                         | Configura usuario, correo y rama `main`.           |
| 05  | SSH                | `ssh-keygen`                        | Genera clave RSA 4096 para GitHub.                 |
| 06  | Node.js            | `nodenv` + `node-build`             | Versión seleccionable.                             |
| 07  | Python             | `pyenv`                             | Versión seleccionable + pip/setuptools/wheel.      |
| 08  | Ruby               | `rbenv` + `ruby-build`              | Versión seleccionable + Bundler.                   |
| 09  | Java               | SDKMAN! (Temurin LTS)               | Maven/Gradle opcionales vía SDKMAN!.               |
| 10  | PostgreSQL         | Repositorio oficial PostgreSQL      | v16/v17; crea usuario local.                       |
| 11  | Docker             | Repositorio oficial Docker          | Engine + CLI + Compose; detecta WSL.               |
| 12  | Terraform          | Repositorio oficial HashiCorp       | Clave GPG verificada.                              |
| 13  | Kubernetes         | `kubectl` + `minikube`              | Para desarrollo local.                             |

## Requisitos del entorno

- Ubuntu 20.04+ o WSL2.
- Acceso `sudo`.
- Conexión a internet.
- Shell `bash` o `zsh`.

## Por qué gestores de versión

Para los lenguajes (Node, Python, Ruby, Java) se prefieren gestores de versión
(`nodenv`, `pyenv`, `rbenv`, SDKMAN!) en vez de los paquetes de APT: permiten
instalar y alternar versiones por proyecto sin privilegios de root y sin chocar
con la versión del sistema. Ver [ADR 0002](../decisions/0002-gestores-de-version-para-lenguajes.md).
