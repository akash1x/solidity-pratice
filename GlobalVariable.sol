pragma solidity ^0.4.24;

contract GlobalVariable{
    function getter() public view returns(uint block_no, uint timestamp, address msgSender){
        /*
        address sender = msg.sender // address of the contract/wallet that call the function inside which it is declared.
        Uint timestamp = block.timestamp// stores the time when this function wal called.
        Uint blockNum=block.number // gives the current block number.
        */
        return (block.number,block.timestamp,msg.sender);
    }
}
