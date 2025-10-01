// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract UnburnableToken {
    string private salt = "value";
    mapping(address => uint256) public balances;
    uint256 public constant MAX_SUPPLY = 100_000_000;
    uint256 public totalMinted;
    mapping(address => bool) private claimed;

    uint256 public constant CLAIM_AMOUNT = 1_000;

    event Claimed(address indexed who, uint256 amount);
    event Transfer(address indexed from, address indexed to, uint256 amount);
    event Burn(address indexed who, uint256 amount);

    error TokensAlreadyClaimed();
    error AllTokensClaimed();
    error InsufficientBalance();

    constructor() {
        // no initial distribution
    }

    function claim() public {
        if (totalMinted + CLAIM_AMOUNT > MAX_SUPPLY) revert AllTokensClaimed();
        if (claimed[msg.sender]) revert TokensAlreadyClaimed();

        balances[msg.sender] += CLAIM_AMOUNT;
        totalMinted += CLAIM_AMOUNT;
        claimed[msg.sender] = true;

        emit Claimed(msg.sender, CLAIM_AMOUNT);
    }

    /// @notice Transfer tokens from msg.sender to _to. Note: not ERC20 compliant approval logic.
    function safeTransfer(address _to, uint256 _amount) public {
        require(_to != address(0), "invalid recipient");
        if (balances[msg.sender] < _amount) revert InsufficientBalance();

        balances[msg.sender] -= _amount;
        balances[_to] += _amount;

        emit Transfer(msg.sender, _to, _amount);
    }

    /// @notice Burn tokens from caller (optional utility)
    function burn(uint256 _amount) public {
        if (balances[msg.sender] < _amount) revert InsufficientBalance();
        balances[msg.sender] -= _amount;
        // totalMinted remains as minted supply; if you want to track circulating supply adjust another var
        emit Burn(msg.sender, _amount);
    }

    // helpers
    function hasClaimed(address _who) external view returns (bool) {
        return claimed[_who];
    }
}
