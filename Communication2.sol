pragma solidity ^0.4.0;

contract Calculator{
    Math math = Math(0xbbf289d846208c16edc8474705c748aff07732db);
    
    function twoPlusFour() constant returns(int){
        return math.add(2,4);
    }
    
    function twoMulFour() constant returns(int){
        return math.multiply(2,4);
    }
}

contract Math{
    
    function add(int a , int b ) returns(int){
        return a + b;
    }
    
    function multiply(int a , int b ) returns(int){
        return a * b;
    }
    
}