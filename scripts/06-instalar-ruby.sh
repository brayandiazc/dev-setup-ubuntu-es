#!/usr/bin/env bash
set -e

# Script para instalar y configurar Ruby en Ubuntu con rbenv
# Autor: Brayan Diaz C
# Fecha: 25 jun 2025

echo "💎 Iniciando el proceso de instalación y configuración de Ruby con rbenv..."

# Función reutilizable para leer entradas compatible con bash y zsh
read_prompt() {
  local __msg="$1"
  local __varname="$2"
  echo -n "$__msg"
  read "$__varname"
}

# 1. Actualizar sistema y dependencias
echo "📦 [1/10] Actualizando el sistema..."
sudo apt update && sudo apt upgrade -y && sudo apt full-upgrade -y

echo "🔧 Instalando dependencias necesarias para compilar Ruby..."
sudo apt install -y \
git-core curl wget build-essential libssl-dev libreadline-dev \
zlib1g-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev \
libxslt1-dev libcurl4-openssl-dev software-properties-common \
libffi-dev libgdbm-dev libncurses5-dev automake libtool bison \
libvips imagemagick ffmpeg poppler-utils mupdf mupdf-tools

# 2. Instalar rbenv
if [ -d "$HOME/.rbenv" ]; then
  echo "⚠️ rbenv ya está instalado. Saltando clonación..."
else
  echo "🔄 Clonando el repositorio de rbenv..."
  git clone https://github.com/rbenv/rbenv.git ~/.rbenv
fi

# 3. Configurar entorno
echo "🧩 [2/10] Añadiendo configuración a archivos de entorno..."

for config_file in "$HOME/.bashrc" "$HOME/.zshrc" "$HOME/.profile" "$HOME/.zprofile"; do
  [ ! -f "$config_file" ] && touch "$config_file"

  if ! grep -q 'rbenv init' "$config_file"; then
    {
      echo ''
      echo '# Configuración de rbenv'
      echo 'export PATH="$HOME/.rbenv/bin:$PATH"'
      echo 'eval "$(rbenv init -)"'
      echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"'
    } >> "$config_file"
    echo "✅ Configuración añadida en $config_file"
  else
    echo "ℹ️ $config_file ya contiene configuración de rbenv. Saltando."
  fi
done

# 4. Aplicar configuración temporal
echo "🔄 [3/10] Aplicando configuración temporal..."
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"

# 5. Instalar ruby-build
echo "🔧 [4/10] Instalando ruby-build..."
if [ ! -d "$(rbenv root)/plugins/ruby-build" ]; then
  git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)/plugins/ruby-build"
else
  echo "✅ ruby-build ya está instalado."
fi

# 6. Mostrar versiones disponibles
echo "📜 [5/10] Estas son las versiones de Ruby disponibles:"
rbenv install --list

# 7. Solicitar versión con ayuda visual
ruby_latest=$(rbenv install -l | grep -E '^\s*[0-9]+\.[0-9]+\.[0-9]+$' | tail -1 | tr -d ' ')

echo
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🎯 ¡Atención! Se ha detectado que la última versión estable disponible es: $ruby_latest"
echo
echo "🧠 Puedes escribir una versión específica (ej: 3.1.4)"
echo "👉 O simplemente presiona ENTER para instalar la versión: $ruby_latest"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
read_prompt "¿Qué versión de Ruby deseas instalar?: " ruby_version
echo

if [[ -z "$ruby_version" ]]; then
  ruby_version=$ruby_latest
  echo "🔁 No se ingresó ninguna versión. Se instalará: $ruby_version"
else
  echo "📥 Se instalará Ruby $ruby_version según tu elección."
fi

# 8. Instalar Ruby
echo "⬇️ [6/10] Instalando Ruby $ruby_version..."
rbenv install "$ruby_version"
rbenv global "$ruby_version"

# 9. Verificar instalación
echo "🔍 [7/10] Verificando instalación de Ruby..."
ruby -v

# 10. Instalar Bundler y actualizar RubyGems
echo "📦 [8/10] Instalando Bundler..."
gem install bundler

echo "🔁 [9/10] Actualizando RubyGems..."
gem update --system

# 11. Instrucciones futuras
echo "🛠️ [10/10] Para actualizar rbenv y ruby-build:"
echo "cd ~/.rbenv && git pull"
echo "cd \"\$(rbenv root)/plugins/ruby-build\" && git pull"

echo
echo "🎉 Ruby $ruby_version ha sido instalado y configurado exitosamente con rbenv."

# 12. Recargar terminal
echo
echo "🔄 Recargando terminal para aplicar cambios..."
exec "$SHELL"
