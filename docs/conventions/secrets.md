# Convenciones de manejo de secretos

> Cómo se tratan claves y credenciales en dev-setup-ubuntu-es.
> **Última actualización**: 2026-07-03

## Alcance

Claves SSH y GPG generadas o usadas por los scripts, y cualquier credencial que
un contribuidor pueda manejar al probar o extender el proyecto.

## Reglas

- **Nunca** commitees secretos en texto plano: claves privadas SSH/GPG, tokens,
  contraseñas. El [`.gitignore`](../../.gitignore) excluye `*.pem`, `*.key` e
  `id_rsa`, pero la responsabilidad final es de quien commitea.
- La clave **privada** SSH que genera `05-instalar-ssh.sh` **nunca** sale de la
  máquina. Solo se comparte la clave **pública** con GitHub.
- Comparte credenciales fuera de banda (nunca por git, email en texto plano ni
  chat público).
- Si un secreto se expone por error, **rótalo de inmediato** — asume que ya está
  comprometido; reescribir la historia no basta.
- En CI, los secretos viven como **GitHub Actions Secrets** cifrados, no en el
  repositorio.

## Referencias

- [Conectar a GitHub con SSH](https://docs.github.com/en/authentication/connecting-to-github-with-ssh)
- [`../../SECURITY.md`](../../SECURITY.md)
