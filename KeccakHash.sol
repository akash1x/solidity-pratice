pragma solidity ^0.8.10;

contract HashContract{

    function hash(string memory _msg, uint _x, address _addr) external pure returns (bytes32){
        return keccak256(abi.encodePacked(_msg,_x,_addr));
    }

    function encode(string memory _text1, string memory _text2) external pure returns (bytes memory){
            return abi.encode(_text1,_text2);
        }

    /*
    ("AAAA","BBB")
    ("AAA","ABBB")
    both will be the same hash in case of encodePacked.
    */
    function encodePacked(string memory _text1, string memory _text2) external pure returns (bytes memory){
            return abi.encodePacked(_text1,_text2);
        }  
        
     /*
    ("AAAA","BBB")
    ("AAA","ABBB")
    both will be the same hash in case of encodePacked.
    */    
    function collision(string memory _text1, string memory _text2) external pure returns (bytes32){
            return keccak256(abi.encodePacked(_text1,_text2));
        }                 


}
