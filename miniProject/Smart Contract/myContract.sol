// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

//import "hardhat/console.sol";

/**
 * @title myContract
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */

contract metaverse{
    mapping(string => user) userList;

    struct user{
        land l;
        string name;
        string emailAddress;
        address walletAddress;
        string regNo;
        bool exists;
    }

    struct land{
        string regNo;
        string landName;
        string nftName;
        uint256 price;
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

    function addLandInfo(string memory _regNo, string memory _landName, string memory _nftName, uint256 _price) public{
        land memory l;
        l.regNo = _regNo;
        l.landName = _landName;
        l.nftName = _nftName;
        l.price = _price;

        userList[l.regNo].l = l;
    }

    function fetchLandInfo(string memory _regNo) public view returns(string memory, string memory, uint256){
        land memory l;

        l = userList[_regNo].l;
        return(l.landName, l.nftName, l.price);
    }
}
