// SPDX-License-Identifier: MIT
pragma solidity 0.8;

contract ShortHand {
  function _this() internal view virtual returns (address) 
      {
          return address(this);
      }

    function _msgSender() internal view virtual returns (address) 
      {
          return msg.sender;
      }

    function _msgData() internal view virtual returns (bytes calldata) 
      {
          return msg.data;
      }

    function _msgValue() internal view virtual returns (uint) 
      {
          return msg.value;
      }

    function _hole() internal view virtual returns (address) 
      {
          return address(0);
      }
}
