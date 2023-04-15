// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract Bank {
    mapping(address => uint256) balances;

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw() public {
        uint256 amountToWithdraw = balances[msg.sender];
        require(amountToWithdraw > 0, "user has 0 balance");

        (bool sent, ) = msg.sender.call{value: amountToWithdraw}("");

        require(sent, "Failed to send ETH");

        balances[msg.sender] = 0;
    }

    function getCurrentBalance() public view returns (uint256) {
        return address(this).balance;
    }
}