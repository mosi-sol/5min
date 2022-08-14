// SPDX-License-Identifier: MIT
pragma solidity 0.8;

// ledger: basic version. not track asset`s by approved
interface ILedger {
   function getResult(uint256 data) external view returns (uint256 id, address from, address to, uint256 amount, uint256 time);
    function getData(uint256 data) external view returns (bytes memory);

    event MintData(uint256 id, uint256 date, bytes data);
}

/*
uint256 private _ledgerId = 0;
mapping(uint256 => bytes) private _hashed;

function _compressData(uint256 amount, address to) internal returns (bytes memory _crypto){
    _crypto = bytes(abi.encode(_ledgerId, msg.sender, to, amount, block.timestamp));
    emit MintData(_ledgerId, block.timestamp, _crypto);
    _ledgerId += 1;
}

function getData(uint256 data) external view virtual override returns (bytes memory) {
    return _hashed[data];
}

function getResult(uint256 data) external view virtual override returns (uint256 id, address from, address to, uint256 amount, uint256 time) {
    bytes memory info = _hashed[data];
    (id, from, to, amount, time) = abi.decode(info, (uint256, address, address, uint256, uint256));
}


 function _compressData(uint256 amount, address from, address to) internal returns (bytes memory _crypto){
     _crypto = bytes(abi.encode(_ledgerId, from, to, amount, block.timestamp));
     _hashed[_ledgerId] = _crypto;
     emit MintData(_ledgerId, block.timestamp, _crypto);
     _ledgerId += 1;
 }
*/
