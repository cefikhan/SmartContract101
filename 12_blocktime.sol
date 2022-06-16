//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;
import "hardhat/console.sol";
contract waow{

function getTime() public view {
    console.log(block.timestamp);
}

}