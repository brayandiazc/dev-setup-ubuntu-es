#!/usr/bin/bash
set -e

# Script para generar y configurar claves SSH para Git y GitHub
# Autor: Brayan Diaz C
# Fecha: 25 jun 2025

echo "🔐 Iniciando el proceso de generación y configuración de claves SSH para GitHub..."

# 1. Verificar si ya existe una clave SSH
echo "🔎 [1/7] Verificando si ya existe una clave SSH..."
if [ -f ~/.ssh/id_rsa ]; then
  echo "📂 Ya existe una clave SSH:"
  ls -al ~/.ssh
  read -n 1 -p "¿Deseas sobrescribirla y generar una nueva clave SSH? (y/n): " overwrite_key
  echo
  if [ "$overwrite_key" != "y" ]; then
    echo "🚫 Operación cancelada. No se realizaron cambios."
    exit 0
  fi
fi

# 2. Generar una nueva clave SSH con nombre automático por defecto
default_comment="$(hostname)-ssh"
echo "💡 Nombre sugerido para la clave SSH: $default_comment"
read -p "🔖 Escribe un nombre o comentario para tu clave SSH (ENTER para usar '$default_comment'): " ssh_comment
ssh_comment=${ssh_comment:-$default_comment}

echo "✍️ [2/7] Generando nueva clave SSH con el comentario: $ssh_comment..."
ssh-keygen -q -t rsa -b 4096 -C "$ssh_comment" -f ~/.ssh/id_rsa -N ""

# 3. Iniciar el agente SSH
echo "🚀 [3/7] Iniciando el agente SSH..."
eval "$(ssh-agent -s)"

# 4. Agregar clave privada al agente
echo "➕ [4/7] Agregando la clave privada al agente SSH..."
ssh-add ~/.ssh/id_rsa

# 5. Copiar clave pública al portapapeles
echo "📋 [5/7] Copiando la clave pública al portapapeles..."
if command -v xclip &>/dev/null; then
  xclip -sel clip < ~/.ssh/id_rsa.pub
  echo "✅ Clave copiada al portapapeles."
elif [[ "$OSTYPE" == "darwin"* ]]; then
  pbcopy < ~/.ssh/id_rsa.pub
  echo "✅ Clave copiada al portapapeles (macOS)."
else
  echo "⚠️ No se pudo copiar automáticamente. Aquí está tu clave pública:"
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  cat ~/.ssh/id_rsa.pub
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
fi

# 🔔 Separador visual para indicar tarea manual del usuario
echo
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "📌 Acción requerida: agrega la clave en GitHub"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo

# 6. Instrucciones para GitHub
echo "🌐 [6/7] Abre este enlace para agregar la clave pública a tu cuenta de GitHub:"
echo "➡️  https://github.com/settings/ssh/new"
echo "1. Inicia sesión en tu cuenta de GitHub."
echo "2. Pega la clave pública copiada."
echo "3. Asigna un título como: $ssh_comment"
echo "4. Haz clic en 'Add SSH key'."

# 7. Probar conexión
echo
echo "🔗 [7/7] Verificando conexión SSH con GitHub..."
ssh -T git@github.com || true

echo
echo "🎉 Si ves un mensaje como: 'Hi <username>! You've successfully authenticated...', ¡todo está funcionando!"
echo "🔒 Clave SSH configurada correctamente para Git y GitHub."
