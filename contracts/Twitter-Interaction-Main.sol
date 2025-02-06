// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "@openzeppelin/contracts/access/Ownable.sol";

interface IProfile{ // means that we will use the UserProfile struct in this contract 
    struct UserProfile{ // used to declare struct type
        string displayName;
        string bio;
    }
    function getProfile(address _user) external  view returns (UserProfile memory); // function in interfaces must be define external because these interface must be used externally
}
contract Twitter is Ownable{ // Twitter contract inherites with ownable contract
    uint public MAX_TWEET_LENGTH = 2;
    IProfile public profileContract; // by default the variable is public
    struct Tweet{
        uint256 id;
        address author;
        string content;
        uint256 timestamp;
        uint256 likes;
    }

    modifier onlyRegistered(){
        IProfile.UserProfile memory userProfileTemp = profileContract.getProfile(msg.sender);
        require(bytes(userProfileTemp.displayName).length>0,"User not registered");
        _;
    }
    event TweetCreated(uint256 id, address author, string content, uint256 timestamp);
    event TweetLiked(address liker, address tweetAuthor,uint256 tweetId, uint256 newLikeCount);
    event TweetDisliked(address disLiker, address tweetAuthor,uint256 tweetId, uint256 newDisikeCount);

    constructor(address _profileContractAddress) Ownable(msg.sender){
        profileContract = IProfile(_profileContractAddress); // now the communication contract is made
    } // calling the Ownable constructor

    mapping(address=>Tweet[]) public tweets;
    
    function createTweet(string memory _tweet) public onlyRegistered{
        require(bytes(_tweet).length < MAX_TWEET_LENGTH,"Tweet is too long!");
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
    function getAllLikes(address _author) public view returns (uint){
        uint totalLikes; // in solidity by default value of variable is zero
        for(uint i=0;i<tweets[_author].length;i++){
            totalLikes+=tweets[_author][i].likes;
        }
        return totalLikes;
    }
}