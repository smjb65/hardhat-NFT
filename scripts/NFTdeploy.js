const hre = require("hardhat");

async function main() {
  const MyNFT = await hre.ethers.getContractFactory("MyNFT");
  
  console.log("Deploying...");
  const myNFT = await MyNFT.deploy(); // Deploy
  await myNFT.waitForDeployment();   // <-- این جایگزین deployed() در نسخه جدید

  console.log("MyNFT deployed to:", myNFT.target); // <-- در نسخه جدید آدرس در target هست
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
