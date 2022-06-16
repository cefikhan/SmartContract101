//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

contract xaesh{
    uint256[] private arr = [1,2,3,4];
    function removebyshift(uint256 index) public {
    for(uint256 i = index;i<arr.length-1;i++){
            arr[i]=arr[i+1];
      }
      arr.pop();
    }
    function getLength() public view returns(uint256){
        return arr.length;
    }

    function removenoshift(uint256 index)public{
        arr[index] = arr[arr.length-1];
        arr.pop();
    }
}