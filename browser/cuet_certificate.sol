pragma solidity ^0.5.0;

// create contract named CuetCertificate

contract CuetCertificate {
    string public name;
    //string public dept;
    //uint public roll;
    uint public cgpa;
    //string public date;
    address owner;
    
    constructor() public {
        owner = msg.sender;
    }
    
    modifier onlyOwner {
        require(
            msg.sender == owner, "You must be the adminstrator."    
        );
        _;
    }
    
    event Certificate(
        string name,
        uint cgpa
    );
    
    function setCertificate(string memory _name, uint _cgpa) onlyOwner public {
        name = _name;
        cgpa = _cgpa;
        emit Certificate(_name, _cgpa);
    }
   
    function getCertificate() public view returns (string memory , uint) {
        return (name, cgpa);
    }
}