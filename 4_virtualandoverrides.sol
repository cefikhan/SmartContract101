//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;
import "hardhat/console.sol";

contract A {
 
    function internalgreetings() internal virtual view returns(string memory){
        console.log("Greetings from A");
        return "hello internal greetings from B";
    }

}
contract C is A{
 
    function internalgreetings() internal virtual override view returns(string memory){
super.internalgreetings();
        console.log("Greetings from C");
        return "hello internal greetings from C";
    }

}

contract B is C{
  

      function printinternal() public view returns (string memory){
   
       return super.internalgreetings();
    }
      function internalgreetings() internal  view override returns(string memory){
        return "hello internal greetings from B overriden";
    }


}