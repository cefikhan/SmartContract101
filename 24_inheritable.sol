//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

contract A{
    uint256 public val = 123;
}

contract B is A{
    function getVal() public view returns(uint256){
        return val;
    }
}