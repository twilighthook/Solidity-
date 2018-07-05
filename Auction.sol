pragma solidity ^0.4.24;

contract auction{
    
    //拍賣的參數
    address public beneficiary; //受益人
    uint public auctionEnd;//（自1970-01-01以來的秒數）
    
    //當前拍賣狀況
    address public highestBidder;
    uint public highestBid;
    
    //出價紀錄
    mapping(address => uint) pendingReturns;
    
    //紀錄拍賣是否結束
    bool ended;
    
    //導致合約變動的event，用event來記錄
    event HighestBidIncreased(address bidder, uint amount);
    event AuctionEnded(address winner, uint amount);
    
    function SimpleAuction(uint _biddingTime,address _beneficiary) public{
        beneficiary = _beneficiary;
        auctionEnd = now + _biddingTime;
    }
    
    function bid() public payable{ //起標
        //require(now <= auctionEnd); //判斷拍賣是否結束
        
        require(msg.sender.balance > msg.value); //看錢是否足夠提交這次標價
        
        require(msg.value > highestBid);//提交的錢要超過目前最高價
        
        if(highestBid != 0){ //每次的標價，將上一個最高價的value退回暫存空間
            pendingReturns[highestBidder] += highestBid;
        }
        
        highestBidder = msg.sender;
        highestBid = msg.value;
        emit HighestBidIncreased(msg.sender, msg.value); //儲存標價紀錄
    }
    
    //取回出價(出價被超過)，需要自己按withdraw領回
    function withdraw() public returns (bool){
        
        uint amount = pendingReturns[msg.sender];
        if(amount > 0 ){ //假如需要退款
            pendingReturns[msg.sender] = 0; //將退款資料歸零
            if(!msg.sender.send(amount)){ //將款項退回
                pendingReturns[msg.sender] = amount;
                return false;
            }
        }
        return true;
    }
    
    //截標，將value給受益人
    function auctionEnd() public payable{
        //一個和其他contract交互的函數需要三個步驟
        //I. 條件(require)
        //II. 執行動作
        //III. 剩下的交互作用
        
        //I
        //require(now >= auctionEnd, "Auction not yet ended."); //拍賣時間還沒結束
        require(!ended, "auctionEnd has already been called.");
        
        //II
        ended = true;
        emit AuctionEnded(highestBidder, highestBid);
        
        //III,error
        beneficiary.transfer(highestBid);
    }
    
    function getBalance() constant returns(uint){
        return this.balance;
    }
    
}