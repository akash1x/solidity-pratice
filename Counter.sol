pragma solidity ^0.4.24;

contract Counter{
    uint public count;

    //Below is not required as count is public but in interface 
    //we need to create a function count() that returns count value from here.
    
    // function count() public view returns(uint){
    //     return count;
    // }

    function inc() public{
        count=count+1;
    }
}
