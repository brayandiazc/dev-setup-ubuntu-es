#!/usr/bin/env bash
set -e

# Script para instalar y configurar Node.js en Ubuntu con nodenv
# Autor: Brayan Diaz C
# Fecha: 25 jun 2025

echo "🟢 Iniciando el proceso de instalación y configuración de Node.js con nodenv..."

# Función de lectura compatible con Bash y Zsh
read_prompt() {
  local __msg="$1"
  local __varname="$2"
  echo -n "$__msg"
  read "$__varname"
}

# 1. Instalar dependencias necesarias
echo "📦 [1/10] Instalando dependencias necesarias..."
sudo apt update && sudo apt install -y \
git-core curl build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev libncursesw5-dev \
libncurses5-dev libffi-dev liblzma-dev libgdbm-dev \
libnss3-dev libtool libyaml-dev pkg-config \
autoconf automake

# 2. Instalar nodenv
if [ -d "$HOME/.nodenv" ]; then
  echo "⚠️ nodenv ya está instalado. Saltando clonación..."
else
  echo "🔄 Clonando el repositorio de nodenv..."
  git clone https://github.com/nodenv/nodenv.git ~/.nodenv
fi

# 3. Configurar entorno en .bashrc, .zshrc, .profile y .zprofile
echo "🧩 [2/10] Agregando configuración de nodenv a archivos de entorno..."
for config_file in "$HOME/.bashrc" "$HOME/.zshrc" "$HOME/.profile" "$HOME/.zprofile"; do
  [ ! -f "$config_file" ] && touch "$config_file"

  if ! grep -q 'nodenv init' "$config_file"; then
    {
      echo ''
      echo '# Configuración de nodenv'
      echo 'export PATH="$HOME/.nodenv/bin:$PATH"'
      echo 'eval "$(nodenv init -)"'
      echo 'export PATH="$HOME/.nodenv/plugins/node-build/bin:$PATH"'
    } >> "$config_file"
    echo "✅ Configuración añadida en $config_file"
  else
    echo "ℹ️ $config_file ya contiene configuración de nodenv. Saltando."
  fi
done

# 4. Aplicar configuración temporal
echo "🔄 [3/10] Aplicando configuración temporal..."
export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"
export PATH="$HOME/.nodenv/plugins/node-build/bin:$PATH"

# 5. Instalar node-build si no está presente
if [ ! -d "$(nodenv root)/plugins/node-build" ]; then
  echo "🔧 [4/10] Instalando plugin node-build..."
  git clone https://github.com/nodenv/node-build.git "$(nodenv root)/plugins/node-build"
else
  echo "✅ node-build ya está instalado."
fi

# 6. Mostrar algunas versiones disponibles
echo "📜 [5/10] Algunas versiones recientes de Node.js disponibles:"
nodenv install -l | grep -E '^\s*[0-9]+\.[0-9]+\.[0-9]+$' | tail -n 20

# 7. Solicitar versión con ayuda visual
node_latest=$(nodenv install -l | grep -E '^\s*[0-9]+\.[0-9]+\.[0-9]+$' | tail -1 | tr -d ' ')

echo
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🎯 Última versión estable detectada de Node.js: $node_latest"
echo
echo "🧠 Puedes escribir una versión específica como: 20.12.2"
echo "👉 O simplemente presiona ENTER para instalar la última versión mostrada arriba."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
read_prompt "¿Qué versión de Node.js deseas instalar?: " node_version
echo

if [[ -z "$node_version" ]]; then
  node_version=$node_latest
  echo "🔁 No se ingresó ninguna versión. Se instalará: $node_version"
else
  echo "📥 Se instalará Node.js $node_version según tu elección."
fi

# 8. Instalar y establecer versión global
echo "⬇️ [6/10] Instalando Node.js $node_version..."
nodenv install "$node_version"
nodenv global "$node_version"

# 9. Verificar instalación
echo "🔍 [7/10] Verificando instalación..."
node -v
npm -v

# 10. Instrucciones futuras
echo "🛠️ [8/10] Para actualizar nodenv y node-build en el futuro:"
echo "cd ~/.nodenv && git pull"
echo "cd \"\$(nodenv root)/plugins/node-build\" && git pull"

# 11. Recargar terminal
echo
echo "🔄 Recargando terminal para aplicar cambios..."
exec "$SHELL"
