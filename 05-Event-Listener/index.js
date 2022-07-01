// run -->  node index.js
// or run --> npm run click
const ethers = require("ethers");
const tokenABI = require("./token.abi.json");
require("dotenv").config();

async function main() {
	// const tokenAddress = "0x7ceB23fD6bC0adD59E62ac25578270cFf1b9f619"; // weth on polygon
	const tokenAddress = process.env.TOKEN;
	const provider = new ethers.providers.WebSocketProvider(
		// `wss://polygon-mainnet.g.alchemy.com/v2/api-key-here`
		`wss://polygon-mainnet.g.alchemy.com/v2/${process.env.SOCKET}`
	);
	const contract = new ethers.Contract(tokenAddress, tokenABI, provider);
	
	contract.on("Transfer", (from, to, value, event) => {
		let info = {
			from : from,
			to : to,
			value : ethers.utils.formatUnits(value, 6),
			data : event,
		};
		console.log(JSON.stringify(info, null, 4));
	});
}
main();
