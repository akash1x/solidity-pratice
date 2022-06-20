pragma solidity ^0.4.24;

contract ViewAndPureContract{
uint public num;

//because it does only read from state variable therefore view
function v1() external view returns (uint){
    return  num;
}

//because it does not read from state variable therefore pure
function p1() external pure returns (uint){
    return 1;
}

//because it does only read from state variable therefore view
function addV(uint _num) external view returns (uint){
    return num+_num;
}

//because it does not read from state variable therefore pure
function addP(uint _num1,uint _num2) external pure returns (uint){
    return _num1 + _num2;
}



}
