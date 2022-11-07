require("@nomicfoundation/hardhat-toolbox")
/** @type import('hardhat/config').HardhatUserConfig */


const ALCHEMY_API_KEY = 'PpFRMaHYcneGf7OSOjYvbW33CV69zNFo';
const GOERLI_PRIVATE_KEY = '20d7349be2e8de741c2f8934283d8c999ad72c82a255a2c50c0f2ca1b68b32ff';
module.exports = {
  solidity: "0.8.9",
  networks: {
    goerli: {
      url: `https://eth-goerli.alchemyapi.io/v2/${ALCHEMY_API_KEY}`,
      accounts: [GOERLI_PRIVATE_KEY]
    }
  }
};
