// SPDX-License-Identifier: MIT
pragma solidity 0.8;

contract PersonalAccount {
    address public bank;
    address public customer;
    bool internal locked;

	modifier noReentrant() {
		require(!locked, "no re entrancy");
		locked = true;
		_;
		locked = false;
	}

    constructor (address _customer) payable {
        bank = msg.sender;
        customer = _customer;
    }

	function withdraw() public payable noReentrant {
		(bool success, ) = msg.sender.call{value: address(this).balance}("");
		require(success);
	}

    receive() external payable {}
    fallback() external payable {}
}

contract AccountFactory {
    PersonalAccount[] public accounts; // is account number
    mapping(address => uint256) public balance;
    bool internal locked;

	modifier noReentrant() {
		require(!locked, "no re entrancy");
		locked = true;
		_;
		locked = false;
	}

    function createAccount(address _customer) external payable {
        PersonalAccount account = new PersonalAccount{value: msg.value}(_customer);
        accounts.push(account);
        balance[_customer] += msg.value;
    } 

	function withdraw() public payable noReentrant {
		uint amountToWithdraw = balance[msg.sender];
		balance[msg.sender] = 0;
		(bool success, ) = msg.sender.call{value: amountToWithdraw}("");
		require(success);
	}

    receive() external payable {}
    fallback() external payable {}
}

