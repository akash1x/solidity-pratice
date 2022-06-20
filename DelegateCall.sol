pragma solidity ^0.8.10;

contract TestDelegateCall{
    uint public num;
    address public sender;
    uint public value;
    address public owner;

    /*
    1. State variable of DelegateCall will get updated
        if we call setVars from DelegateCall Contract as
        the call is delegateCall.
    2. State Variables of TestDelegateCall will remain unintialized.

    */
    function setVars(uint _num) external payable{
        num=_num;
        sender=msg.sender;
        value=msg.value;
    }
}

contract DelegateCall{

    /*
    1. We can change the logic of setting the state variable 
        in TestDelegateCall and re-deploy it. No need to re-deploy
        DelegateCall it will reflect the changes.
    2. All the state Variable inside DelegateCall and TestDelegateCall
        should be same and should remain same in order.
        Id order is changed or new state variable is added in between or at top
        it causes unexpected behavior.
        New state variables can be added at the bottom eg: address public owner.
        It won't cause any issue.    
    */

    uint public num;
    address public sender;
    uint public value;

    function setVars(address _test) external payable{
         //(bool success, )= _test.delegatecall
         //(abi.encodeWithSignature("setVars(uint256)",_num));
         // Below and above with do exactly same thing.
         //Adv of below is that if we changed the function 
         //signature of setVars we don't require to update in string anymore.
        (bool success, )= _test.delegatecall
        (abi.encodeWithSelector(TestDelegateCall.setVars.selector),_num));
        
         require(success,"delegate call Failed");
    }
}
