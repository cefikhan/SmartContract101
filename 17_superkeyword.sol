//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;



contract governor{
    function CallFoo() public view returns (string memory){
        return Foo();
    }
    function Foo() internal virtual view returns(string memory){
        return "I am governor";
    }
}

contract TimeLock is governor{
    function Foo() internal virtual override view returns(string memory){
        return "I am timelock";
    }
}

contract GovernorContract is governor,TimeLock{

    function Foo() internal override(governor,TimeLock) view returns(string memory){
        return super.Foo();
    }
    
}