const hre = require("hardhat");
const tokenData = require("../tokenData.json");

async function main() {
  const { name, symbol, totalSupply, decimals } = tokenData;

  const Token = await hre.ethers.getContractFactory("MyToken");

  // نسخه Ethers 6: await deploy خودش کانترکت رو return می‌کنه
  const token = await Token.deploy(name, symbol, totalSupply, decimals);

  // متد deployed() در Ethers 6 وجود نداره، فقط صبر کن deploy کامل بشه
  // (await Token.deploy(...)) کافی است

  console.log(`✅ Token deployed at: ${token.target}`); // .target به جای .address
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
