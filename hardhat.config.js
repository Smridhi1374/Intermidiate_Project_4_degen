require("@nomicfoundation/hardhat-toolbox");
require("@nomiclabs/hardhat-verify");
require("dotenv").config(); // Load environment variables

module.exports = {
  etherscan: {
    apiKey: {
      snowtrace: "snowtrace", // Placeholder for API key
    },
    customChains: [
      {
        network: "snowtrace",
        chainId: 43114,
        urls: {
          apiURL: "https://api.routescan.io/v2/network/mainnet/evm/43114/etherscan",
          browserURL: "https://avalanche.routescan.io",
        },
      },
    ],
  },
  networks: {
    snowtrace: {
      url: "https://api.avax.network/ext/bc/C/rpc",
      accounts: [process.env.PRIVATE_KEY], // Use private key from .env
    },
  },
};
