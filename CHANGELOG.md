# Changelog

Todos los cambios notables de este proyecto se documentan en este archivo.

El formato se basa en [Keep a Changelog](https://keepachangelog.com/es-ES/1.1.0/)
y este proyecto adhiere a [Semantic Versioning](https://semver.org/lang/es/).

## [Unreleased]

### Added

### Changed

### Deprecated

### Removed

### Fixed

### Security

## [1.0.0] - 2026-07-03

### Added

- Instalador de Java LTS con SDKMAN! (`09-instalar-java.sh`).
- Estructura de documentación y gobernanza basada en la plantilla de proyectos:
  `CONTRIBUTING.md`, `CODE_OF_CONDUCT.md`, `SECURITY.md`, `CHANGELOG.md`,
  `.editorconfig` y `.gitignore`.
- Carpeta `docs/` con índice, glosario, arquitectura, decisiones (ADRs),
  convenciones (shell scripting, tooling de calidad, secretos) y roadmap.
- Configuración de `.github/`: plantillas de issues y de Pull Request,
  `dependabot.yml`, `labeler.yml`, guía de labels y workflow de CI con `shellcheck`.

### Changed

- Reordenados los scripts al flujo de la saga de entornos de desarrollo:
  node (06) → python (07) → ruby (08) → java (09) → postgresql (10) →
  docker (11) → terraform (12) → kubernetes (13).
- README reescrito alineado a la estructura de la plantilla (tabla de contenidos,
  badges, enlaces de gobernanza y sección de versionado).

<!--
Enlaces de comparación entre versiones:
[Unreleased]: https://github.com/brayandiazc/dev-setup-ubuntu-es/compare/v1.0.0...HEAD
[1.0.0]: https://github.com/brayandiazc/dev-setup-ubuntu-es/releases/tag/v1.0.0
-->
