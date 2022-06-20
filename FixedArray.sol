pragma solidity ^0.4.24;

contract FixedArray{

    uint [4] public arr=[10,20,30,40];

    function setValue(uint index, uint value) public returns(uint){
    arr[index]=value;
    }

    function length() public view returns(uint){
    return arr.length;
    }
}
