pragma solidity ^0.4.24;
//the course six done

contract Course{
    
    struct Instructor{
        uint age;
        string fName;
        string lName;
    }
    
    mapping (address => Instructor) instructors;
    address[] public instructorAccts;
    
    function setInstructor(
        uint _age,
        string _fName,
        string _lName
        ) public{
            
        address _address = msg.sender;
            
        var instructor = instructors[_address];
        
        instructor.age = _age;
        instructor.fName = _fName;
        instructor.lName = _lName;

        instructorAccts.push(_address) -1;        
    }
    
    function getInstructor() view public returns(address[]){
        return instructorAccts;
    }
    
    function getInstructor(address ins) view public returns (uint , string , string){
        return(instructors[ins].age , instructors[ins].fName , instructors[ins].lName);
    }
    
    function countInstructors() view public returns (uint) {
        return instructorAccts.length;
    }
    
}