pragma solidity ^0.4.24;
//the cource7

contract Owned{
    
    address owner;
    
    function Owned() public{
        owener = msg.sender;
    }
    
    modifier onlyOwner{
        require(owner == msg.sender);
        _;
    }
    
}

contract Course is Owned{
    
    function setInstructor(
        address _address,
        uint _age
        ) onlyOwner public {
            
    }
    
}