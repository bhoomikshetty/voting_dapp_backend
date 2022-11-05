//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;
import "hardhat/console.sol";

contract CollegeContract {
    string private name = "voteth";
    string private sym = "ETHEC";

//<-- Auth
    // address of the contract deployer.
    mapping(address => bool) private admins;
    string allowedUser = "ipfsLink";

    constructor(){
        admins[msg.sender] = true;
    }

    modifier onlyAdmin {
        require(admins[msg.sender], "Unauthorized Request");
        _;
    }

    function addAdmin(address _allowedAdmin) onlyAdmin public {
        admins[_allowedAdmin] = true;
    }

    function addUser(string calldata _allowedUser) onlyAdmin public {
        allowedUser = _allowedUser;
    }

    function getUser() view public returns(string memory){
        return allowedUser;
    }
//-->

    string private postList = "sjhvbwvkvbowrubvowriv";
    function addPost(string calldata _pollList) public{
        postList = _pollList;
    }
    function getPost() public view returns(string memory){
        return postList;
    }

    string private suggestionList = "skvjbsnlvknlkvnw";
    function addSuggestion(string calldata _pollList) public{
        postList = _pollList;
    } 
    function getSuggestion() public view returns(string memory){
        return postList;
    }
    
//Polls

    // results
    // {
    //     "timestamp" : {
    //         0 : 15,
    //         1 : 86, 
    //     }

    // }

    string private pollList = "akub";
    mapping(string => mapping(uint8 => uint256)) private results;
    
    function getPollsList() public view returns(string memory){
        return pollList;
    }

    function addPolls(string calldata _pollList) public{
        pollList = _pollList;
    } // poll creator.
    
    function vote(string calldata polldata, uint8 optionId) public{
        results[polldata][optionId]++;
    } //voter

    function getScore(string calldata polldata, uint8 optionId) public view returns(uint256){
        return results[polldata][optionId];
    }

    function getName() view public returns(string memory){
        return name;
    }

    function getSymbol() view public returns(string memory){
        return name;
    }

}






// sjhvbwvkvbowrubvowriv => {
//         "timestamp" : {
//             "add" : fdjkvbkfv
//             "
//         }
//         "newTIme" : {
//             "add" : slfnoivnprv,
//             "content" : {
//                 image : "sfvkudbve", //IPFS UPLOAD
//                 "Text" : "svs"   
//             }
//             "app_flag" : 0,
//         }


         
//     }