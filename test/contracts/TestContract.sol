pragma solidity ^0.4.24;

contract TestContract {
    address public owner;

    constructor()
    public {
        owner = msg.sender;
    }

    function() public payable {
        emit Paid(msg.sender, msg.value);
    }

    function kill() public {
        emit Killed(msg.sender);

        selfdestruct(owner);
    }

    event Paid(address indexed _from, uint256 _value);

    event Killed(address indexed _from);
}
