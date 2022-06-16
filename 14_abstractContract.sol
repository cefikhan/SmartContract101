//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;
 abstract contract saffi{
     
    function dance() public virtual returns(uint256 x);
}

contract ali is saffi{
        function queue() external {}

}

// https://jeancvllr.medium.com/solidity-tutorial-all-about-contracts-e8e30bd1b289#:~:text=The%20this%20keyword%20in%20Solidity,address%3A%20address(this)%20%60