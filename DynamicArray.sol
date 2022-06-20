pragma solidity ^0.4.24;

contract DynamicArray{

  uint[] public arr;

    function addElement(uint ele) public{
        arr.push(ele);
    }

    function len() public view returns (uint){
        return arr.length;
    }
}
