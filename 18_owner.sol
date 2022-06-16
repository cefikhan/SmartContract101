//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

contract saffi {
    address public owner = msg.sender;
    uint256 public value = msg.value;
    constructor()payable{}
}

