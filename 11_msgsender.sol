//SDPX-License-Identifier:MIT
pragma solidity ^0.8.0;
import  "hardhat/console.sol";

contract A{

function AfunctionInAcalledfromA() public view{
    console.log("I am AfunctionInAcalledfromA my msg sender is ",msg.sender);
}

    function fromA()public view{

        //msg sender is address of B
        console.log("I am in A my msg sender is ",msg.sender);
    }


     function CallerfromA()public view{

        //msg sender is address of B
        console.log("I am CallerfromA my msg sender is ",msg.sender);
        AfunctionInAcalledfromA();
    }
}

// 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
contract B{
    A obj;

constructor()payable{}


    function callAkafunction()public {
        obj = A(0xf8e81D47203A594245E36C48e151709F0C19fBe8);
        console.log("I am in B my msg sender is ",msg.sender);
           obj.fromA();
    }
}



