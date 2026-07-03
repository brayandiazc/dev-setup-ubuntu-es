# 0004. Instalar desde fuentes oficiales (repositorios, PPA y claves GPG)

- **Estado**: Aceptada
- **Fecha**: 2026-07-03
- **Decisores**: Brayan Diaz C

## Contexto y problema

En Ubuntu, muchas herramientas (Git, PostgreSQL, Docker, Terraform) están en los
repositorios por defecto de APT, pero en versiones antiguas. Instalar la última
versión estable requiere añadir fuentes externas, lo que abre la puerta a la
suplantación de paquetes si no se verifica su origen.

## Opciones consideradas

- **Paquetes por defecto de APT** — cómodos, pero desactualizados.
- **`curl | bash` de instaladores de terceros** — última versión, pero difícil de
  auditar y con riesgo de ejecutar código no verificado.
- **Repositorios/PPA oficiales con clave GPG verificada** — última versión desde la
  fuente del proveedor, con verificación de integridad.

## Decisión

Instalamos desde **fuentes oficiales verificadas**: PPA/repositorios del proveedor
(Git, PostgreSQL, Docker, HashiCorp) añadiendo su **clave GPG** antes del
repositorio APT. Cuando un proveedor solo ofrece instalador por script (SDKMAN!),
se usa su URL oficial por HTTPS y se documenta.

## Consecuencias

**Positivas:**

- Se obtienen versiones actuales directamente del proveedor.
- La clave GPG garantiza la integridad y el origen de los paquetes.

**Negativas / costos:**

- Cada fuente añade pasos (clave + repositorio) y hay que mantener las URLs.
- Si un proveedor rota su clave, el script debe actualizarse.

**Neutras / a vigilar:**

- Revisar periódicamente que las claves y repositorios sigan vigentes.

## Referencias

- [`../conventions/secrets.md`](../conventions/secrets.md)
- [`../../SECURITY.md`](../../SECURITY.md)
