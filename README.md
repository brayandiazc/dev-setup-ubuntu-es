# ⚙️ dev-setup-ubuntu-es

Instaladores automatizados para configurar un entorno completo de desarrollo en Ubuntu o WSL, usando herramientas modernas y gestionadas por versión: `zsh`, `git`, `ssh`, `ruby`, `node`, `python`, `postgresql`, `docker`, `kubernetes`, `terraform`.

Proyecto modular y ordenado que permite instalar y configurar cada tecnología paso a paso con scripts independientes, seguros y comentados.

## 🖼️ Vista Previa (estructura del proyecto)

```bash
.
├── README.md
└── scripts
    ├── 01-instalacion-base.sh
    ├── 02-instalar-zsh.sh
    ├── 03-configurar-zsh.sh
    ├── 04-instalar-git.sh
    ├── 05-instalar-ssh.sh
    ├── 06-instalar-ruby.sh
    ├── 07-instalar-node.sh
    ├── 08-instalar-python.sh
    ├── 09-instalar-postgresql.sh
    ├── 10-instalar-docker.sh
    ├── 11-instalar-kubernetes.sh
    └── 12-instalar-terraform.sh
```

## ⚙️ Requisitos

- Ubuntu 20.04+ / WSL
- Conexión a internet
- Permisos de superusuario (`sudo`)
- Terminal con `bash` o `zsh`
- `tree` (opcional, para visualizar estructura)

## 🚀 Instalación paso a paso

```bash
git clone https://github.com/brayandiazc/dev-setup-ubuntu-es.git
cd dev-setup-ubuntu-es
chmod +x scripts/*.sh  # Otorga permisos de ejecución a todos los scripts
```

- Ejecuta el script base (instala librerías esenciales):

```bash
./scripts/01-instalacion-base.sh
```

- Luego puedes ejecutar, uno por uno, los scripts que necesites:

```bash
./scripts/02-instalar-zsh.sh
```

### 💡 Cierra la terminal, vuelve a abrirla y luego ejecuta

```bash
./scripts/03-configurar-zsh.sh
./scripts/04-instalar-git.sh
./scripts/05-instalar-ssh.sh
./scripts/06-instalar-ruby.sh
./scripts/07-instalar-node.sh
./scripts/08-instalar-python.sh
./scripts/09-instalar-postgresql.sh
./scripts/10-instalar-docker.sh
./scripts/11-instalar-kubernetes.sh
./scripts/12-instalar-terraform.sh
```

## 🔎 Scripts incluidos

| Nº  | Script                   | Descripción                                                     | Documentación                              |
| --- | ------------------------ | --------------------------------------------------------------- | ------------------------------------------ |
| 01  | `instalacion-base.sh`    | Actualiza el sistema y prepara el entorno base                  | -                                          |
| 02  | `instalar-zsh.sh`        | Instala `zsh` como shell predeterminada                         | [Zsh](https://zsh.sourceforge.io/)         |
| 03  | `configurar-zsh.sh`      | Instala Oh My Zsh + plugins (tras reiniciar terminal)           | [Oh My Zsh](https://ohmyz.sh/)             |
| 04  | `instalar-git.sh`        | Instala Git y configura usuario, correo, y plantilla de commit  | [Git](https://git-scm.com/)                |
| 05  | `instalar-ssh.sh`        | Genera claves SSH para autenticación con GitHub                 | [SSH](https://www.openssh.com/)            |
| 06  | `instalar-ruby.sh`       | Instala Ruby usando `rbenv` con versión seleccionable           | [rbenv](https://github.com/rbenv/rbenv)    |
| 07  | `instalar-node.sh`       | Instala Node.js usando `nodenv` con versión estable por defecto | [nodenv](https://github.com/nodenv/nodenv) |
| 08  | `instalar-python.sh`     | Instala Python con `pyenv` y paquetes esenciales                | [pyenv](https://github.com/pyenv/pyenv)    |
| 09  | `instalar-postgresql.sh` | Instala PostgreSQL desde el repositorio oficial (v16/v17)       | [PostgreSQL](https://www.postgresql.org/)  |
| 10  | `instalar-docker.sh`     | Instala Docker y Docker Compose                                 | [Docker](https://docs.docker.com/)         |
| 11  | `instalar-kubernetes.sh` | Instala kubectl y minikube para desarrollo local                | [Kubernetes](https://kubernetes.io/)       |
| 12  | `instalar-terraform.sh`  | Instala Terraform desde repositorio oficial de HashiCorp        | [Terraform](https://www.terraform.io/)     |

## 📋 Funcionalidades detalladas por script

### 🔧 **01-instalacion-base.sh**

- Actualiza el sistema completo (apt update, upgrade, full-upgrade)
- Limpia paquetes y dependencias no utilizadas
- Instala soporte para sistemas de archivos (exFAT, HFS+, NTFS)
- Añade herramientas para reconocimiento de smartphones
- Instala utilidades de compresión (zip, rar, 7z)
- Instala librerías esenciales para desarrollo (build-essential, curl, wget, etc.)

### 🐚 **02-instalar-zsh.sh**

- Instala Zsh desde repositorios oficiales
- Instala Oh My Zsh en modo no interactivo
- Verifica la instalación y muestra la versión
- No cambia automáticamente el shell (requiere acción manual)

### ⚙️ **03-configurar-zsh.sh**

- Instala plugins adicionales: `zsh-syntax-highlighting` y `zsh-autosuggestions`
- Configura plugins en `.zshrc` (git, docker, node, python, pyenv, rbenv, etc.)
- Instala fuentes Powerline para mejor visualización
- Crea archivo `.zprofile` si no existe
- Aplica cambios en la sesión actual

### 📝 **04-instalar-git.sh**

- Instala Git desde PPA oficial para obtener la última versión
- Configura colores en la salida de Git
- Solicita y configura nombre de usuario y correo electrónico
- Establece 'main' como rama principal por defecto
- Opcional: descarga y configura plantilla de mensajes de commit
- Muestra la configuración final

### 🔐 **05-instalar-ssh.sh**

- Verifica si ya existe una clave SSH y permite sobrescribir
- Genera nueva clave RSA de 4096 bits con comentario personalizable
- Inicia el agente SSH y añade la clave privada
- Copia la clave pública al portapapeles automáticamente
- Proporciona instrucciones para añadir la clave a GitHub
- Prueba la conexión SSH con GitHub

### 💎 **06-instalar-ruby.sh**

- Instala dependencias necesarias para compilar Ruby
- Instala `rbenv` para gestión de versiones
- Configura `rbenv` en todos los archivos de entorno (.bashrc, .zshrc, .profile, .zprofile)
- Instala `ruby-build` plugin
- Permite seleccionar versión específica de Ruby
- Instala Bundler y actualiza RubyGems
- Proporciona instrucciones para actualizar rbenv

### 🟢 **07-instalar-node.sh**

- Instala dependencias necesarias para compilar Node.js
- Instala `nodenv` para gestión de versiones
- Configura `nodenv` en todos los archivos de entorno
- Instala `node-build` plugin
- Permite seleccionar versión específica de Node.js
- Verifica la instalación con `node -v` y `npm -v`
- Proporciona instrucciones para actualizar nodenv

### 🐍 **08-instalar-python.sh**

- Instala dependencias necesarias para compilar Python
- Instala `pyenv` para gestión de versiones
- Configura `pyenv` en todos los archivos de entorno
- Permite seleccionar versión específica de Python
- Instala pip y herramientas esenciales (setuptools, wheel)
- Actualiza pip al último nivel
- Proporciona instrucciones para actualizar pyenv

### 🐘 **09-instalar-postgresql.sh**

- Permite seleccionar versión específica de PostgreSQL (por defecto v17)
- Añade repositorio oficial de PostgreSQL
- Instala la versión seleccionada
- Habilita y arranca el servicio de PostgreSQL
- Crea usuario local con permisos de superusuario
- Establece contraseña para el usuario
- Prueba la conexión local
- Proporciona recomendaciones adicionales

### 🐳 **10-instalar-docker.sh**

- Detecta automáticamente si está en WSL con Docker Desktop
- Elimina versiones antiguas de Docker si existen
- Instala dependencias necesarias
- Añade clave GPG oficial de Docker
- Configura repositorio APT de Docker
- Instala Docker Engine, CLI y Docker Compose plugin
- Añade usuario al grupo docker
- Verifica la instalación

### ☸️ **11-instalar-kubernetes.sh**

- Descarga e instala `kubectl` versión específica (v1.30.1)
- Descarga e instala `minikube` para desarrollo local
- Da permisos de ejecución a ambos binarios
- Mueve los binarios a `/usr/local/bin`
- Verifica las instalaciones
- Proporciona comando para iniciar clúster local

### 🌍 **12-instalar-terraform.sh**

- Actualiza el sistema
- Instala dependencias necesarias
- Añade clave GPG oficial de HashiCorp
- Configura repositorio oficial de HashiCorp
- Instala Terraform desde repositorio oficial
- Verifica la instalación

## 🧪 Recomendación de uso

Usa los scripts en orden secuencial solo si estás configurando un sistema desde cero.
También puedes ejecutar solo los que necesites de forma independiente.

### 🔄 Orden recomendado para instalación completa:

1. **Base**: `01-instalacion-base.sh`
2. **Shell**: `02-instalar-zsh.sh` → Reiniciar terminal → `03-configurar-zsh.sh`
3. **Control de versiones**: `04-instalar-git.sh` → `05-instalar-ssh.sh`
4. **Lenguajes**: `06-instalar-ruby.sh` → `07-instalar-node.sh` → `08-instalar-python.sh`
5. **Base de datos**: `09-instalar-postgresql.sh`
6. **Contenedores**: `10-instalar-docker.sh`
7. **Orquestación**: `11-instalar-kubernetes.sh`
8. **Infraestructura**: `12-instalar-terraform.sh`

## 🔗 Enlaces útiles

### Documentación oficial de herramientas:

- [Zsh](https://zsh.sourceforge.io/) - Shell avanzado
- [Oh My Zsh](https://ohmyz.sh/) - Framework para Zsh
- [Git](https://git-scm.com/) - Control de versiones
- [rbenv](https://github.com/rbenv/rbenv) - Gestor de versiones de Ruby
- [nodenv](https://github.com/nodenv/nodenv) - Gestor de versiones de Node.js
- [pyenv](https://github.com/pyenv/pyenv) - Gestor de versiones de Python
- [PostgreSQL](https://www.postgresql.org/) - Base de datos relacional
- [Docker](https://docs.docker.com/) - Contenedores
- [Kubernetes](https://kubernetes.io/) - Orquestación de contenedores
- [Terraform](https://www.terraform.io/) - Infraestructura como código

### Recursos adicionales:

- [GitHub SSH Keys](https://docs.github.com/en/authentication/connecting-to-github-with-ssh) - Configurar SSH con GitHub
- [Docker Desktop WSL](https://docs.docker.com/desktop/windows/wsl/) - Docker en WSL
- [Minikube](https://minikube.sigs.k8s.io/) - Kubernetes local

## 🖇️ Contribuye

```bash
# Fork → Crea rama → Cambios → Commit → Pull Request
```

Lee [CONTRIBUTING.md](.github/CONTRIBUTING.md) para más detalles.

## 📄 Licencia

MIT — ver [LICENSE](LICENSE.md)

---

⌨️ con ❤️ por [Brayan Diaz C](https://github.com/brayandiazc)
