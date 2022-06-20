pragma solidity ^0.8.10;

/*
Since this ocde is not inside any contract.
This can be used inside any contract.
*/
library Math{
    function max(uint x, uint y) internal pure returns(uint){
        return x>=y? x:y;
    }
}

contract Test{
    function testMax(uint x, uint y) external pure returns(uint){
        return Math.max(x,y);
    }
}


/*
Librabry function accessing storage variable.
*/

library ArrayLib{
    function find(uint[] storage arr, uint x) internal view returns(uint){
        for(uint i=0;i<arr.length;i++){
            if(arr[i]==x){
                return i;
            }
        }
        revert("Not found");
    }
}

contract ArrayTest{
    // Know as enhacing a datatype.
    // Adding functionality to a datatype.
    using ArrayTest for uint[];
    uint[] public arr=[2,3,4,5,6];
    function findIndex(uint _x) external view returns(uint){
        //return ArrayLib.find(arr,_x);
        return arr.find(_x);
    }
}
