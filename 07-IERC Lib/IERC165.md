# IERC165

```solidity
import "./IERC165.sol";
contract ERC165MappingImplementation is IERC165 {
  /// @dev You must not set element 0xffffffff to true
  mapping(bytes4 => bool) internal supportedInterfaces;

  function ERC165MappingImplementation() internal {    // <- dont use this type of function, use constructor(){}
      supportedInterfaces[this.supportsInterface.selector] = true;
  }

  function supportsInterface(bytes4 interfaceID) external view returns (bool) {
      return supportedInterfaces[interfaceID];
  }
}
```

- EXAPMLE:
```solidity
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
```
