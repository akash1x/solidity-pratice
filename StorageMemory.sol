pragma solidity ^0.4.24;

contract StorageMemory{
    string[] public names=['Anurag','Mayank','Suraj'];

    /*
    When mem() is called: value in student[0] does not get changed to Akash it remains Ravi. 
    Reason because a copy of student[] is created and changes are made to the copy instead of original. 
    This is because of the keyword memory.*/

    function mem() public view{
        string[] memory s1 = names;
        s1[0]='Akash';
    }

    /*
    When sto() is called: value in student[0] gets changed to Akash, 
    reason because here the copy of student was not created instead s1 was pointing to the memory address of student[] because of the keyword storage. 
    There fore the change is made to student[] and value changed from Ravi to Akash.
    */

    function sto() public {
        string[] storage s1 = names;
        s1[0]='Akash';
    }
}
