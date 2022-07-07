> ref: https://eips.ethereum.org/EIPS/eip-721

### for using IERC2981 = royalityFee:

- 1: register Royalties interface

`_registerInterface(_INTERFACE_ID_ERC2981);`

- 2: recomended
```solidity
bytes4 private constant _INTERFACE_ID_ERC2981 = 0x2a55205a;

function checkRoyalties(address _contract) internal returns (bool) {
    (bool success) = IERC165(_contract).supportsInterface(_INTERFACE_ID_ERC2981);
    return success;
 }
```
---

### IERC721TokenReceiver 
- implement `interfaceId == type(IERC721Receiver).interfaceId);`
- example for receive:
```solidity
function onERC721Received(
    address,
    address from,
    uint256 sourceTokenId,
    bytes calldata
) external override returns (bytes4) {
    ERC721(msg.sender).approve(from, sourceTokenId);
    return IERC721Receiver.onERC721Received.selector;
}
```
- security check, last lines of `transfer` function. example:
```solidity
if (ERC165.supportsInterface(recipient, type(IERC721Receiver).interfaceId)) {
...
}
```
