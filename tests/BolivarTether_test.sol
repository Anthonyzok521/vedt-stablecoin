// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.20 <0.9.0;

// Importamos las herramientas de testing de Remix y tu contrato
import "remix_tests.sol";
import "../contracts/BolivarTether.sol";

// El contrato de test HEREDA de tu moneda para poder probarla directamente
contract BolivarTetherTest is BolivarTether {

    // Al iniciar el test, este contrato se convierte en el "Dueño" (address(this))
    constructor() BolivarTether(address(this)) {}

    // Test 1: Verificar que los datos iniciales del token sean correctos
    function testInitialValues() public {
        Assert.equal(name(), "Bolivar Tether", "El nombre del token no coincide (revisa espacios)");
        Assert.equal(symbol(), "VEDT", "El simbolo del token no coincide");
        Assert.equal(decimals(), 18, "Los decimales deberian ser 18");
        Assert.equal(totalSupply(), 0, "El suministro inicial debe ser cero");
    }

    // Test 2: Verificar que podemos crear (Mint) dinero nuevo
    function testMinting() public {
        uint256 amountToMint = 1000 * 10**decimals(); // 1000 VEDT

        // Ejecutamos la función mint
        mint(address(this), amountToMint);

        // Verificamos que el balance y el total hayan subido
        Assert.equal(balanceOf(address(this)), amountToMint, "El balance no aumento correctamente tras el mint");
        Assert.equal(totalSupply(), amountToMint, "El suministro total no aumento correctamente");
    }

    // Test 3: Verificar que podemos destruir (Burn) dinero
    function testBurning() public {
        // Se supone que ya tenemos 1000 del test anterior. Quememos 200.
        uint256 initialBalance = balanceOf(address(this));
        uint256 amountToBurn = 200 * 10**decimals();

        // Ejecutamos la función burn
        burn(address(this), amountToBurn);

        // Deberían quedar 800 (1000 - 200)
        uint256 expectedBalance = initialBalance - amountToBurn;

        Assert.equal(balanceOf(address(this)), expectedBalance, "El balance no disminuyo correctamente tras el burn");
    }
}