const {
    DefenderRelayProvider,
    DefenderRelaySigner,
  } = require('defender-relay-client/lib/ethers')
  const { ethers } = require('hardhat')
  const { writeFileSync } = require('fs')

async function main(){
    const [deployer] = await ethers.getSigners();
    console.log("Contract Deployed by"+ deployer.address);
    const contract = await ethers.getContractFactory("CollegeContract");
    const token = await contract.deploy();
    console.log("Token address (Contract Address):", token.address);
    
    require('dotenv').config()
    const credentials = {
        apiKey: process.env.RELAYER_API_KEY,
        apiSecret: process.env.RELAYER_API_SECRET,
    }
    const provider = new DefenderRelayProvider(credentials)
    const relaySigner = new DefenderRelaySigner(credentials, provider, {
        speed: 'slow',
    })

    const Forwarder = await ethers.getContractFactory('MinimalForwarder')
    const forwarder = await Forwarder.connect(relaySigner)
        .deploy()
        .then((f) => f.deployed())

    writeFileSync(
        'deploy.json',
        JSON.stringify(
        {
            MinimalForwarder: forwarder.address,    
        },
        null,
        2
        )
    )

    console.log(
        `MinimalForwarder: ${forwarder.address}`
    )   
}
main().then(()=>process.exit(0)).catch((err)=>{console.log(err);process.exit(1)})