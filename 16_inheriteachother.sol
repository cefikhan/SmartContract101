//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;


contract A{
    function foo() public virtual view returns(string memory){
        return "I am A";
    }
}


contract B is A{
    function foo() public virtual override view returns(string memory){
        return "I am B";
    }
}

contract C is A,B{
        function foo() public  override(A,B) view returns(string memory){
        return "I am C";
    }
}