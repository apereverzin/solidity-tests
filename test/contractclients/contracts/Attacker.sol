pragma solidity ^0.4.24;

contract Attacker {

    constructor() {

    }

    function() public payable {
        revert();
    }
}
