## Split Share (payment splitter)

- how to & why split shares for payment accounts.

<p align="right">
  <a href="https://github.com/mosi-sol/5min" target="blank">
    <img src="https://img.shields.io/badge/5%20minutes%20in%20solidity-live%20video%20in%20random%20time%20of%20day-white?style=for-the-badge&logo=solidity&labelColor=black" alt="mosi-sol" />
  </a>  
</p>

##

### How to use:
- on withdraw function of your contract, put address of this split share contract.
- for example:

```
address immutable _splitter = 0x00003230330....
function withdraw() external {
    uint amountToWithdraw = userBalances[msg.sender];
    userBalances[msg.sender] = 0;
    (bool success, ) = payable(_splitter).call{value: amountToWithdraw}("")
    require(success);
}
```
