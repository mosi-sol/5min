// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

contract Helper1 {
	function getChainId() external view returns (uint256) {
        return block.chainid;
    }
	
	function getTime() external view returns (uint256) {
        return block.timestamp;
    }
}


//**********************************************************//
contract Helper2 {
    function A() public view returns (bytes memory) {
        return address(this).code;
    }
    
    function B() public view returns (bytes32) {
        return address(this).codehash;
    }
    
    function C() public pure returns (string memory) {
        return type(Helpers).name;
    }
}
/*
<address>.code (bytes memory): code at the Address (can be empty)
<address>.codehash (bytes32): the codehash of the Address
type(C).name (string): the name of the contract
*/

//**********************************************************//
interface IIdentify {
    function test(uint i) external view returns(uint);
}

contract Identify is IIdentify {
    event Log(bytes4 data);

    function log() public {
        emit Log(type(IIdentify).interfaceId);
    } 

    function supportsInterface(bytes4 interfaceId) public pure returns (bool) {
        return interfaceId == type(IIdentify).interfaceId;
    }

    function test(uint i) public override pure returns(uint) {
        return i+1;
    }
}
