pragma solidity ^0.4.23;

contract FundRaise {
    address public owner;
    bool public paused;

    // modifiers
    modifier onlyOwner() {
        assert(owner == msg.sender);
        _;
    }

    modifier whenNotPaused(){
        require(!paused);
        _;
    }

    function() public {
      owner = msg.sender;
    }

    function pause() public onlyOwner {
        paused = true;
    }

    function unpause() public onlyOwner {
        paused = false;
    }

    function removeFunds() public {
        owner.transfer(this.balance);
    }

}
