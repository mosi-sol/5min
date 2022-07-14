var ethers = require('ethers'); // instaled package

console.log("\nWallet Generator + Nmemonic");
console.log("\n========================================\n\n");

const Nwallet = ethers.Wallet.createRandom() // generator
console.log('\nprivate key:', Nwallet.privateKey) // secret
console.log('public address:', Nwallet.address) // public
console.log('\nmnemonic:', Nwallet.mnemonic.phrase) // secret

console.log("\n========================================\n\n");
