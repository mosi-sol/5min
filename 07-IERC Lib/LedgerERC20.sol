// SPDX-License-Identifier: MIT
pragma solidity 0.8;

// ledger: basic version. not track asset`s by approved
interface ILedger {
    // mapping(uint256 => bytes) private _hashed;

    event MintData(uint256 date);
    
    // function _hashedMint(uint256 amount, address to) internal view returns (bytes memory _crypto){
    //     _crypto = bytes(abi.encode(amount, to, block.timestamp, msg.sender));
    // }

    function getData(uint256 date) external view returns (bytes memory);/* {
        return _hashed[date];
    }*/

    function getResult(uint256 date) external view returns (uint256 amount, address to, uint256 time, address minter); /*{
        bytes memory data = _hashed[date];
        (amount, to, time, minter) = abi.decode(data, (uint256, address, uint256, address));
    }*/

}
