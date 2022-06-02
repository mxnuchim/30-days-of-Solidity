// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.4;

// A CRUD (Create, Read, Update, Delete) dApp where users can create posts, read posts, update existing posts and remove posts. 
// You should track the ownership of posts such that only owners can update and remove posts.

contract Blog {
    address public contractOwner;

    struct Post{
        address owner;
        string title;
        string body;
    }

    mapping(address => Post ) public posts;

    constructor(address _contractOwner){
        contractOwner = _contractOwner;
    }

    function createPost(string memory title, string memory body) public {
        posts[msg.sender].owner = msg.sender;
        posts[msg.sender].title = title;
        posts[msg.sender].body = body;
    }

    function updatePost(string memory newTitle, string memory newBody) public{
        if(posts[msg.sender].owner != msg.sender){
            revert("Only owner can edit a post!");
        }
        posts[msg.sender].title = newTitle;
        posts[msg.sender].body = newBody;
    }

    function deletePost() public{
        if(posts[msg.sender].owner != msg.sender){
            revert("Only creator can delete a post!");
        }
        delete(posts[msg.sender]);
    }

}
