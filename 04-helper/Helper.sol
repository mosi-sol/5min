// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

contract Helper {
	function getChainId() external view returns (uint256) {
        return block.chainid;
    }
	
	function getTime() external view returns (uint256) {
        return block.timestamp;
    }
}
