//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

contract X {
    uint256 public x=0;
    uint public i=0;
    //below syntax not possible
    for i in range(0,10){
        x=x+1;
    }
}