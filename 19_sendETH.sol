//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

contract saffi {
    constructor()  payable{}
    function getBlc() public view returns(uint256){
        return address(this).balance;
    }
}