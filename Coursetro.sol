pragma solidity ^0.4.18;

contract Coursetro {
    
   string fName;
   uint age;
   address owner;
   
    function Coursetro() public {     // Add this constructor
        owner = msg.sender;
    }
    
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
   
   //record the data you insert in history
   event Instructor(string fName ,uint age);
   
   function setInstructor(string _fName, uint _age) onlyOwner public {
       fName = _fName;
       age = _age;
       Instructor(_fName , _age);
   }
   
   function getInstructor() public constant returns (string, uint) {
       return (fName, age);
   }
    
}