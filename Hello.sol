pragma solidity ^0.4.0;

contract HelloWorldContract{
    string word = "Hello World!";
    address owner;
    
    function HelloWorldContract(){
        owner = msg.sender;
    }
    
    modifier onlyOwner{
        if(owner != msg.sender){
            throw;
        }else{
            _;  // continue executing rest of method body
        }
    }
    
    function getWord() constant returns(string){   //constant代表不變
        return word;
    }
    
    function setWord(string newWord) onlyOwner returns(string){
        word = newWord;
        return 'You sucessfully changed the variable word!';
    }
}