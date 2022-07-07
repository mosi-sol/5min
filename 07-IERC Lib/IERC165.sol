// SPDX-License-Identifier: MIT
pragma solidity 0.8;

// ref: https://eips.ethereum.org/EIPS/eip-165

interface IERC165 {
    /// @notice Query if a contract implements an interface
    /// @param interfaceID The interface identifier, as specified in ERC-165
    /// @dev Interface identification is specified in ERC-165. This function
    ///  uses less than 30,000 gas.
    /// @return `true` if the contract implements `interfaceID` and
    ///  `interfaceID` is not 0xffffffff, `false` otherwise
    function supportsInterface(bytes4 interfaceID) external view returns (bool);
}

contract ERC165MappingImplementation is IERC165 {
    /// @dev You must not set element 0xffffffff to true
    mapping(bytes4 => bool) internal supportedInterfaces;

    function ERC165MappingImplementation() internal {
        supportedInterfaces[this.supportsInterface.selector] = true;
    }

    function supportsInterface(bytes4 interfaceID) external view returns (bool) {
        return supportedInterfaces[interfaceID];
    }
}


// EXAPMLE:
interface Simpson {
    function is2D() external returns (bool);
    function skinColor() external returns (string);
}


contract Lisa is ERC165MappingImplementation, Simpson {
  constructor() {
    supportedInterfaces[this.is2D.selector ^ this.skinColor.selector] = true;
  }
  
  // OR
  function supportsInterface(bytes4 interfaceID) external view returns (bool) {
        return
          interfaceID == this.supportsInterface.selector || // ERC165
          interfaceID == this.is2D.selector
                         ^ this.skinColor.selector; // Simpson
    }

    function is2D() external returns (bool){}
    function skinColor() external returns (string){}
}
