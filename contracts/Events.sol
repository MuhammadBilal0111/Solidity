// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

// Events
// notification for the blockchain
// notifying someone what is happening in the blockchain

// function(Logic + Event(firing off the event))
// 1. Create an event
// 2. Emit that event
// indexed define that cache the indexed in that data. this allow to filter the data quickly

contract EventsExample {
    event NewUserRegistered(address indexed user,string username); // define it in the contract
    // indexing because we want to get the data faster
    struct User{
        string username;
        uint256 age;
    }
    mapping(address=>User) public users;

    function registerUser(string memory _username, uint256 _age) public {
        User memory newUser = users[msg.sender];
        newUser.username=_username;
        newUser.age=_age;
        emit NewUserRegistered(msg.sender,_username);
    }
}
// you have to verify and publish your contract
// verify through etherscan that it is your contract
// compiler type (single file)
// give the solidity contract code
// it will generate live code and generate contract ABI
// code appear in the etherscane
