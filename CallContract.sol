pragma solidity ^0.8.10;

contract Test{
    uint public x;
    string public message;
    event Log(string message);
    fallback() external payable{
        emit Log("Fallback was called");
    }
    function foo(string memory _message,uint _x) external payable returns(bool,uint){
        message=_message;
        x=_x;
        return(true,999);
    }
}
contract Call{
    bytes public data;
    function callFoo(address _test) external payable{
        /*
        Note: gas fee 5000 is not enough to update state variable in foo()
        So the transaction will fail.
        If we remove the gas fee restriction it will work fine.
        */      
        (bool success, bytes memory _data)= _test.call{value:111, gas: 5000}
        (abi.encodeWithSignature("foo(string,uint256)","call foo function",123));
        require(success,"call Failed");
        data = _data;
    }
    /* 
    For example if we tried calling function that is not present
    inside Test contract then the fallback function will get executed.
    */
    function callFunctionDoesNotExists(address _test) external{
           (bool success, )= _test.call(abi.encodeWithSignature("functionDoesNotExists()"));
            require(success,"call Failed");
      
    }
}
