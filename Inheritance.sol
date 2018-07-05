pragma solidity ^0.4.0;

contract mortal {
    address public owner;
    
    function mortal(){
        owner = msg.sender;
    }
    
    modifier onlOwner{
        if(owner != msg.sender){
            throw;
        }else{
            _;
        }
    }
    
    function kill() onlOwner{
        suicide(owner);
    }
}

contract User is mortal{
    
    string public userName;
    
    function User(string _Name){
        userName = _Name;
    }
    
}

contract Provider is mortal{
    
    string public providerName;
    
    function User(string _Name){
        providerName = _Name;
    }
    
}