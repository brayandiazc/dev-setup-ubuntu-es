#!/usr/bin/env bash
set -e

# Script para instalar Java (LTS) con SDKMAN! en Ubuntu/WSL
# Autor: Brayan Diaz C
# Fecha: 2 jul 2026

echo ""
echo "☕ Iniciando la instalación de Java con SDKMAN!..."

# [1/5] Instalar dependencias necesarias
echo "🔧 [1/5] Instalando dependencias (curl, zip, unzip)..."
sudo apt update
sudo apt install -y curl zip unzip ca-certificates

# [2/5] Instalar SDKMAN! si no existe
echo "📦 [2/5] Verificando SDKMAN!..."
if [ ! -d "$HOME/.sdkman" ]; then
  echo "⬇️ Instalando SDKMAN!..."
  curl -s "https://get.sdkman.io" | bash
else
  echo "✅ SDKMAN! ya está instalado."
fi

# [3/5] Cargar SDKMAN! en la sesión actual
echo "🔁 [3/5] Cargando SDKMAN! en la sesión actual..."
export SDKMAN_DIR="$HOME/.sdkman"
# shellcheck disable=SC1091
source "$SDKMAN_DIR/bin/sdkman-init.sh"
sdk version

# [4/5] Instalar Java (la LTS por defecto de SDKMAN, distribución Temurin)
echo "⬇️ [4/5] Instalando Java (LTS por defecto)..."
sdk install java

# [5/5] Verificar instalación
echo "🔍 [5/5] Verificando instalación..."
java -version
javac -version
sdk current java

echo ""
echo "🎉 Java ha sido instalado y configurado exitosamente con SDKMAN!."
echo "ℹ️ Para otras versiones: sdk list java && sdk install java <version>"
echo "ℹ️ Maven y Gradle (opcionales): sdk install maven && sdk install gradle"
