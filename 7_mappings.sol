//SPDX-License-Identifer:MIT
pragma solidity ^0.8.0;

contract map{
    
    mapping(uint256=>mapping(string=>bool)) public present;

    function setmapping()public{
        present[1]["saffi"]=true;
    }


    mapping(uint256=>address[]) public bidAddresses;
    function push()public{
    bidAddresses[0].push(address(123));
    bidAddresses[0].push(address(444));
    bidAddresses[1].push(address(555));
    }


}