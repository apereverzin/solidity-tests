pragma solidity ^0.4.24;

contract Payer {
    address public owner;

    mapping (uint => address) public clients;

    mapping (address => uint) public registeredClients;

    uint public clientCount = 0;

    constructor(address _owner) public {
        owner = _owner;
    }

    function() public payable {
        emit PaidIn(msg.sender, msg.value);
    }

    function registerClient() public {
        require(registeredClients[msg.sender] == 0);

        clients[clientCount] = msg.sender;
        clientCount++;
        registeredClients[msg.sender] == 1;

        emit ClientRegistered(msg.sender);
    }

    event PaidIn(address indexed _from, uint256 _value);

    event ClientRegistered(address indexed _client);
}
