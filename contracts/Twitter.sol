// SPDX-License-Identifier: MIT
pragma solidity  ^0.8.26;

contract Twitter{
    mapping(address => string) public tweets; // tweets made with the user wallet address
    // wallet address maps to the tweets
    
    function createTweets(string memory _tweet) public{ // storing the _tweet in temporary memory
        tweets[msg.sender]=_tweet; // address ->  msg.sender
        // msg.sender coming from blockchain msg 
        // when you interact with blockchain your address and store info store in msg
        // .sender is simply the wallet address
    }
    function getTweets(address _owner) public view returns (string memory){ // before returninfg the string store it temporarily in string
        return tweets[_owner];
        // view b/c you aren't modifying the data and it make solidity gess efficient
    }
}