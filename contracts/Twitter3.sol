// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;
contract Twitter{
    // define the structs
    struct TwitterStruct {
        address author;
        string content;
        uint256 timestamp;
        uint256 likes;
    }
    mapping(address=>TwitterStruct[]) public tweets;

    function creatTweets(string memory _tweets) public  {
        TwitterStruct memory newTweet = TwitterStruct({ // when you create instance of struct solidity store in temporary memory
            author:msg.sender,
            content:_tweets,
            timestamp:block.timestamp,
            likes:0
        });
        tweets[msg.sender].push(newTweet);
    }
    function getTweets(address _owner, uint256 _i) public view returns (TwitterStruct memory) {
        return tweets[_owner][_i];
    }
    function getAllTweets(address _owner) public view returns (TwitterStruct[] memory) {
        return tweets[_owner];
    }
}