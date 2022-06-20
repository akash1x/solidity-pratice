pragma solidity ^0.4.24;

contract VotingContract{
    mapping(address => uint) public ballot;
    mapping(address => bool) public inserted;
    address[] public keys;
    mapping(address => bool ) public verifiedVoters; 
    mapping(address => bool ) public isVoted;
    uint256 openingTime;
    uint256 endingTime;
    address owner;

    constructor() public{
        owner=msg.sender;
        openingTime= block.timestamp;
        endingTime= openingTime+60*60*2;
    }

    modifier onlyOwner(){
        require(msg.sender==owner);
        _;
    } 

    function vote(address candidate) public {
         require(isValidCandidate(candidate)==true,"Not a valid candidate");
         require(verifiedVoters[msg.sender]==true,"Unverified voter");
         require(isVoted[msg.sender]==false,"Already voted ");
         require(isVotingTime()==true,"Voting closed ");

        if(verifiedVoters[msg.sender]==true){
            ballot[candidate]++;
            if(!inserted[candidate]){
                inserted[candidate]=true;
                keys.push(candidate);
            }
            verifiedVoters[msg.sender]=false;
            isVoted[msg.sender]=true;
        }
    }

    function getSize() external view returns(uint){
        return keys.length;
    }

    function isValidCandidate(address candidate) public pure returns(bool){
        if( keccak256(abi.encodePacked(candidate)) == keccak256(abi.encodePacked("0xdD870fA1b7C4700F2BD7f44238821C26f7392148")) ||
            keccak256(abi.encodePacked(candidate)) == keccak256(abi.encodePacked("0x583031D1113aD414F02576BD6afaBfb302140225")) ||
            keccak256(abi.encodePacked(candidate)) == keccak256(abi.encodePacked("0x4B0897b0513fdC7C541B6d9D7E929C4e5364D2dB")) ||
            keccak256(abi.encodePacked(candidate)) == keccak256(abi.encodePacked("0x14723A09ACff6D2A60DcdF7aA4AFf308FDDC160C")) ){
                return true;
            }
        return false;    
    }

   
    function isVotingTime() internal view returns(bool){
        if(openingTime<=block.timestamp && block.timestamp <=endingTime){
            return true;
        }
        return false;
    }

    //Controlled by owner
    function setUserValidity(address voter, bool flag) public  onlyOwner{
        verifiedVoters[voter]=flag;
    }

    //Once voted address should be marked unverified
    

    //Function to declare winner
    function results() public view onlyOwner returns(string) {
        uint totalVotes=0;
        for(uint i=0;i<this.getSize();i++){
            totalVotes+=ballot[keys[i]];
        }
        uint winner=60;
        for(uint j=0;j<this.getSize();j++){
            uint temp = (ballot[keys[j]]*100)/totalVotes;
            if(temp>=winner){
                return "Winner";
            }
        }
        return "No winner";
    }
}
