         // == wallet-address-generator == \\
var ethers = require('ethers'); // installed package
var crypto = require('crypto'); // looking in nodejs

var id = crypto.randomBytes(32).toString('hex'); // generate random bytes
var privateKey = "0x"+id; // combine
console.log("\nPrivate Key (keep in safe):", privateKey);

var wallet = new ethers.Wallet(privateKey); // ethersjs use random private for make public
console.log("\nPublic Address: " + wallet.address); // combine
