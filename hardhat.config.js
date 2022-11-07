require("@nomicfoundation/hardhat-toolbox")
/** @type import('hardhat/config').HardhatUserConfig */


const ALCHEMY_API_KEY = 'WrElmQupuXVNAb3GhixlaC5afS0JGvVo';
const GOERLI_PRIVATE_KEY = '4382d170cb210bc80bb0f6e78c29cd0d27ef0ba44c4d39cc8af21aad77894655';
module.exports = {
  solidity: "0.8.9",
  networks: {
    goerli: {
      url: `https://eth-goerli.alchemyapi.io/v2/${ALCHEMY_API_KEY}`,
      accounts: [GOERLI_PRIVATE_KEY]
    }
  }
};
