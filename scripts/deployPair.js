const hre = require("hardhat");

async function main() {
    const [deployer] = await hre.ethers.getSigners();
    console.log("Deploying contracts with the account:", deployer.address);

    // آدرس توکن ERC20 که قبلاً دیپلوی کردی
    const token1Address = "0x61E35Cd9BebbbeAb26EE6e1237951Fba5Bea0Ec6"; // جای اینو با آدرس MyToken پر کن

    const Pair = await hre.ethers.getContractFactory("Pair");
    const deployTx = await Pair.deploy(token1Address);
    const pair = await deployTx.waitForDeployment();

    console.log("Pair deployed to:", pair.target);
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});