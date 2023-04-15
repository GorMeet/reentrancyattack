# Smart Contract Vulnerabilities

1. Re-entrancy Attack
2. Denail Of Service (DoS)

## Re-entrancy attack

An attacker is able to repeatedly enter and exit a contract function in a way that allows them to exploit a vulnerability and steal funds or resources from the contract. This attack happens when an attacker calls a function in a smart contract and then immediately calls that same function again before the first call has completed. This allows the attacker to repeatedly call the function, potentially causing it to perform unintended actions or to interact with other contracts in unexpected ways.


## Denail of Service

A Denial-of-Service (DoS) attack is an attempt to disrupt or disable the normal operation of the contract by overwhelming it with requests or transactions. DoS attacks in smart contracts can take many forms, such as sending large amounts of invalid data to a contract or repeatedly calling a contract function with no intention of executing it. The goal of a DoS attack is to consume all the available resources of the contract, making it impossible for other users to interact with it.

