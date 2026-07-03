# Convenciones de shell scripting

> Cómo se escribe y estructura un script en dev-setup-ubuntu-es.
> **Última actualización**: 2026-07-03

## Alcance

Todos los scripts de la carpeta `scripts/` y los auxiliares de `.github/scripts/`.

## Estructura de un script

```bash
#!/usr/bin/env bash
set -e

# Script para instalar <herramienta> en Ubuntu/WSL
# Autor: Brayan Diaz C
# Fecha: <fecha>

echo ""
echo "🔧 Iniciando la instalación de <herramienta>..."

# [1/N] Paso descrito
...

echo "🎉 <herramienta> instalada correctamente."
```

## Reglas

- **Shebang portable**: `#!/usr/bin/env bash`.
- **Aborta ante errores**: `set -e` al inicio.
- **Encabezado**: descripción, autor y fecha en comentarios.
- **Nombre**: `NN-instalar-<herramienta>.sh`, con `NN` de dos dígitos que fija el
  orden recomendado.
- **Indentación**: 2 espacios, LF, UTF-8 (ver [`.editorconfig`](../../.editorconfig)).
- **Idempotencia**: comprueba si algo ya existe antes de instalarlo
  (`command -v`, `[ -d ... ]`, etc.).
- **Progreso legible**: usa el patrón `[n/total]` y emojis coherentes con el resto.
- **Mínimo privilegio**: usa `sudo` solo donde sea imprescindible.
- **Fuentes confiables**: prefiere repositorios oficiales y claves GPG verificadas;
  documenta el origen cuando uses `curl | bash`.

## Ejemplo de comprobación idempotente

```bash
if ! command -v docker &> /dev/null; then
  echo "Instalando Docker..."
  # ...
else
  echo "✅ Docker ya está instalado."
fi
```

## Referencias

- [ShellCheck](https://www.shellcheck.net/)
- [`quality-tooling.md`](quality-tooling.md)
- [ADR 0003 — Un script por herramienta](../decisions/0003-un-script-por-herramienta.md)
