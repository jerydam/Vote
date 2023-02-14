import {ethers} from "hardhat";

async function main() {
    
const votingContract = await ethers.getContractFactory("vote");
const VotingContract = await votingContract.deploy("VoteToken", "VTN", 200);
await VotingContract.deploy();
console.log(`contract deployed at address ${VotingContract.address}`);
let tokenName = await VotingContract.TokenName();
console.log(tokenName);

let tokenSymbol = await VotingContract.TokenSymbol();
console.log(tokenSymbol);

let tokenDecimal = await VotingContract.TokenDecimal();
console.log(tokenDecimal);

let candidateOne = await VotingContract.firstCand();
console.log(candidateOne);

let candidateTwo = await VotingContract.secondCand();
console.log(candidateTwo);

let candidateThree = await VotingContract.thirdCand();
console.log(candidateThree);
}

main().then(()=>process.exitCode=0).catch((error)=>{
    console.error(error);
    process.existCode =1
    
}

)