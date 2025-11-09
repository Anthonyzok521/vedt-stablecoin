# VEDT - Bolívar Tether (Stablecoin)

![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)
![Network: BNB Testnet](https://img.shields.io/badge/Network-BNB%20Smart%20Chain%20Testnet-blue)
![Status: MVP](https://img.shields.io/badge/Status-MVP%20%2F%20Proof%20of%20Concept-orange)

## 🇻🇪 Visión

**VEDT (Bolívar Tether)** es una prueba de concepto para una *stablecoin* centralizada vinculada al valor del Dólar Estadounidense (USD), pero diseñada para operar con liquidez inmediata en Bolívares (VES).

El objetivo es proporcionar una herramienta financiera resistente a la censura y de fácil acceso para los venezolanos, permitiendo transacciones rápidas y ahorro estable utilizando la tecnología blockchain, mientras se mantiene un puente directo con el sistema bancario nacional.

## ⚙️ Características Técnicas

Este proyecto implementa un token **ERC-20** estándar en la red BNB Smart Chain (compatible con EVM), utilizando las librerías de **OpenZeppelin** para garantizar la máxima seguridad.

* **Peg (Anclaje):** 1 VEDT ≈ $1 USD (Redimible en VES a la tasa del día).
* **Mintable & Burnable:** El suministro es elástico, adaptándose 1:1 a las reservas fiduciarias custodiadas.
* **Pausable:** Mecanismo de seguridad para congelar transferencias en caso de emergencia.
* **Blacklist:** Cumplimiento normativo básico para bloquear direcciones involucradas en actividades ilícitas.
* **Owner-Controlled:** Actualmente, la emisión y quema están centralizadas en una dirección administrativa para esta fase de MVP.

## 🚀 Despliegue (Testnet)

El contrato se encuentra actualmente desplegado en la **BNB Smart Chain Testnet** para fines de prueba y desarrollo.

| Parámetro | Valor |
| :--- | :--- |
| **Red** | BNB Smart Chain Testnet (Chain ID: 97) |
| **Dirección del Contrato** | `0x1a3bd3aa37bcafbdc0ebd9d54ab6ebaf01b157ab` |
| **Símbolo** | VEDT |
| **Decimales** | 18 |
| **Explorador** | [Ver en BscScan](https://testnet.bscscan.com/address/0x1a3bd3aa37bcafbdc0ebd9d54ab6ebaf01b157ab) |

## 🛠️ Instalación y Pruebas (Para Desarrolladores)

Si deseas interactuar con este proyecto localmente:

### Requisitos
* Node.js v18+
* Remix IDE (recomendado para pruebas rápidas) o Hardhat.

### Pasos
1.  Clona el repositorio:
    ```bash
    git clone https://github.com/Anthonyzok521/vedt-stablecoin.git
    ```
2.  Instala las dependencias (si se migra a entorno local con Hardhat/Truffle):
    ```bash
    npm install
    ```
3.  Para desplegar en testnet, configura tus variables de entorno en un archivo `.env` (ver `.env.example`) y ejecuta el script de despliegue (pendiente de implementación en repo público).

## 🗺️ Roadmap (Hoja de Ruta)

* [x] **Fase 1 (Actual):** Desarrollo del contrato inteligente MVP y despliegue en Testnet.
* [ ] **Fase 2:** Desarrollo de dApp (Frontend) para facilitar la interacción del usuario (Consulta de saldo, simulación de canje).
* [ ] **Fase 3:** Implementación de Backend para automatización de escuchas bancarias (Proof of Concept de rampa Fiat).
* [ ] **Fase 4:** Auditoría de seguridad y despliegue en Mainnet.

## ⚠️ Disclaimer

Este es un proyecto experimental en fase de desarrollo (MVP). **VEDT en Testnet NO tiene valor real.** No utilices este código en producción (Mainnet) sin una auditoría profesional previa. El autor no se hace responsable por el uso indebido de este código.

---
Hecho con 🧡 para Venezuela por [@Anthonyzok521](https://github.com/Anthonyzok521).