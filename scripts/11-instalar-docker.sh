#!/usr/bin/env bash
set -e

# Script para instalar Docker Engine y Docker Compose en Ubuntu
# Autor: Brayan Diaz C
# Fecha: 21 jun 2025

echo "🐳 Iniciando instalación de Docker y Docker Compose..."

# Función de lectura compatible con Zsh y Bash (reservada por consistencia)
read_prompt() {
  local __msg="$1"
  local __varname="$2"
  if [[ -n "$ZSH_VERSION" ]]; then
    echo -n "$__msg"
    read "$__varname"
  else
    read -p "$__msg" "$__varname"
  fi
}

# 1. Detectar WSL + Docker Desktop
if grep -qEi "(Microsoft|WSL)" /proc/version && docker version &>/dev/null; then
  echo "🧠 Detectado: Estás en WSL y Docker Desktop ya está funcionando."
  echo "✅ No se requiere instalación manual de Docker en este entorno."
  exit 0
fi

# 2. Eliminar versiones antiguas si existen
echo "📦 [1/8] Eliminando versiones antiguas de Docker (si existen)..."
sudo apt remove -y docker docker-engine docker.io containerd runc || true

# 3. Instalar dependencias necesarias
echo "🔧 [2/8] Instalando dependencias para Docker..."
sudo apt update
sudo apt install -y ca-certificates curl gnupg lsb-release

# 4. Añadir clave GPG oficial
echo "🔐 [3/8] Añadiendo clave GPG oficial de Docker..."
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
  sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# 5. Configurar repositorio de Docker
echo "➕ [4/8] Configurando repositorio APT de Docker..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# 6. Instalar Docker Engine, CLI y Compose plugin
echo "⬇️ [5/8] Instalando Docker Engine y Docker Compose plugin..."
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# 7. Verificar instalación
echo "🔍 [6/8] Verificando instalación..."
docker --version
docker compose version

# 8. Añadir usuario al grupo docker
echo "👤 [7/8] Añadiendo el usuario '$USER' al grupo docker..."
sudo usermod -aG docker "$USER"
echo "⚠️ Para usar Docker sin sudo, deberás cerrar sesión y volver a iniciarla."

# 9. Mensaje final
echo
echo "🎉 [8/8] Docker y Docker Compose han sido instalados y configurados exitosamente."
