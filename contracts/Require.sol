// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;
contract Twitter{
    uint256 public MAX_TWEET_LENGTH = 200;
    // define the structs
    struct TwitterStruct {
        address author;
        string content;
        uint256 timestamp;
        uint256 likes;
    }
    mapping(address=>TwitterStruct[]) public tweets;

    function creatTweets(string memory _tweets) public  {
        // if tweet.length<200 then we are good otherwise revert
        // 1 character is 1 byte
        require(bytes(_tweets).length >= MAX_TWEET_LENGTH, "Tweet is too long bro!"); // if tweet content is too long revert no node execute
        TwitterStruct memory newTweet = TwitterStruct({ // when you create instance of struct solidity store in temporary memory
            author:msg.sender,
            content:_tweets,
            timestamp:block.timestamp,
            likes:0
        });
        tweets[msg.sender].push(newTweet);
    }
    function getTweets(uint256 _i) public view returns (TwitterStruct memory) {
        return tweets[msg.sender][_i];
    }
    function getAllTweets(address _owner) public view returns (TwitterStruct[] memory) {
        return tweets[_owner];
    }
}