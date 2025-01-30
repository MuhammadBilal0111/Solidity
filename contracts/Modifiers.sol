// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Test {
    address public owner;

    constructor(){
        owner = msg.sender;
    }
    modifier OnlyOwner(){
        require(msg.sender == owner,"You are not allowed to change the Ownership!");
        _;
    }
    function changeOwnerShip(address newOwner) public {
        owner=newOwner;
    }
}






// Add behavior to a function
// i.e you have to be an owner for accessing the function
// separate little function into the main function
// when you deploy the contract to the blockchain the constructor will be called once
// _; means the next or other function will get executed