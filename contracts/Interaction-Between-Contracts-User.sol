// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract User{
    struct Player{
        address playerAddress;
        string playerName;
        uint256 score;
    }
    mapping(address => Player) public players;

    function createPlayer(address _playerAddress, string memory _playerName) external {
        require(players[_playerAddress].playerAddress == address(0),"User already exist");
        Player storage newPlayer = players[_playerAddress];
        newPlayer.playerAddress=_playerAddress;
        newPlayer.playerName=_playerName;
    }
}