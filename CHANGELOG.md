# Changelog

Todos los cambios notables en este proyecto serán documentados en este archivo.

El formato se basa en [Keep a Changelog](https://keepachangelog.com/es-ES/1.0.0/),
y este proyecto se adhiere a [Semantic Versioning](https://semver.org/lang/es/).

## [Unreleased]

### Added
- Implementación inicial del token `BolivarTether` (VEDT) como un ERC20.
- Funciones de `mint` y `burn` restringidas al propietario (`Ownable`) para gestión centralizada de la oferta.
- Mecanismo de lista negra (`blacklist`) para bloquear direcciones específicas en caso de actividad ilícita.
- Funcionalidad de pausa (`Pausable`) para detener todas las transferencias en caso de emergencia.
- Tests unitarios integrales (`BolivarTether_test.sol`) cubriendo valores iniciales, emisión y quema.
- Integración con contratos estándar de OpenZeppelin (ERC20, Ownable, Pausable).