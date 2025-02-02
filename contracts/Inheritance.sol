// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract MultiplayerGame {
    mapping(address => bool) public players;

    function joinGame() public virtual { // virtual function due to polymorphism
        players[msg.sender] = true;
    }
}

// Game contract inheriting from MultiplayerGame
contract Game is MultiplayerGame{
    string public gameName;
    uint256 public playerCount;

    constructor(string memory _gameName) {
        gameName = _gameName;
        playerCount = 0;
    }

    function startGame() public {
        
    }

    function joinGame() public override {
       super.joinGame(); // calls the parent joinGame function
        playerCount++;
    }
}