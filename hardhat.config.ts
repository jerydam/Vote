import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";

const config: HardhatUserConfig = {
  solidity: "0.8.17",

  networks: {
    hardhat: {
    },
    goerli: {
      url: process.env.GOERLI_RPC,
      //@ts-ignore
      accounts:[process.env.PRIVATE_KEY]},
  },
  etherscan: {
    apiKey: process.env.API_KEY,
  }
};

export default config;
