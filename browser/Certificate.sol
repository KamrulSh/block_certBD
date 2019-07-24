pragma solidity ^0.5.0;

contract Owned{
    address owner;
    
    constructor() public {
        owner = msg.sender;
    }
    
    modifier onlyOwner {
        require(
            msg.sender == owner,
            "You must be the owner."
        );
        _;
    }
    
}

contract Certificate is Owned{
    struct Holder{
        string name;
        uint roll;
        string dept;
        string date;
        string cgpa;
    }
    
    mapping (address => Holder) holders;
    address[] public holderAccts;
    
    event HolderInfo(
        string name,
        uint roll,
        string dept,
        string date,
        string cgpa
    );
    
    /*modifier checkLevel(uint _cgpa){
        require(
            _cgpa <= 4,
            "You input the wrong cgpa."
        );
        _;
    }*/
    
    function setHolder(address _address, string memory _name, uint _roll, string memory _dept, string memory _date, string memory _cgpa) onlyOwner public{
        holders[_address].name = _name;
        holders[_address].roll = _roll;
        holders[_address].dept = _dept;
        holders[_address].date = _date;
        holders[_address].cgpa = _cgpa;
        holderAccts.push(_address);
        emit HolderInfo(_name, _roll, _dept, _date, _cgpa);
    }
    
    function getHolders() view public returns(address[] memory) {
        return holderAccts; 
    }
    
    function getHolder(address _address) view public returns(string memory, uint, string memory, string memory, string memory){
        return (holders[_address].name, holders[_address].roll, holders[_address].dept, holders[_address].date, holders[_address].cgpa);
    }
    
    function countHolders() view public returns(uint) {
        return holderAccts.length;
    }
}