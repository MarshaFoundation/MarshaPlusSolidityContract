# Docs for Marsha Plus contract

## Roles: 

1. Contract (based on ERC20) - mint tokens once and send first part tokens to departments. After 1095 days send rest of the tokens to departments. After this contract will never send tokens to departments.

2. User
Contract based on ERC20(openzeppelin), so User can use all functions from this type of contract 

totalSupply()
balanceOf(account)
transfer(recipient, amount)
allowance(owner, spender)
approve(spender, amount)
transferFrom(sender, recipient, amount)
increaseAllowance(spender, addedValue)
decreaseAllowance(spender, subtractedValue)

https://docs.openzeppelin.com/contracts/2.x/api/token/erc20#ERC20-_mint-address-uint256-

3. Department (community, charity, foundation, development, marketing, investors, legal, expansion) is Users who will receive tokens after contract deployment and some departments will receive more tokens after 1095 days after Contract deployment.

## Features:

1. Only once Contract will mint 8_000_000_000 tokens (initial supply). 
Contract will never mint tokens again.

2. Contract will send tokens to some departments in constructor function.
community = 35% of initial supply
charity = 5% of initial supply
foundation = 5% of initial supply
development = 5% of initial supply
marketing = 5% of initial supply
investors = 5% of initial supply
legal = 2.5% of initial supply
expansion = 1% of initial supply

3. Every 365 days balance of a community burn 3% of totalSupply() only if community balance at that moment more than half of initial tokens in community.

4. Only once after 1095 days after deployment Contract will send to some departments tokens 
charity = 20% of initial supply
foundation = 5% of initial supply
development = 5% of initial supply
marketing = 3% of initial supply
legal = 2.5% of initial supply
expansion = 1% of initial supply

