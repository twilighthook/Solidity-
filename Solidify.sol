pragma solidity ^0.4.0;

contract SolidifyKnowledge{
    
    string word;
    uint number;
    address owner;
    
    function SolidifyKnowledge(string _word){
        word = _word;
        number = 42;
        owner = msg.sender;
    }
    
    event Changed(address a);
    
    modifier onlyOwner{
        require(owner == msg.sender);
        _;
    }
    
    function getWord() constant returns (string){
        return word;
    }
    
    function setWord(string w) onlyOwner{
        word = w;
        Changed(msg.sender);
    }
    
}