#!/usr/bin/env bash
set -e

# Script para configurar plugins de Oh My Zsh
# Autor: Brayan Diaz C
# Fecha: 25 jun 2025

echo "🔧 Iniciando la instalación de plugins para Zsh y Oh My Zsh en tu sistema..."

# 0. Verificar que Zsh esté instalado
if ! command -v zsh &> /dev/null; then
  echo "❌ Zsh no está instalado. Por favor ejecuta primero el script de instalación de Zsh."
  exit 1
fi

# 1. Instalar plugins adicionales para Zsh
echo "🔌 Instalando plugins zsh-syntax-highlighting y zsh-autosuggestions..."
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

for plugin in zsh-syntax-highlighting zsh-autosuggestions; do
  if [ ! -d "$ZSH_CUSTOM/plugins/$plugin" ]; then
    git clone https://github.com/zsh-users/$plugin.git "$ZSH_CUSTOM/plugins/$plugin"
  else
    echo "ℹ️ Plugin $plugin ya está instalado. Saltando..."
  fi
done

# 2. Habilitar plugins en .zshrc
echo "⚙️ Configurando plugins en .zshrc..."
if grep -q "^plugins=" "$HOME/.zshrc"; then
  sed -i '/^plugins=/c\plugins=(git docker docker-compose node npm python pip pyenv rbenv ruby aws azure gcloud vscode postgres bundler colorize zsh-syntax-highlighting zsh-autosuggestions)' "$HOME/.zshrc"
else
  echo "plugins=(git docker docker-compose node npm python pip pyenv rbenv ruby aws azure gcloud vscode postgres bundler colorize zsh-syntax-highlighting zsh-autosuggestions)" >> "$HOME/.zshrc"
fi

# 3. Crear .zprofile si no existe (sin cargar .zshrc para evitar conflictos)
echo "🧩 Verificando archivo .zprofile..."
if [ ! -f "$HOME/.zprofile" ]; then
  touch "$HOME/.zprofile"
  echo "✅ .zprofile creado."
else
  echo "ℹ️ .zprofile ya existe."
fi

# 4. Aplicar cambios en sesión actual
echo "🔁 Aplicando cambios en esta sesión..."
exec zsh

# 5. Instalar fuentes Powerline
echo "🔡 Instalando fuentes Powerline para una mejor visualización..."
sudo apt install -y fonts-powerline

# 6. Mensaje final
echo
echo "✅ Configuración de plugins Oh My Zsh completada con éxito."
echo "💡 Si este no es tu shell predeterminado, puedes cambiarlo con:"
echo "   chsh -s $(which zsh)"
