pragma solidity ^0.4.16;

//vote
contract ballot{
    
    struct Voter{
        uint weight; //計票的權重，無符號整數(均為正或0)
        bool voted; //判斷是否投過票
        address delegatedMan; //被委託人
        uint vote; //投票提案的索引
    }
    
    struct Proposal{
        bytes32 name; //提案名稱
        uint voteCount; //得票數
    }
    
    address public chairMan;
    
    mapping (address => Voter) voters;
    
    Proposal[] proposals;
    
    //new a ballot
    function Ballot(bytes32[] proposalNames) public{
        chairMan = msg.sender; //sender of the message
        voters[chairMan].weight = 1;
        for(uint i = 0 ; i < proposalNames.length ; i++){
            proposals.push( 
                Proposal({ 
                    name : proposalNames[i],
                    voteCount : 0
                }) 
            );
        }
    }
    
    function giveRightToVoter(address voter) public{
        require( //有點像if then return的用法
            (msg.sender == chairMan) && 
            !voters[voter].voted &&
            (voters[voter].weight == 0)
        );
        voters[voter].weight = 0;
    }
    
    function delegate(address to) public{
        
    }
    
}