🛠️ Hardhat Token

A repository for deploying and testing ERC-20 tokens and a simple liquidity pool (ETH + ERC-20) on the Sepolia Testnet. Built for educational purposes.

📂 Folder Structure
hardhat-token/
├─ artifacts/           # Compiled contract artifacts (auto-generated)
├─ cache/               # Hardhat cache
├─ contracts/           # Solidity contracts
│  ├─ MyToken.sol       # ERC-20 token contract
│  └─ Pair.sol          # Liquidity pool contract (ETH + ERC-20)
├─ scripts/             # Deployment scripts
│  ├─ deployToken.js    # Deploy ERC-20 token
│  └─ deployPair.js     # Deploy liquidity pool (Pair)
├─ node_modules/        # Project dependencies
├─ .env                 # Environment variables (private)
├─ hardhat.config.js    # Hardhat configuration
├─ package.json         # Node project config
├─ package-lock.json    # Dependency lock
├─ tokenData.json       # Optional token metadata storage
└─ README.md            # Project readme

✨ Features

Deploy custom ERC-20 tokens with custom name, symbol, total supply, and decimals.

Create a simple liquidity pool contract for ETH and ERC-20 tokens.

Mint LP tokens based on liquidity added.

View reserves of ETH and ERC-20 tokens in the pool.

🛠️ Contracts
MyToken.sol

ERC-20 token with configurable decimals and initial supply.

Constructor Parameters: name, symbol, initialSupply, decimals_.

Pair.sol

Simple liquidity pool contract for ETH + ERC-20 token.

addLiquidity(uint256 amount1) payable – Add ETH and token liquidity.

getReserves() – View ETH and token reserves.

sqrt(uint256 y) – Internal utility to calculate LP tokens.

Note: token0 is always ETH (address(0)), token1 is the ERC-20 token passed in the constructor.

🚀 Installation & Setup

Clone repository:

git clone https://github.com/smjb65/hardhat-token.git
cd hardhat-token


Install dependencies:

npm install


Compile contracts:

npx hardhat compile


Configure environment:
Fill .env with your Sepolia RPC URL and private key.

🏗️ Deployment Scripts

Deploy ERC-20 Token:

npx hardhat run scripts/deployToken.js --network sepolia


Deploy Pair (Liquidity Pool):

npx hardhat run scripts/deployPair.js --network sepolia


These scripts deploy your contracts and log addresses for further interaction.

⚡ Interacting with Contracts

Use Hardhat console or Ethers.js:

npx hardhat console --network sepolia


Example:

const [deployer] = await ethers.getSigners();
const token = await ethers.getContractAt("MyToken", "<TOKEN_ADDRESS>");
await token.transfer("<RECIPIENT>", ethers.utils.parseUnits("100", 18));


To add liquidity:

const pair = await ethers.getContractAt("Pair", "<PAIR_ADDRESS>");
await pair.addLiquidity(ethers.utils.parseUnits("50", 18), { value: ethers.utils.parseEther("1") });

📜 License

This project is for educational and testing purposes on Sepolia Testnet only. Not intended for production or real trading use.