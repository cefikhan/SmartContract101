//SPDX-License-Identifer:MIT
pragma solidity ^0.8.0;
// import "hardhat/console.sol";
import  "hardhat/console.sol";

contract studythiskeyword{

function getContractAddress() public view returns (address) {
    return address(this);
}
function getContractBalance() public view returns (uint) {
    return address(this).balance;
}
// get function signature of `getContractBalance()`
function getFunctionSelector() public pure returns(bytes4) {
    return this.getContractBalance.selector;
}



}


// The function signature is the function name with the parameter types, as shown below:

// createLime(string,uint8,uint8,uint8);