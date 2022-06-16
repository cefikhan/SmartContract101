//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

contract checkStruct{
    // struct item{
    //     uint256 id;
    //     mapping(uint256=>uint256) ages;
    // } NOT POSSIBLE

    struct item{
        address x;
        uint256 value;
    }
    mapping (uint256 => item[]) public biddersAndValues;
    mapping(string => uint256[]) public checker;
    mapping(uint256=>string[][]) public bidsValues;

    function setItems() public {
        // biddersAndValues[0].push(item( address(213),
        // 32 ));
     

        bidsValues[0].push(["rehman"]["ali"]);

    }
}