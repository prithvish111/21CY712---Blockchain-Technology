// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


/**
 * @title myContract
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */

contract metaverse{
    mapping(string => user) userList;

    struct user{
        string name;
        string emailAddress;
        address walletAddress;
        string regNo;
        bool exists;
    }

    function register(string memory _name, string memory _emailAddress, address _walletAddress, string memory _regNo) public {
        user memory u;
        u.name = _name;
        u.emailAddress = _emailAddress;
        u.walletAddress = _walletAddress;
        u.regNo = _regNo;
        u.exists = true;

        userList[u.regNo] = u;
    }

    function alreadyMember(string memory _regNo) public view returns(bool){
        user memory u;
        u.regNo = _regNo;
        if(userList[u.regNo].exists){
            return true;
        }
        return false;
    }
}
