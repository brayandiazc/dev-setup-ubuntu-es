# ⚙️ dev-setup-ubuntu-es

Instaladores automatizados para configurar un entorno completo de desarrollo en Ubuntu o WSL, con herramientas modernas y gestionadas por versión: `zsh`, `git`, `ssh`, `node`, `python`, `ruby`, `java`, `postgresql`, `docker`, `terraform` y `kubernetes`.

![Shell](https://img.shields.io/badge/shell-bash-121011?logo=gnu-bash&logoColor=white)
![Platform](https://img.shields.io/badge/platform-Ubuntu%20%7C%20WSL-E95420?logo=ubuntu&logoColor=white)
![License](https://img.shields.io/badge/license-MIT-blue)

> El orden de los scripts sigue la saga de entornos de desarrollo de [brayandiazc.com](https://brayandiazc.com), donde cada herramienta tiene su artículo paso a paso. Su repo hermano para macOS es [`dev-setup-mac-es`](https://github.com/brayandiazc/dev-setup-mac-es).

## Tabla de Contenidos

- [Descripción](#descripción)
- [Características](#características)
- [Requisitos Previos](#requisitos-previos)
- [Instalación](#instalación)
- [Uso](#uso)
- [Scripts Disponibles](#scripts-disponibles)
- [Funcionalidades por Script](#funcionalidades-por-script)
- [Orden Recomendado](#orden-recomendado)
- [Estructura del Proyecto](#estructura-del-proyecto)
- [Enlaces Útiles](#enlaces-útiles)
- [Documentación](#documentación)
- [Contribución](#contribución)
- [Versionado](#versionado)
- [Autores](#autores)
- [Licencia](#licencia)
- [Apóyanos](#apóyanos)
- [Agradecimientos](#agradecimientos)

## Descripción

Configurar una máquina Ubuntu (o WSL) para programar suele implicar decenas de pasos manuales, fáciles de olvidar o hacer en el orden equivocado. Este proyecto reúne ese proceso en **scripts independientes, numerados y comentados**: uno por herramienta, ejecutables por separado o en secuencia.

Cada script es idempotente en la medida de lo posible (verifica antes de instalar), explica lo que hace y deja instrucciones para los pasos que requieren intervención manual. Así puedes montar un entorno completo desde cero o incorporar solo la pieza que te falte.

## Características

- ✅ Un script por herramienta, ejecutable de forma independiente.
- ✅ Numeración que refleja el orden recomendado de instalación.
- ✅ Verificaciones previas para evitar reinstalaciones innecesarias.
- ✅ Gestores por versión para lenguajes (`nodenv`, `pyenv`, `rbenv`, `SDKMAN!`).
- ✅ Compatible con Ubuntu 20.04+ y WSL.
- ✅ Comentado en español y pensado para seguirse paso a paso.

## Requisitos Previos

- **Ubuntu 20.04+** o **WSL**.
- **Conexión a internet.**
- **Permisos de superusuario** (`sudo`).
- **Terminal con `bash` o `zsh`.**
- `tree` (opcional, solo para visualizar la estructura del proyecto).

## Instalación

### 1. Clonar el repositorio

```bash
git clone https://github.com/brayandiazc/dev-setup-ubuntu-es.git
cd dev-setup-ubuntu-es
```

### 2. Dar permisos de ejecución

```bash
chmod +x scripts/*.sh
```

### 3. Ejecutar el script base

Actualiza el sistema e instala las librerías esenciales:

```bash
./scripts/01-instalacion-base.sh
```

## Uso

Tras el script base, ejecuta uno a uno los scripts que necesites:

```bash
./scripts/02-instalar-zsh.sh
```

> 💡 Después de instalar Zsh, **cierra la terminal y vuelve a abrirla** antes de continuar, para que el nuevo shell quede activo.

```bash
./scripts/03-configurar-zsh.sh
./scripts/04-instalar-git.sh
./scripts/05-instalar-ssh.sh
./scripts/06-instalar-node.sh
./scripts/07-instalar-python.sh
./scripts/08-instalar-ruby.sh
./scripts/09-instalar-java.sh
./scripts/10-instalar-postgresql.sh
./scripts/11-instalar-docker.sh
./scripts/12-instalar-terraform.sh
./scripts/13-instalar-kubernetes.sh
```

No es obligatorio ejecutarlos todos: cada script funciona por sí solo.

## Scripts Disponibles

| Nº  | Script                   | Descripción                                                     | Documentación                              |
| --- | ------------------------ | --------------------------------------------------------------- | ------------------------------------------ |
| 01  | `instalacion-base.sh`    | Actualiza el sistema y prepara el entorno base                  | -                                          |
| 02  | `instalar-zsh.sh`        | Instala `zsh` como shell predeterminada                         | [Zsh](https://zsh.sourceforge.io/)         |
| 03  | `configurar-zsh.sh`      | Instala Oh My Zsh + plugins (tras reiniciar terminal)           | [Oh My Zsh](https://ohmyz.sh/)             |
| 04  | `instalar-git.sh`        | Instala Git y configura usuario, correo y plantilla de commit   | [Git](https://git-scm.com/)                |
| 05  | `instalar-ssh.sh`        | Genera claves SSH para autenticación con GitHub                 | [SSH](https://www.openssh.com/)            |
| 06  | `instalar-node.sh`       | Instala Node.js usando `nodenv` con versión estable por defecto | [nodenv](https://github.com/nodenv/nodenv) |
| 07  | `instalar-python.sh`     | Instala Python con `pyenv` y paquetes esenciales                | [pyenv](https://github.com/pyenv/pyenv)    |
| 08  | `instalar-ruby.sh`       | Instala Ruby usando `rbenv` con versión seleccionable           | [rbenv](https://github.com/rbenv/rbenv)    |
| 09  | `instalar-java.sh`       | Instala Java LTS con SDKMAN! (distribución Temurin)             | [SDKMAN!](https://sdkman.io/)              |
| 10  | `instalar-postgresql.sh` | Instala PostgreSQL desde el repositorio oficial (v16/v17)       | [PostgreSQL](https://www.postgresql.org/)  |
| 11  | `instalar-docker.sh`     | Instala Docker y Docker Compose                                 | [Docker](https://docs.docker.com/)         |
| 12  | `instalar-terraform.sh`  | Instala Terraform desde el repositorio oficial de HashiCorp     | [Terraform](https://www.terraform.io/)     |
| 13  | `instalar-kubernetes.sh` | Instala kubectl y minikube para desarrollo local                | [Kubernetes](https://kubernetes.io/)       |

## Funcionalidades por Script

### 🔧 01-instalacion-base.sh

- Actualiza el sistema completo (`apt update`, `upgrade`, `full-upgrade`).
- Limpia paquetes y dependencias no utilizadas.
- Instala soporte para sistemas de archivos (exFAT, HFS+, NTFS).
- Añade herramientas para reconocimiento de smartphones.
- Instala utilidades de compresión (zip, rar, 7z).
- Instala librerías esenciales para desarrollo (build-essential, curl, wget, etc.).

### 🐚 02-instalar-zsh.sh

- Instala Zsh desde repositorios oficiales.
- Instala Oh My Zsh en modo no interactivo.
- Verifica la instalación y muestra la versión.
- No cambia automáticamente el shell (requiere acción manual).

### ⚙️ 03-configurar-zsh.sh

- Instala plugins adicionales: `zsh-syntax-highlighting` y `zsh-autosuggestions`.
- Configura plugins en `.zshrc` (git, docker, node, python, pyenv, rbenv, etc.).
- Instala fuentes Powerline para mejor visualización.
- Crea archivo `.zprofile` si no existe.
- Aplica cambios en la sesión actual.

### 📝 04-instalar-git.sh

- Instala Git desde PPA oficial para obtener la última versión.
- Configura colores en la salida de Git.
- Solicita y configura nombre de usuario y correo electrónico.
- Establece `main` como rama principal por defecto.
- Opcional: descarga y configura una plantilla de mensajes de commit.
- Muestra la configuración final.

### 🔐 05-instalar-ssh.sh

- Verifica si ya existe una clave SSH y permite sobrescribir.
- Genera una nueva clave RSA de 4096 bits con comentario personalizable.
- Inicia el agente SSH y añade la clave privada.
- Copia la clave pública al portapapeles automáticamente.
- Proporciona instrucciones para añadir la clave a GitHub.
- Prueba la conexión SSH con GitHub.

### 🟢 06-instalar-node.sh

- Instala dependencias necesarias para compilar Node.js.
- Instala `nodenv` para la gestión de versiones.
- Configura `nodenv` en todos los archivos de entorno.
- Instala el plugin `node-build`.
- Permite seleccionar una versión específica de Node.js.
- Verifica la instalación con `node -v` y `npm -v`.
- Proporciona instrucciones para actualizar `nodenv`.

### 🐍 07-instalar-python.sh

- Instala dependencias necesarias para compilar Python.
- Instala `pyenv` para la gestión de versiones.
- Configura `pyenv` en todos los archivos de entorno.
- Permite seleccionar una versión específica de Python.
- Instala pip y herramientas esenciales (setuptools, wheel).
- Actualiza pip al último nivel.
- Proporciona instrucciones para actualizar `pyenv`.

### 💎 08-instalar-ruby.sh

- Instala dependencias necesarias para compilar Ruby.
- Instala `rbenv` para la gestión de versiones.
- Configura `rbenv` en todos los archivos de entorno (`.bashrc`, `.zshrc`, `.profile`, `.zprofile`).
- Instala el plugin `ruby-build`.
- Permite seleccionar una versión específica de Ruby.
- Instala Bundler y actualiza RubyGems.
- Proporciona instrucciones para actualizar `rbenv`.

### ☕ 09-instalar-java.sh

- Instala dependencias necesarias (curl, zip, unzip).
- Instala SDKMAN! si no está presente (idempotente).
- Carga SDKMAN! en la sesión actual.
- Instala la versión LTS por defecto de Java (distribución Temurin).
- Verifica la instalación con `java -version` y `javac -version`.
- Sugiere cómo instalar Maven y Gradle opcionalmente.

### 🐘 10-instalar-postgresql.sh

- Permite seleccionar una versión específica de PostgreSQL (por defecto v17).
- Añade el repositorio oficial de PostgreSQL.
- Instala la versión seleccionada.
- Habilita y arranca el servicio de PostgreSQL.
- Crea un usuario local con permisos de superusuario.
- Establece contraseña para el usuario.
- Prueba la conexión local.

### 🐳 11-instalar-docker.sh

- Detecta automáticamente si está en WSL con Docker Desktop.
- Elimina versiones antiguas de Docker si existen.
- Instala las dependencias necesarias.
- Añade la clave GPG oficial de Docker.
- Configura el repositorio APT de Docker.
- Instala Docker Engine, CLI y el plugin de Docker Compose.
- Añade el usuario al grupo docker.
- Verifica la instalación.

### 🌍 12-instalar-terraform.sh

- Actualiza el sistema.
- Instala las dependencias necesarias.
- Añade la clave GPG oficial de HashiCorp.
- Configura el repositorio oficial de HashiCorp.
- Instala Terraform desde el repositorio oficial.
- Verifica la instalación.

### ☸️ 13-instalar-kubernetes.sh

- Descarga e instala `kubectl` (versión específica).
- Descarga e instala `minikube` para desarrollo local.
- Da permisos de ejecución a ambos binarios.
- Mueve los binarios a `/usr/local/bin`.
- Verifica las instalaciones.
- Proporciona el comando para iniciar el clúster local.

## Orden Recomendado

Usa los scripts en orden secuencial solo si configuras un sistema desde cero; también puedes ejecutar de forma independiente los que necesites.

1. **Base**: `01-instalacion-base.sh`
2. **Shell**: `02-instalar-zsh.sh` → reiniciar terminal → `03-configurar-zsh.sh`
3. **Control de versiones**: `04-instalar-git.sh` → `05-instalar-ssh.sh`
4. **Lenguajes**: `06-instalar-node.sh` → `07-instalar-python.sh` → `08-instalar-ruby.sh` → `09-instalar-java.sh`
5. **Base de datos**: `10-instalar-postgresql.sh`
6. **Contenedores**: `11-instalar-docker.sh`
7. **Infraestructura**: `12-instalar-terraform.sh`
8. **Orquestación**: `13-instalar-kubernetes.sh`

## Estructura del Proyecto

```bash
.
├── README.md
├── CHANGELOG.md
├── CONTRIBUTING.md
├── CODE_OF_CONDUCT.md
├── SECURITY.md
├── LICENSE
├── .editorconfig
├── .gitignore
├── .github/                 # Plantillas de issues/PR, CI, labels y Dependabot
├── docs/                    # Documentación del proyecto (ver docs/README.md)
└── scripts/
    ├── 01-instalacion-base.sh
    ├── 02-instalar-zsh.sh
    ├── 03-configurar-zsh.sh
    ├── 04-instalar-git.sh
    ├── 05-instalar-ssh.sh
    ├── 06-instalar-node.sh
    ├── 07-instalar-python.sh
    ├── 08-instalar-ruby.sh
    ├── 09-instalar-java.sh
    ├── 10-instalar-postgresql.sh
    ├── 11-instalar-docker.sh
    ├── 12-instalar-terraform.sh
    └── 13-instalar-kubernetes.sh
```

## Enlaces Útiles

### Documentación oficial de las herramientas

- [Zsh](https://zsh.sourceforge.io/) — Shell avanzado
- [Oh My Zsh](https://ohmyz.sh/) — Framework para Zsh
- [Git](https://git-scm.com/) — Control de versiones
- [nodenv](https://github.com/nodenv/nodenv) — Gestor de versiones de Node.js
- [pyenv](https://github.com/pyenv/pyenv) — Gestor de versiones de Python
- [rbenv](https://github.com/rbenv/rbenv) — Gestor de versiones de Ruby
- [SDKMAN!](https://sdkman.io/) — Gestor de SDKs de la JVM (Java)
- [PostgreSQL](https://www.postgresql.org/) — Base de datos relacional
- [Docker](https://docs.docker.com/) — Contenedores
- [Terraform](https://www.terraform.io/) — Infraestructura como código
- [Kubernetes](https://kubernetes.io/) — Orquestación de contenedores

### Recursos adicionales

- [GitHub SSH Keys](https://docs.github.com/en/authentication/connecting-to-github-with-ssh) — Configurar SSH con GitHub
- [Docker Desktop WSL](https://docs.docker.com/desktop/windows/wsl/) — Docker en WSL
- [Minikube](https://minikube.sigs.k8s.io/) — Kubernetes local

## Documentación

La documentación del proyecto vive en [`docs/`](docs/README.md):

| Documento                                                                | Responde a                                |
| ------------------------------------------------------------------------ | ----------------------------------------- |
| [`docs/architecture/architecture.md`](docs/architecture/architecture.md) | ¿Cómo están organizados los scripts?      |
| [`docs/architecture/stack.md`](docs/architecture/stack.md)               | ¿Qué instala cada uno y con qué método?   |
| [`docs/decisions/`](docs/decisions/README.md)                            | ¿Por qué tomamos cada decisión?           |
| [`docs/conventions/`](docs/conventions/README.md)                        | ¿Cómo escribimos y probamos los scripts?  |
| [`docs/product/roadmap.md`](docs/product/roadmap.md)                     | ¿Qué falta por agregar?                   |
| [`docs/glossary.md`](docs/glossary.md)                                   | ¿Qué significa cada término?              |

## Contribución

Lee la [Guía de Contribución](CONTRIBUTING.md) para conocer el flujo de trabajo (Git Flow), el formato de commits ([Conventional Commits](https://www.conventionalcommits.org/es/v1.0.0/)) y las convenciones de los scripts. Por favor respeta también el [Código de Conducta](CODE_OF_CONDUCT.md).

## Versionado

Usamos [Git](https://git-scm.com) para el control de versiones y seguimos [Semantic Versioning](https://semver.org/lang/es/). Consulta las [etiquetas](https://github.com/brayandiazc/dev-setup-ubuntu-es/tags) para ver las versiones disponibles y el [CHANGELOG](CHANGELOG.md).

## Autores

- **Brayan Diaz C** — _Trabajo inicial_ — [@brayandiazc](https://github.com/brayandiazc)

Consulta también la lista de [contribuidores](https://github.com/brayandiazc/dev-setup-ubuntu-es/contributors).

## Licencia

Este proyecto está bajo la licencia [MIT](LICENSE).

## Apóyanos

Si este proyecto te resulta útil y quieres apoyar su desarrollo:

- [GitHub Sponsors](https://github.com/sponsors/brayandiazc)

## Agradecimientos

Gracias a quienes usan y mejoran este proyecto. Si encuentras valor en él, puedes:

- Compartir el proyecto 📤
- Invitar un café ☕
- Abrir un issue o PR 🙌
- Dejar tu agradecimiento con un comentario 💬

---

⌨️ con ❤️ por [Brayan Diaz C](https://github.com/brayandiazc)
