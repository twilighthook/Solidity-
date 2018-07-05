pragma solidity ^0.4.24;

contract transaction{
    
    event sendEvent(address from , address to , uint sendValue);
    
    function sendMoney(address destination) public payable{
        
        require(msg.sender.balance >= msg.value);
        
        emit sendEvent(msg.sender , destination , msg.value);
        
        destination.send(msg.value);
        
        
    }
    
}
