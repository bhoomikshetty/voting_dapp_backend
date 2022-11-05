const {expect} = require('chai');
const {ethers} = require('hardhat');

describe("Testing Started",async function(){
    let contract;
    let [owner, add1, add2] = [];    
    beforeEach(async()=>{
        const token = await ethers.getContractFactory("CollegeContract");
        contract = await token.deploy();
        [owner, add1, add2] = await ethers.getSigners();     
    })

    describe("Ethection contract Test", async function(){
        it("create vote",async function(){
            await contract.addPolls('kbjbvoinvoiieiwrn');
            expect(await contract.getPollsList()).to.equal('kbjbvoinvoiieiwrn')
        })
    })

   
})