// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Pair is ERC20 {
    address public immutable token0; // همیشه ETH (address(0))
    address public immutable token1; // توکن ERC20
    uint256 public reserve0; // ذخیره ETH
    uint256 public reserve1; // ذخیره توکن ERC20

    constructor(address _token1) ERC20("Liquidity Pool Token", "LP") {
        token0 = address(0); // ETH
        token1 = _token1; // توکن انتخابی
    }

    function addLiquidity(uint256 amount1) external payable returns (uint256 liquidity) {
        // دریافت ETH از msg.value
        require(msg.value > 0, "Must send ETH");
        require(amount1 > 0, "Must send token");

        // انتقال توکن ERC20
        IERC20(token1).transferFrom(msg.sender, address(this), amount1);

        // آپدیت ذخایر
        reserve0 += msg.value;
        reserve1 += amount1;

        // محاسبه LP tokens
        liquidity = sqrt(msg.value * amount1);
        _mint(msg.sender, liquidity);

        return liquidity;
    }

    function getReserves() external view returns (uint256 _reserve0, uint256 _reserve1) {
        return (reserve0, reserve1);
    }

    function sqrt(uint256 y) internal pure returns (uint256 z) {
        if (y > 3) {
            z = y;
            uint256 x = y / 2 + 1;
            while (x < z) {
                z = x;
                x = (y / x + x) / 2;
            }
        } else if (y != 0) {
            z = 1;
        }
        return z;
    }

    // برای دریافت ETH
    receive() external payable {}
}