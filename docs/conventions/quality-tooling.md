# Convenciones de calidad y tooling

> Análisis estático, formato y CI de dev-setup-ubuntu-es.
> **Última actualización**: 2026-07-03

## Stack

- **Análisis estático**: [ShellCheck](https://www.shellcheck.net/).
- **Formato**: [shfmt](https://github.com/mvdan/sh) (2 espacios) + [EditorConfig](https://editorconfig.org).
- **CI**: GitHub Actions ejecuta ShellCheck en cada push y PR (ver
  [`.github/workflows/ci.yml`](../../.github/workflows/ci.yml)).

## Reglas

- Los scripts deben pasar **ShellCheck** sin errores antes del merge (check
  bloqueante en CI).
- El formato sigue `.editorconfig` (2 espacios, LF, UTF-8, newline final).

## Comandos útiles

```bash
# Análisis estático de todos los scripts
shellcheck scripts/*.sh

# Ver diferencias de formato (sin escribir)
shfmt -d -i 2 scripts/*.sh

# Aplicar formato
shfmt -w -i 2 scripts/*.sh

# Verificación rápida de sintaxis (sin herramientas externas)
for f in scripts/*.sh; do bash -n "$f"; done
```

## Referencias

- [Documentación de ShellCheck](https://github.com/koalaman/shellcheck)
- [shfmt](https://github.com/mvdan/sh)
