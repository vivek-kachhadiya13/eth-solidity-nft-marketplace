pragma solidity >= 0.7.0 < 0.9.0;

/*
 ABSTRACT CONTRACTS

 Abstract contracts is one which contains at least one function without any implementation.
 Such a contract is used as a base contract.
 Generally abstract contracts contains both implemented as well as abstract functions.
 Derived contract will implement the abstract function and use the existing functions as and when required.
*/

// base
abstract contract X {

    // since function has no implementation we should mark it as a virtual
    function y() public view virtual returns(string memory);
}

contract Z is X{
    function y() public override view returns(string memory) {
        return 'Hello';
    }
}