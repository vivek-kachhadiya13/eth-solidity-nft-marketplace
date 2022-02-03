// SPDX-License-Identifier: GPL-3.0

// pragma solidity defines compiler version
pragma solidity ^0.8.4;

// In solidity everthing is explicitly declared
contract CyberCryptoToken {
    // mission :: we want our CyberCryptoToken to mint token

    // MAPPING EXERCISE:
    // What if we want to store addresses and then give each addess a specific
    // index or number -  the solution is mapping.

    // mapping: acts like a dictionary to store data
    // mapping takes a key which maps to a value
    // mapping(key => value) public mapName
    mapping(address => uint) public balances;

    // We only want the msg.sender (the current caller)
    // to be able to mint tokens
    address public minter;

    // EVENTS EXERCISE:
    // Events allow clients to react to specific contract
    // changes that you declare (one way logging of transctions)
    // type of events: Sent, Trasnfer, Allow,
    // Events take two steps: 1. is setting it up
    // 2. emitting the event

    // There are preconditioned arguments we need to pass
    event Sent(address from, address to, uint amount);

    // A constructor is a special kind of a function
    // which gets called immediately upon deployment
    // the constructor can only be called one time only
    constructor() {
        minter = msg.sender;
    }

    // Build a minting function to mint token
    function mint(address recevier, uint amount) public {
        // I want to make sure that the only person who can mint
        // tokens is the owner of this contract

        // requirement method in solidity
        // require evaluates the truthiness within its paranthasis
        require(msg.sender == minter);

        balances[recevier] += amount;
    }

    function send(address recevier, uint amount) public {
        balances[msg.sender] -= amount;
        balances[recevier] += amount;

        emit Sent(msg.sender, recevier,  amount);
    }
}