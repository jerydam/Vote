// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Voting {
    uint public tokenPrice = 10 ether;
address public owner;
string private name;

string private symbol;

uint256 private decimal;

uint private totalSupply;
uint voteCost;
address public firstCand;

address public secondCand;

address public thirdCand;
// mapping of the address to the balance

mapping (address => uint256) private balanceOf;
mapping(address => uint256) public total;
// owner => spender =>  amount
mapping (address =>mapping(address => uint)) public allowance;

//events

event transfer_(address indexed from, address to, uint amount);
event _mint(address indexed from, address to, uint amount);

// constructor to declare token identity
constructor(string memory _name, string memory _symbol){
    owner = msg.sender;

    name = _name;
    symbol = _symbol;
    decimal = 1e18;
   }
   function buyTokens(uint256 _amount) public payable {
        // Require that the sender has enough ether to buy the tokens
        require(msg.value >= _amount * 1 ether, "Not enough ether to buy tokens.");

        // Transfer the ether to the contract
        totalSupply += _amount;
        balanceOf[msg.sender] += _amount;

        // Emit a token purchase event
        //emit TokenPurchase(msg.sender, _amount);
    }

function addCandidate(address _firstCand, address _secondCand, address _thirdCand)public{
    if (_firstCand == _secondCand || _firstCand == _thirdCand || _secondCand == _thirdCand){
        revert("can't set same address");
    }
    firstCand = _firstCand;
    secondCand = _secondCand;
    thirdCand = _thirdCand;
    require(firstCand != address(0) || secondCand != address(0) || thirdCand != address(0), "candidate can't be Added");
}

function _totalSupply( uint _token) public returns(uint256){
    totalSupply = _token;
    return totalSupply;
}

function buytoken(address to, uint amount) public {
    require(msg.sender == owner, "Access Denied");
    require(to != address(0), "transfer to address(0)");
    require(amount == 100, "you only have access to 100 token");
    balanceOf[msg.sender] += amount;
    totalSupply  -= amount;
}

function checkBalance(address _owner) public view returns (uint256) {
        return balanceOf[_owner];
    }

function vote(address _position1, address _position2, address _position3) public{
    require(balanceOf[msg.sender]>= voteCost, "Not enough");
    if(total[_position1]){
        voteCost = 50;
        balanceOf[msg.sender] - voteCost;
        total[_position1] +=3;
        totalSupply+= voteCost;
    }
     if else(total[_position2]){
        voteCost = 30;
        balanceOf[msg.sender] - voteCost;
        total[_position1] +=2;
        totalSupply+= voteCost;
    }

     if else(total[_position3]){
        voteCost = 20;
        balanceOf[msg.sender] - voteCost;
        total[_position1] +=1;
        totalSupply+= voteCost;
    }
    else(){
        revert("insufficient fund")

    }
    
}
function checkVote(address _check)public view returns(uint point){
 point= total[_check];

}
}