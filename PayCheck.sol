pragma solidity ^0.4.0;

contract PayCheck{
    
    address[] employees = [0xca35b7d915458ef540ade6068dfe2f44e8fa733c , 0x14723a09acff6d2a60dcdf7aa4aff308fddc160c , 0x4b0897b0513fdc7c541b6d9d7e929c4e5364d2db , 0x583031d1113ad414f02576bd6afabfb302140225];
    
    uint totalReceived = 100;
    
    mapping (address => uint) withdrawnAmounts; //帳本
    
    function withdraw() canWithdraw{
        uint amountAllocated = totalReceived/employees.length; //分配量
        uint amountWithdrawn = withdrawnAmounts[msg.sender]; //變動量
        uint amount = amountAllocated - amountWithdrawn; //當前總量
        withdrawnAmounts[msg.sender] = amountWithdrawn + amount; //mapping對應address的提出量
        if(amount > 0){
            msg.sender.transfer(amount);
        }
    }
    
    function PayCheck() payable{
        updateTotal();
    }
    
    function () payable{
        updateTotal();
    }
    
    function updateTotal() internal{
        totalReceived+=msg.value;
    }
    
    modifier canWithdraw(){ //修改式中要有require函式，if require() == true 再做function
        bool contains = false;
        for(uint i = 0 ; i < employees.length ; i++){
            if(employees[i] == msg.sender){
                contains = true;
            }
        }
        require(contains);
        _;
    }
    
}