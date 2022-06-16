//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

contract checkme{
    uint256 public lock = 10;
    uint256 public x = 12;
    function checkRevert() public {
        lock = 33;
        // require(x==15,"reverted check the value of lock");
    }
}