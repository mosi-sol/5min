// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/finance/PaymentSplitter.sol";
// import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract PaymentSplit is PaymentSplitter {

    event Deposit(uint date, uint amoount, address santaClause);

    constructor (address[] memory _payees, uint256[] memory _shares) 
    PaymentSplitter(_payees, _shares) payable {}

    function balanceOf() public view returns (uint) {
        return address(this).balance;
    }

    function deposit() payable external {
        emit Deposit(block.timestamp, msg.value, msg.sender);
    }

}

/*
example addreses for payees
["0xdD870fA1b7C4700F2BD7f44238821C26f7392148", "0x583031D1113aD414F02576BD6afaBfb302140225"]

example precentage for shares
[35, 65]
*/
