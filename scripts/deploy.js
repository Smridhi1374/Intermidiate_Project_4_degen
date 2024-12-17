const hre = require("hardhat");

async function main() {
  // Get the Points smart contract
  const Points = await hre.ethers.getContractFactory("DGNToken");

  // Deploy it
  const points = await Points.deploy();
  await points.waitForDeployment();

  // Display the contract address
  console.log(`DGNToken token deployed to ${points.target}`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});