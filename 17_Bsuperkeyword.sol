//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;



contract governor{
    event Log(string message);
    function CallFoo() public  {
         Foo();

      emit Log("CallFoo from Governor");
    }
    function Foo() internal virtual {
          emit Log("Foo from Governor");
    }
}

contract TimeLock2 is governor{
        
       function Foo() internal virtual override  {
         emit Log("Foo from TimeLock2");
    }
}



contract TimeLock is governor{
    function Foo() internal virtual override  {
            emit Log("Foo from TimeLock");
    }
}

contract BovernorContract is TimeLock,TimeLock2{

    function Foo() internal override(TimeLock2,TimeLock) {
            emit Log("Foo from BovernorContract");
         super.Foo();
    }
    
}