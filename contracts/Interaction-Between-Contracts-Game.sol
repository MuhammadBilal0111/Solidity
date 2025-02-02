// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;
// To extablish the communication between the two contract
// the contract that want to communicate or use the specific functionality of other contract
// The contract must have
// 1. Interface of the other contract
// 2. Define the contructor to initialize the address to the contract that you want to communicate

interface IUser {
    function createPlayer(address _playerAddress, string memory _playerName) external; // means that the Game contract want to use the create Player function
}
contract Game{
    uint public gameCount;
    IUser public userContract;
    constructor(address _userContractAddress){
        userContract = IUser(_userContractAddress); // initialize the connection of user contract
    }
    // connection is establish

    function startGame(string memory _userName) public {
        userContract.createPlayer(msg.sender, _userName);
        gameCount++;
    }
}