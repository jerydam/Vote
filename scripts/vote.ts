import {ethers} from "hardhat";

async function main() {
    const [owner, address1] = await ethers.getSigners();
const votingContract = await ethers.getContractFactory("vote");
const VotingContract = await votingContract.deploy("VoteToken", "VTN");
await VotingContract.deployed();
console.log(`contract deployed at address ${VotingContract.address}`);
let tokenName = await VotingContract.name();
console.log(tokenName);

let tokenSymbol = await VotingContract.symbol();
console.log(tokenSymbol);

let tokenDecimal = await VotingContract.decimal();
console.log(tokenDecimal);

let tokenSupply = await VotingContract._totalSupply();
console.log(tokenSupply);

let tokenBuy = await VotingContract.buyToken();
console.log(tokenBuy);

let voteCheck= await VotingContract.checkVote();
console.log(voteCheck);

let voteCount= await VotingContract.vote();
console.log(voteCount);

let voteCand= await VotingContract.addCandidate();
console.log(voteCand);

let BalanceCheck= await VotingContract.checkBalance();
console.log(BalanceCheck);


let candidateOne = await VotingContract.firstCand();
console.log(candidateOne);

let candidateTwo = await VotingContract.secondCand();
console.log(candidateTwo);

let candidateThree = await VotingContract.thirdCand();
console.log(candidateThree);
}

main().then(()=>process.exitCode=0).catch((error)=>{
    console.error(error);
    process.exitCode =1;
    
}

)