//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

contract MyContract {
    uint256 public value = 10;
    function someFun() public {
        (bool success,  ) = address(this).call{value: 0 ether}(abi.encodeWithSignature("someOtherFunction(uint256)", 123));
        require(success, "Contract execution Failed");
    }
    
    function someOtherFunction(uint _myVar) public {
        //do something
        value =_myVar;
    }
}