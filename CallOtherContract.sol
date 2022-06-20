pragma solidity ^0.8.10;
contract Callee {
    uint public x;
    uint public value;

    function setX(uint _x) public returns (uint) {
        x = _x;
        return x;
    }
    function setXandSendEther(uint _x) public payable returns (uint, uint) {
        x = _x;
        value = msg.value;
        return (x, value);
    }

    function getX() public view returns (uint){
        return x;
    }

    function getXandValue() public view returns(uint,uint){
        return (x,value);
    }
}

contract Caller {
    function setX(Callee _callee, uint _x) public {
        uint x = _callee.setX(_x);
    }

    function setXFromAddress(address _addr, uint _x) public {
        Callee callee = Callee(_addr);
        callee.setX(_x);
    }

    function getX(address _addr) public returns(uint){
        Callee callee = Callee(_addr);
        uint res= callee.getX();
        return res;
    }

    function getXandValue(address _addr) public returns(uint x, uint y){
          Callee callee = Callee(_addr);
            (x, y)= callee.getXandValue();
    }

    function setXandSendEther(address _addr, uint _x) public payable returns(uint, uint ){
         Callee callee = Callee(_addr);
        (uint x, uint value) = callee.setXandSendEther{value: msg.value}(_x);
        return (x,value);
    }

}
