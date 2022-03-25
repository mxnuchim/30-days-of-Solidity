// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract addressRetriever {
    uint userAddress;

    struct People {
        address userAddress;
        string userName;
    }

    People[] public userName;
    mapping(string=>address) public nameToAddress;

    function addUsers(string memory _name, address _userAddress) public {
        userName.push(People(_userAddress,_name));
        nameToAddress[_name]= _userAddress;
    }

}