// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;
contract Twitter{

    struct UserProfile{
        string ipfsCid;
        bool exists;
    }
 struct Post{
    string title;
    string ipfsHash;
    address author;
    uint256 timestamp;
 }
 mapping(address=>UserProfile) public userProfiles;
 mapping(address=>uint256[]) public userpostIds;
 Post[] public posts;

 function setUserProfile(string calldata _ipfsCid)external{
    require(bytes(_ipfsCid).length > 0, "IPFS CID cannot be empty");
    userProfiles[msg.sender]=UserProfile(
        {
            ipfsCid: _ipfsCid,
            exists: true
        }
    );
 }

 function getUserProfile(address _user) external view returns(UserProfile memory){
    return userProfiles[_user];
 }

 function createPost(string calldata _tille,string calldata _ipfsHash)external{
  require(userProfiles[msg.sender].exists, "User profile does not exist");
  require(bytes(_tille).length>0,"Title cannot be empty");
  require(bytes(_ipfsHash).length>0,"IPFS hash cannot be empty");
  posts.push(
    Post(
        {
            title:_tille,
            ipfsHash: _ipfsHash,
            author: msg.sender,
            timestamp: block.timestamp
        }
    )
  );
  uint256 postId=posts.length-1;
  userpostIds[msg.sender].push(postId);
 }

 function getPost(uint256 _postId) external view returns(Post memory){
    require(_postId < posts.length, "Post does not exist");
    return posts[_postId];
 }

 function getAllPosts() external view returns(Post[] memory){
    return posts;

 }
 function getPostCount() external view returns(uint256){
    return posts.length;
 }
function getUserPosts(address _user) external view returns(uint256[] memory){
    return userpostIds[_user];
 }

 
}