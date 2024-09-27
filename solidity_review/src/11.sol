pragma solidity ^0.8.21;

contract Owner {
    address public owner;

    constructor(address initialOwner) {
        owner = initialOwner;
    }

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    function changeOwner(address _newOwner) external onlyOwner {
        owner = _newOwner;
    }
}