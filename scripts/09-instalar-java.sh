#!/usr/bin/env bash
set -e

# Script para instalar Java (JDK) y Maven con SDKMAN!
# Autor: Brayan Diaz C
# Fecha: 25 jun 2025

echo "☕ Iniciando instalación de Java (JDK) y Maven usando SDKMAN..."

# Función de entrada compatible con Bash y Zsh
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

# 1. Instalar dependencias básicas
echo "📦 [1/10] Verificando dependencias necesarias..."
sudo apt update && sudo apt install -y curl zip unzip

# 2. Instalar SDKMAN si no existe
if [ -d "$HOME/.sdkman" ]; then
  echo "⚠️ SDKMAN ya está instalado. Saltando instalación."
else
  echo "⬇️ Instalando SDKMAN..."
  curl -s "https://get.sdkman.io" | bash
fi

# 3. Agregar SDKMAN a archivos de entorno
echo "🧩 [2/10] Agregando configuración de SDKMAN a archivos de entorno..."
for config_file in "$HOME/.bashrc" "$HOME/.zshrc" "$HOME/.profile" "$HOME/.zprofile"; do
  if [ ! -f "$config_file" ]; then
    touch "$config_file"
  fi
  if ! grep -q 'sdkman-init.sh' "$config_file"; then
    {
      echo ''
      echo '# Configuración de SDKMAN'
      echo '[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"'
    } >> "$config_file"
    echo "✅ Configuración añadida en $config_file"
  else
    echo "ℹ️ $config_file ya contiene configuración de SDKMAN. Saltando."
  fi
done

# 4. Aplicar configuración temporal
echo "🔄 [3/10] Aplicando configuración temporal..."
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# 5. Listar versiones de Java disponibles (evitar pager)
echo "📜 [4/10] Listando versiones de Java disponibles..."
export SDKMAN_LESS=false
sdk list java | grep -E 'tem.*-lts' | grep -v -E 'ea|rc|fx'

# 6. Solicitar versión con ayuda visual
latest_lts=$(sdk list java | grep -E 'tem.*-lts' | grep -v -E 'ea|rc|fx' | head -1 | awk '{print $NF}')

echo
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🎯 ¡Atención! Se detectó que la última versión LTS disponible es: $latest_lts"
echo "📌 Puedes escribir algo como: '17.0.10-tem' o presionar ENTER para instalar esta versión automáticamente."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
read_prompt "¿Qué versión de Java deseas instalar?: " java_version
echo

if [[ -z "$java_version" ]]; then
  java_version=$latest_lts
  echo "🔁 No se ingresó ninguna versión. Se instalará: $java_version"
else
  echo "📥 Se instalará Java $java_version según tu elección."
fi

# 7. Instalar Java
echo "☕ [5/10] Instalando Java con SDKMAN..."
sdk install java "$java_version"
sdk default java "$java_version"

# 8. Instalar Maven
echo "🔧 [6/10] Instalando Maven..."
sdk install maven
sdk default maven

# 9. Verificar instalación
echo "🔍 [7/10] Verificando instalación de Java y Maven..."
java -version
mvn -version

# 10. Instrucciones futuras
echo "🛠️ [8/10] Para actualizar SDKMAN en el futuro:"
echo "sdk update"
echo "sdk upgrade"

# 11. Mensaje final
echo
echo "🎉 [9/10] Java ($java_version) y Maven han sido instalados correctamente usando SDKMAN."
echo "🔁 Puedes cerrar y abrir la terminal o ejecutar: exec \$SHELL"
