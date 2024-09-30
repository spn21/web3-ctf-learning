// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.21;

error SendFailed();
error CallFalled();

contract SendETH {
    constructor() payable{}

    receive() external payable{}

    function transferETH(address payable _to, uint256 amount) external payable {
        _to.transfer(amount);
    }

    function sendETH(address payable _to, uint256 amount) external payable {
        bool success = _to.send(amount);
        if(!success) {
            revert SendFailed();
        }
    }

    function callETH(address payable _to, uint256 amount) external payable {
        (bool success,) = _to.call{value: amount} ("");
        if(!success) {
            revert CallFalled();
        }
    }

}

contract ReceiveETH {
    event Log(uint amount, uint gas);

    receive() external payable {
        emit Log(msg.value,gasleft());
    }

    function getBalance() view public returns(uint) {
        return address(this).balance;
    }
}