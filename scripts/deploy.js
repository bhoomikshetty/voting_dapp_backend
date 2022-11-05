const { ethers } = require("hardhat");

async function main(){
    const [deployer] = await ethers.getSigners();
    console.log("Contract Deployed by"+ deployer.address);
    
    const contract = await ethers.getContractFactory("CollegeContract");
    const token = await contract.deploy();
    
    console.log("Token address (Contract Address):", token.address);
}

main().then(()=>process.exit(0)).catch((err)=>{console.log(err);process.exit(1)})