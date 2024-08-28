# Marsha+ (MSA) Token Smart Contract

## Introduction

Introducing the **Marsha+ Foundation**: a revolutionary initiative designed to empower and support the LGBTQ+ community and all those who wish to join our movement. Through education and blockchain technology, the Marsha+ Foundation positions itself as a beacon of positive change.

Our mission is based on the conviction that education, inclusion, and empowerment are essential pillars for building a fairer society. In a world constantly advancing towards digitalization, Marsha+ provides the necessary tools for everyone to actively participate and thrive in the new global economy.

## Token Details

- **Token Name**: Marsha+
- **Token Symbol**: MSA
- **Initial Supply**: 8,000,000,000
- **Annual Burn Rate**: 3%

## Initial Token Distribution

Tokens are distributed to various departments and sections as follows:

- **Community**: 35% (immediately available)
- **Charity**: 5% (immediately available, 20% locked for 3 years)
- **Foundation**: 5% (immediately available, 5% locked for 3 years)
- **Development**: 5% (immediately available, 5% locked for 3 years)
- **Marketing**: 5% (immediately available, 3% locked for 3 years)
- **Investors**: 5%
- **Legal**: 2.5% (immediately available, 2.5% locked for 3 years)
- **Expansion**: 1% (immediately available, 1% locked for 3 years)

## Contract Functionalities

### Token Minting

The contract mints a one-time total of 8 billion tokens, distributed as follows.

### Burn Mechanism

Annually, if the community balance exceeds half of its initially allocated tokens, 3% of the total supply is burned to control token inflation.

### Reward After 3 Years

1095 days after contract creation, additional tokens are distributed to the following sections:

- **Charity**: 20%
- **Foundation**: 5%
- **Development**: 5%
- **Marketing**: 3%
- **Legal**: 2.5%
- **Expansion**: 1%

## Interacting with the Contract

Users can interact using standard ERC20 functions:

1. `totalSupply()`: Returns the total token supply.
2. `balanceOf(address account)`: Returns the balance of a specified account.
3. `transfer(address recipient, uint256 amount)`: Transfers tokens to a recipient.
4. `allowance(address owner, address spender)`: Returns the remaining number of tokens allowed to be spent.
5. `approve(address spender, uint256 amount)`: Approves a spender to transfer from owner.
6. `transferFrom(address sender, address recipient, uint256 amount)`: Transfers tokens on owner's behalf.
7. `increaseAllowance(address spender, uint256 addedValue)`: Increases spender's transfer limit.
8. `decreaseAllowance(address spender, uint256 subtractedValue)`: Decreases spender's transfer limit.

## Contract Components

**Departments**: Comprising community, charity, foundation, development, marketing, investors, legal, and expansion. These entities receive both initial and subsequent token distributions.

## Final Considerations

This contract ensures controlled token allocation and annual reductions to maintain token value. Transparency and responsible allocation reinforce the Marsha+ Foundation's sustainability.

For more information, please refer to our whitepaper: [Marsha+ Whitepaper](https://marshafoundation.gitbook.io/marsha+-wp)

