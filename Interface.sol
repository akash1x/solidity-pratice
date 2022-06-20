pragma solidity ^0.4.24;

interface ICounter{
    function count() external view returns(uint);
    function inc() external;
     
}

contract CallInterface{
    uint public count;
    function example(address _counter) external{
        ICounter(_counter).inc();
        count = ICounter(_counter).count();
        
    }
}
