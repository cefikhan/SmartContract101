//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

contract TimeLock{
    error NotOwnerError();
    error AlreadyQueuedError(bytes32 txId);
    error TimestampNotInRangeError(uint blockTimestamp,uint timestamp);
    error NotQueuedError(bytes32 txId);
    error TimestampNotPassedError(uint blockTimestmap, uint timestamp);
        error TimestampExpiredError(uint blockTimestamp, uint expiresAt);


event Queue(
bytes32 indexed txId,
    address indexed target,
    uint value,
    string  func,
    bytes  data,
    uint timestamp
);


    address owner;
    mapping(bytes32=>bool) public queued;

        uint public constant MIN_DELAY = 10; // seconds
    uint public constant MAX_DELAY = 1000; // seconds
        uint public constant GRACE_PERIOD = 1000; // seconds


    constructor(){
        owner = msg.sender;
    }

    modifier onlyOwner(){
        if(msg.sender != owner){
         revert NotOwnerError();
        }
        _;
    }


receive() external payable {

}



    function getTxId(
        address _target,
        uint _value,
        string calldata _func,
        bytes calldata _data,
        uint _timestamp
    )public pure returns (bytes32 txId){
        return keccak256(abi.encode(_target,_value,_func,_data,_timestamp));

    }





    function queue(
            address _target,
            uint _value,
            string calldata _func,
            bytes calldata _data,
            //after this timestamp the transaction can be executed
            uint _timestamp
    ) external onlyOwner{

bytes32 txId = getTxId(_target,_value,_func,_data,_timestamp);
if(queued[txId]){
    revert AlreadyQueuedError(txId);
}

if(_timestamp<block.timestamp+MIN_DELAY||_timestamp>block.timestamp + MAX_DELAY){
    revert TimestampNotInRangeError(block.timestamp,_timestamp);
}




queued[txId]=true;
emit Queue(txId,_target,_value,_func,_data,_timestamp);

    }


    function execute(
           address _target,
            uint _value,
            string calldata _func,
            bytes calldata _data,
            //after this timestamp the transaction can be executed
            uint _timestamp
    ) external payable onlyOwner returns (bytes memory)
    {
        bytes32 txId = getTxId(_target,_value,_func,_data,_timestamp);


    if (!queued[txId]) {
            revert NotQueuedError(txId);
        }

  if (block.timestamp < _timestamp) {
            revert TimestampNotPassedError(block.timestamp, _timestamp);
        }
   if (block.timestamp > _timestamp + GRACE_PERIOD) {
            revert TimestampExpiredError(block.timestamp, _timestamp + GRACE_PERIOD);
        }

          queued[txId] = false;

        // prepare data
        bytes memory data;
        if (bytes(_func).length > 0) {
            // data = func selector + _data
            data = abi.encodePacked(bytes4(keccak256(bytes(_func))), _data);
        } else {
            // call fallback with data
            data = _data;
        }

        // call target
        (bool ok, bytes memory res) = _target.call{value: _value}(data);

    }
}

contract TestTimeLock{
    address public timelock;
    constructor(address _timelock){
        timelock= _timelock;
    }
    function test() external {
        require(msg.sender==timelock);
    }
}
