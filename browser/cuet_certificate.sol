pragma solidity ^0.5.0;

// create contract named CuetCertificate

contract CuetCertificate {
    string public name;
    //string public dept;
    //uint public roll;
    uint public cgpa;
    //string public date;
    
    function setCertificate(string memory _name, uint _cgpa) public {
        name = _name;
        cgpa = _cgpa;
    }
   
    function getCertificate() public view returns (string memory , uint) {
        return (name, cgpa);
    }
}