require("@nomicfoundation/hardhat-toolbox")
/** @type import('hardhat/config').HardhatUserConfig */


const ALCHEMY_API_KEY = 'P4cj2f9syEVVOJJCUvEaMrDHMoAGihN6';
const GOERLI_PRIVATE_KEY = '7ff190880e58f1ebbb9df7e5c37400db7e56ee4cd0a9425d21ffabe725714863';
module.exports = {
  solidity: "0.8.17",
  networks: {
    goerli: {
      url: `https://eth-goerli.alchemyapi.io/v2/${ALCHEMY_API_KEY}`,
      accounts: [GOERLI_PRIVATE_KEY]
    }
  }
};
