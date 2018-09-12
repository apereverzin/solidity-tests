pragma solidity ^0.4.24;

contract Payer {
    address public owner;

    constructor(address _owner) public {
        owner = _owner;
    }

    function() public payable {
        emit PaidIn(msg.sender, msg.value);
    }

    function unsafePay() public {
        msg.sender.call.value(200)();

        emit Repaid(msg.sender, msg.value);
    }

    function safePay() public {
        msg.sender.transfer(200);

        emit Repaid(msg.sender, msg.value);
    }

    event PaidIn(address indexed _from, uint256 _value);

    event Repaid(address indexed _to, uint256 _value);
}
