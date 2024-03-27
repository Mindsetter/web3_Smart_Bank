// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract SmartBank {
    //Record deposited accounts
    address[] public accounts;

    // account to the amount
    mapping(address account => uint256 amount) public accountToAmount;

    // deposit funds
    function depositFund() public payable {
        accounts.push(msg.sender);
        accountToAmount[msg.sender] += msg.value;
    }

    //withdraw funds
    function withdrawFund(uint256 _amount) public checkBalance(_amount) {
        payable(msg.sender).transfer(_amount);
    }

    // check contract balance
    function checkTotalBalance() public view returns (uint256) {
        return address(this).balance;
    }

    modifier checkBalance(uint256 _amount) {
        require(_amount <= accountToAmount[msg.sender], "Has low Balance");
        _;
    }
}
