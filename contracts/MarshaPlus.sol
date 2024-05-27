// SPDX-License-Identifier: MIT
pragma solidity 0.8.22;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MarshaToken is ERC20 {
    /**
     * 8 billion tokens in wei.
     */
    uint256 public constant INITIAL_SUPPLY = 8_000_000_000 * 10 ** 18;

    /**
     * 3% annual burn rate.
     */
    uint256 public constant ANNUAL_BURN_RATE = 3;

    uint256 public lastBurnTimestamp;
    uint256 public timeOfContractCreation;

    address public immutable community;
    address public immutable charity;
    address public immutable foundation;
    address public immutable development;
    address public immutable marketing;
    address public immutable investors;
    address public immutable legal;
    address public immutable expansion;

    uint256 public immutable halfCommunityInitialTokens;

    constructor(
        address _community,
        address _charity,
        address _foundation,
        address _development,
        address _marketing,
        address _investors,
        address _legal,
        address _expansion
    ) ERC20("MARSHA+", "MSA") {
        require(
            _community != address(0) &&
                _charity != address(0) &&
                _foundation != address(0) &&
                _development != address(0) &&
                _marketing != address(0) &&
                _investors != address(0) &&
                _legal != address(0) &&
                _expansion != address(0),
            "Invalid address"
        );

        community = _community;
        charity = _charity;
        foundation = _foundation;
        development = _development;
        marketing = _marketing;
        investors = _investors;
        legal = _legal;
        expansion = _expansion;

        lastBurnTimestamp = block.timestamp;
        timeOfContractCreation = block.timestamp;

        // Mint 8billions tokens tokens are free.
        _mint(address(this), INITIAL_SUPPLY);

        // Community 35% all tokens are free.
        _transfer(address(this), community, ((INITIAL_SUPPLY * 35) / 100));
        halfCommunityInitialTokens = balanceOf(community) / 2;

        // Charity: 25% (20% locked, 5% free).
        _transfer(address(this), charity, ((INITIAL_SUPPLY * 5) / 100));

        // Foundation: 10% (5% locked, 5% free).
        _transfer(address(this), foundation, ((INITIAL_SUPPLY * 5) / 100));

        // Development: 10% (5% free, 5% locked).
        _transfer(address(this), development, ((INITIAL_SUPPLY * 5) / 100));

        // Marketing: 8% (5% free, 3% locked).
        _transfer(address(this), marketing, ((INITIAL_SUPPLY * 5) / 100));

        // Investors: 5% (free).
        _transfer(address(this), investors, ((INITIAL_SUPPLY * 5) / 100));

        // Legal: 5% (2.5% free, 2.5% locked).
        _transfer(address(this), legal, ((INITIAL_SUPPLY * 25) / 1000));

        // Expansion: 2% (1% free, 1% locked).
        _transfer(address(this), expansion, ((INITIAL_SUPPLY * 1) / 100));
    }

    /**
     * @notice Reward tokens for departments after 1095 days of lounch contract.
     */
    function teamRewardAfter3Years() external {
        if (block.timestamp >= timeOfContractCreation + 1095 days) {
            _transfer(address(this), charity, ((INITIAL_SUPPLY * 20) / 100));

            _transfer(address(this), foundation, ((INITIAL_SUPPLY * 5) / 100));

            _transfer(address(this), development, ((INITIAL_SUPPLY * 5) / 100));

            _transfer(address(this), marketing, ((INITIAL_SUPPLY * 3) / 100));

            _transfer(address(this), legal, ((INITIAL_SUPPLY * 25) / 1000));

            _transfer(address(this), expansion, ((INITIAL_SUPPLY * 1) / 100));
        }
    }

    /**
     * @notice Burn a percentage of total supply annually if needed. Stop burning if burned more than half of cummunity initial balamce
     */
    function burnIfNeeded() external {
        if (
            block.timestamp >= lastBurnTimestamp + 365 days &&
            balanceOf(community) > halfCommunityInitialTokens
        ) {
            uint256 totalSupplyBeforeBurn = totalSupply();
            uint256 tokensToBurn = (totalSupplyBeforeBurn * ANNUAL_BURN_RATE) /
                100;
            _burn(community, tokensToBurn);
            lastBurnTimestamp = block.timestamp;
        }
    }
}
