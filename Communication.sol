pragma solidity ^0.4.0;

contract CallerContract{
    CalledContract toBeCalled = new CalledContract();
    
    function getNumber() constant returns (uint){
        return toBeCalled.getNumber();
    }
    
}

contract CalledContract{
    uint number = 30;
    
    function getNumber() constant returns (uint){
        return number;
    }
    
}