// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Twitter{
    uint public MAX_TWEET_LENGTH = 200;
    struct Tweet{
        uint256 id;
        address author;
        string content;
        uint256 timestamp;
        uint256 likes;
    }
    address public _owner;

    event TweetCreated(uint256 id, address author, string content, uint256 timestamp);
    event TweetLiked(address liker, address tweetAuthor,uint256 tweetId, uint256 newLikeCount);
    event TweetDisliked(address disLiker, address tweetAuthor,uint256 tweetId, uint256 newDisikeCount);

    constructor(){
        _owner=msg.sender;
    }
    mapping(address=>Tweet[]) public tweets;

    modifier onlyOwner(){
        require(_owner == msg.sender,"You are not registered");
        _;
    }
    function createTweet(string memory _tweet) public {
        require(bytes(_tweet).length >= MAX_TWEET_LENGTH,"Tweet is too long!");
        Tweet memory newTweet = Tweet({
            id:tweets[msg.sender].length,
            author:msg.sender,
            content:_tweet,
            timestamp:block.timestamp,
            likes:0
        });
        tweets[msg.sender].push(newTweet);
        emit TweetCreated(newTweet.id,newTweet.author,newTweet.content,newTweet.timestamp);
    }
    function getAllTweets() public view returns (Tweet[] memory){
        return tweets[msg.sender];
    }
    function getTweet(uint256 _i) public view returns (Tweet memory) {
        return tweets[msg.sender][_i];
    }
    function likedTweet(address author, uint256 id) external {
        require(tweets[author][id].id==id,"Tweet does not exist");
        tweets[author][id].likes++;
        emit TweetLiked(msg.sender,author,id,tweets[author][id].likes);
    }
    function dislikeTweet(address author, uint256 id) external {
        require(tweets[author][id].id==id,"Tweet does not exist");
        require(tweets[author][id].likes>0,"TWEET HAS NO LIKES");
        tweets[author][id].likes--;
        emit TweetDisliked(msg.sender,author,id,tweets[author][id].likes);
    }
    function changeTweetLength(uint newTweetLength) public onlyOwner{
        MAX_TWEET_LENGTH = newTweetLength;
    }


}