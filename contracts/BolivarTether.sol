/*title: BolivarTether (VEDT)
* author: Anthony Carrillo
* org: Advanced Community
* web: https://acteam.dev
* contact: anthony@acteam.dev
* date: 09-11-2025 (VET UTC-4)
*/

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Pausable.sol";

contract BolivarTether is ERC20, Ownable, Pausable {
    // Mapeo para la lista negra (usuarios bloqueados)
    mapping(address => bool) public isBlacklisted;

    // Eventos para transparencia
    event FundsMinted(address indexed to, uint256 amount);
    event FundsBurned(address indexed from, uint256 amount);
    event UserBlacklisted(address indexed user);
    event UserUnBlacklisted(address indexed user);

    constructor(address initialOwner)
        ERC20("Bolivar Tether", "VEDT")
        Ownable(initialOwner)
    {}

    // Función para crear nuevos VEDT. SOLO EL DUEÑO PUEDE HACERLO.
    // Se llama cuando recibes Bs y ya los aseguraste en moneda fuerte.
    function mint(address to, uint256 amount) public onlyOwner {
        require(!isBlacklisted[to], "Usuario en lista negra");
        _mint(to, amount);
        emit FundsMinted(to, amount);
    }

    // Función para destruir VEDT.
    // Se llama cuando el usuario te devuelve los tokens para pedir sus Bs.
    function burn(address from, uint256 amount) public onlyOwner {
         require(!isBlacklisted[from], "Usuario en lista negra");
        _burn(from, amount);
        emit FundsBurned(from, amount);
    }

    // Funciones de seguridad (Pausa de emergencia)
    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    // Funciones de Lista Negra
    function blacklistUser(address user) public onlyOwner {
        isBlacklisted[user] = true;
        emit UserBlacklisted(user);
    }

    function unBlacklistUser(address user) public onlyOwner {
        isBlacklisted[user] = false;
        emit UserUnBlacklisted(user);
    }

    // Sobrescribimos la función de transferencia para aplicar Pausa y Blacklist
    // Esta función se ejecuta AUTOMÁTICAMENTE cada vez que alguien intenta mover VEDT.
    function _update(address from, address to, uint256 value) internal virtual override whenNotPaused {
        require(!isBlacklisted[from], "Remitente en lista negra");
        require(!isBlacklisted[to], "Destinatario en lista negra");
        super._update(from, to, value);
    }
}