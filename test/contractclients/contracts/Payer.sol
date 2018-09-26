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

    function registerClient(address client) public {
        require(registeredClients[client] == 0);

        clients[clientCount] = client;
        clientCount++;
        registeredClients[client] == 1;

        emit ClientRegistered(client);
    }

    function distribute() public {
        uint256 val = 1000000000;
        for (uint i = 0; i < clientCount; i++) {
            address clientAddr = clients[i];
            clientAddr.transfer(val);
            emit Distributed(clientAddr, val);
        }
    }

    function distributeConsiderably() public {
        uint256 val = 1000000000;
        for (uint i = 0; i < clientCount; i++) {
            address clientAddr = clients[i];
            if (clientAddr.send(val)) {
                emit Distributed(clientAddr, val);
            } else {
                emit DistributionFailed(clientAddr, val);
            }
        }
    }

event PaidIn(address indexed _from, uint256 _value);

    event ClientRegistered(address indexed _client);

    event Distributed(address indexed _client, uint256 _value);

    event DistributionFailed(address indexed _client, uint256 _value);
}
