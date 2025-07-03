#!/usr/bin/env bash
set -e

# Script para instalar Zsh y Oh My Zsh en Ubuntu/WSL
# Autor: Brayan Diaz C
# Fecha: 25 jun 2025

echo "🔧 Iniciando la instalación de Zsh y Oh My Zsh en tu sistema..."

# 1. Actualizar el sistema
echo "📦 [1/5] Actualizando el sistema..."
sudo apt update && sudo apt upgrade -y

# 2. Instalar Zsh
echo "📥 [2/5] Instalando Zsh..."
sudo apt install -y zsh

# Verificar instalación
echo "🔍 Verificando versión de Zsh..."
zsh --version

# 3. Verificar e instalar curl
echo "📥 [3/5] Verificando si curl está instalado..."
sudo apt install -y curl

# 4. Instalar Oh My Zsh (modo no interactivo, evita que corte el script)
echo "🎩 [4/5] Instalando Oh My Zsh (sin cambiar el shell automáticamente)..."
export RUNZSH=no
export CHSH=no
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# 5. Mensaje final
echo
echo "✅ [5/5] Instalación de Oh My Zsh completada con éxito."
echo "💡 Asegúrate de ejecutar 'chsh -s \$(which zsh)' para establecer Zsh como shell predeterminado."
echo "🔄 Luego, cierra y vuelve a abrir tu terminal o ejecuta: exec zsh"
