# Política de Seguridad

Este documento describe cómo reportar vulnerabilidades en **dev-setup-ubuntu-es** y qué prácticas de seguridad seguimos en el repositorio.

Ten presente que los scripts de este repositorio se ejecutan con `sudo`, modifican tu sistema y descargan software desde internet. **Léelos antes de ejecutarlos** y hazlo solo en entornos donde confíes en la fuente.

## Tabla de Contenidos

- [Reporte de Vulnerabilidades](#reporte-de-vulnerabilidades)
- [Versiones Soportadas](#versiones-soportadas)
- [Alcance](#alcance)
- [Fuera de Alcance](#fuera-de-alcance)
- [Manejo de Secretos](#manejo-de-secretos)
- [Dependencias](#dependencias)
- [Prácticas de Desarrollo Seguro](#prácticas-de-desarrollo-seguro)
- [Contacto](#contacto)

## Reporte de Vulnerabilidades

Si descubres una vulnerabilidad de seguridad, **no abras un issue público**. Repórtala de forma privada:

- **Email**: <brayandiazc@gmail.com> (usa un asunto que empiece con `Security:` para priorizarlo).
- **GitHub Security Advisories**: pestaña _Security_ del repositorio → _Report a vulnerability_.

### Información a incluir

1. Descripción clara de la vulnerabilidad.
2. Pasos para reproducirla (PoC si es posible).
3. Impacto estimado.
4. Script / commit afectado.
5. Sugerencia de mitigación (opcional).

### Qué esperar

| Etapa                              | Tiempo objetivo             |
| ---------------------------------- | --------------------------- |
| Acuse de recibo                    | 48 horas hábiles            |
| Triage inicial y severidad         | 5 días hábiles              |
| Corrección de severidad alta       | 30 días                     |
| Corrección de severidad media/baja | próxima release planificada |

## Versiones Soportadas

| Versión                 | Soporte de seguridad |
| ----------------------- | -------------------- |
| `main` (rama principal) | Sí                   |
| Releases / tags previos | Solo la última       |

## Alcance

Superficies **en alcance** para reportes de seguridad:

- Los scripts de instalación en `scripts/`.
- Comandos que ejecutan con privilegios (`sudo`) o descargan e instalan binarios.
- Fuentes de descarga y verificación de integridad (claves GPG, repositorios APT, instaladores).
- Pipelines de CI/CD del repositorio (`.github/workflows/`).

Ejemplos de hallazgos de interés:

- Descarga de artefactos sin verificar su origen o integridad.
- Uso de fuentes (repositorios/URLs) susceptibles de suplantación.
- Comandos que amplían privilegios más de lo necesario.
- Exposición o filtrado de secretos (claves SSH/GPG, tokens).
- Ejecución de código arbitrario a partir de entradas del usuario sin validar.

## Fuera de Alcance

- Reportes de scanners automáticos sin impacto demostrado.
- Vulnerabilidades en el software de terceros que estos scripts instalan (repórtalas a su proyecto correspondiente).
- Configuraciones inseguras introducidas por el usuario tras la instalación.

## Manejo de Secretos

- **Nunca** commitees secretos en texto plano (claves privadas SSH/GPG, tokens, contraseñas).
- El script `05-instalar-ssh.sh` genera claves SSH locales: la clave **privada nunca** debe salir de la máquina ni subirse al repositorio.
- Comparte credenciales fuera de banda; nunca por git, email en texto plano ni chat público.
- Si un secreto se expone por error, **rótalo de inmediato** — asume que ya está comprometido.

## Dependencias

- Este proyecto no tiene dependencias empaquetadas; sus "dependencias" son las herramientas externas que instala y las GitHub Actions usadas en CI.
- Las actualizaciones de las Actions se gestionan con **Dependabot** (`.github/dependabot.yml`), con PRs revisados por humanos antes del merge.

## Prácticas de Desarrollo Seguro

- Preferir repositorios oficiales y claves GPG verificadas al añadir fuentes APT.
- Evitar `curl | bash` de fuentes no confiables; cuando se use, documentar la fuente oficial.
- Mantener el principio de mínimo privilegio: usar `sudo` solo donde sea imprescindible.
- Revisar con `shellcheck` cada script antes del merge (check bloqueante en CI).

## Contacto

- **Reportes de seguridad**: <brayandiazc@gmail.com> (asunto: `Security: …`)
- **Consultas generales**: <brayandiazc@gmail.com>

---

> Versión: 1.0 — Última actualización: 2026-07-03
