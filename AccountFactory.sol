pragma solidity ^0.8.10;


contract Account{
    address public bank;
    address public owner;

    constructor(address _owner) payable{
        bank=msg.sender; // That address of contract that deployed this contract.
        owner=_owner;   
    }
}

//Contract that deploy another contract should be named Factory
contract AccountFactory{
    Account[] public accounts;

    // This function will delopy a Account Contract
    function createAccount(address _owner) external payable {
        //_owner will be the owner of the newly created account contract.
        Account account = new Account{value:111}(_owner);
        accounts.push(account);
    }
}
