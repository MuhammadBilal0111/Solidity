// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Twitter{
    struct Tweet{
        uint256 id;
        address owner;
        uint256 timestamp;
        string content;
        uint256 likes;
    }
    uint256 public MAX_TWEET_LENGTH = 200;
    address public _owner;
    mapping(address=>Tweet[]) public tweet;

    constructor(){ // when we deploy the contract it get executed
        _owner = msg.sender;
    }
    modifier onlyOwner(){
        require(_owner == msg.sender,"You are not an owner");
        _; // rest of the code will run
    }
    function createTweet(string memory _tweet) public {
        Tweet memory newTweet = Tweet({
            id:tweet[msg.sender].length,
            owner:msg.sender,
            timestamp:block.timestamp,
            content: _tweet,
            likes:0
        });
        tweet[msg.sender].push(newTweet);
    }
    function getAllTweets(address owner) public view returns(Tweet[] memory) {
        return tweet[owner];
    }
    function getTweet(uint256 _i) public view returns (Tweet memory ){
        return tweet[msg.sender][_i];
    }
    function changeTweetLength(uint256 newTweetLength) public onlyOwner {
        MAX_TWEET_LENGTH=newTweetLength; // we cannot modify the constant variable
    }
    function likeTweet(address author,uint256 id) external  {
        require(tweet[author][id].id == id,"Tweet does not exist");
        tweet[author][id].likes++;
    }
    function dislikeTweet(address author, uint256 id) external {
        require(tweet[author][id].id==id, "Tweet does not exist");
        require(tweet[author][id].likes>0, "Tweet has no like");
        tweet[author][id].likes--;
    }
}
// we use sepolia network to deploy the contract
// to_ -> contract address