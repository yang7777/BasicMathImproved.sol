// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract BasicMath {
    /// @notice Adds two unsigned integers and returns (sum, errorFlag).
    /// @dev Uses unchecked to avoid automatic revert so we can return an error flag.
    function adder(uint256 _a, uint256 _b) external pure returns (uint256 sum, bool error) {
        unchecked {
            uint256 result = _a + _b;
            // Overflow occurred if result < _a
            if (result < _a) {
                return (0, true);
            }
            return (result, false);
        }
    }

    /// @notice Subtracts _b from _a returning (difference, errorFlag).
    /// @dev Use unchecked so we return an error flag instead of reverting on underflow.
    function subtractor(uint256 _a, uint256 _b) external pure returns (uint256 difference, bool error) {
        unchecked {
            if (_b > _a) {
                return (0, true);
            }
            return (_a - _b, false);
        }
    }
}
