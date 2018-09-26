pragma solidity ^0.4.24;

contract ValidContract {

    constructor() {

    }

    function() public payable {
        emit PaidIn(msg.sender, msg.value);
    }

    event PaidIn(address indexed _from, uint256 _value);
}
