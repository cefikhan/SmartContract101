//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

contract A {

 struct Checkpoint {
        uint256 fromBlock;
        uint256 votes;
    }

    Checkpoint[] public arr;

function push() public {
    Checkpoint memory chkp =  Checkpoint(10,356);
    Checkpoint memory chkp2 =  Checkpoint(17,1000);
    Checkpoint memory chkp3 =  Checkpoint(19,777);
    Checkpoint memory chkp4 =  Checkpoint(56,999);

    arr.push(chkp);
    arr.push(chkp2);
    arr.push(chkp3);
    arr.push(chkp4);


}

function call()public view returns(uint256){
    return _checkpointsLookup(arr,17);
}


  function average(uint256 a, uint256 b) internal pure returns (uint256) {
      
        // (a + b) / 2 can overflow.
        return (a & b) + (a ^ b) / 2;
    }

//barr = [ (10,356);   (17,1000);    (19,777);   (56,999);]

       function _checkpointsLookup(Checkpoint[] storage ckpts, uint256 blockNumber) private view returns (uint256) {
        uint256 high = ckpts.length;
        uint256 low = 0;
        while (low < high) {
            uint256 mid = average(low, high);
            if (ckpts[mid].fromBlock > blockNumber) {
                high = mid;
            } else {
                low = mid + 1;
            }
        }
        return high == 0 ? 0 : ckpts[high - 1].votes;
    }

}

