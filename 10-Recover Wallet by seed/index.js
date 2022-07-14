var ethers = require('ethers'); // instaled package

console.log("\n========================================\n\n");

let mnemonic = "update upper guess family bamboo match helmet bronze become absurd blur domain";
let mnemonicWallet = ethers.Wallet.fromMnemonic(mnemonic);
console.log('recover from:', mnemonic);
console.log('address[0]:', mnemonicWallet.address);
console.log('privateKey:', mnemonicWallet.privateKey);

console.log("\n========================================\n\n");
