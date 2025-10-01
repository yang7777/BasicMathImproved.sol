# BasicMathImproved.sol
Base Camp contract

# Solidity Exercise Improvements

This repository contains a collection of Solidity smart contracts originally inspired by learning exercises (e.g., BaseCamp tasks).  
The contracts have been **reviewed and improved for safety and clarity**, making them useful as references for Solidity learners.

---

## 📂 Repository Structure

contracts/
├── ImportsExercise.sol # Using library functions and structs
├── WeightedVoting.sol # ERC20 with weighted governance system
├── HaikuNFT.sol # ERC721 with custom uniqueness & sharing


---

## 🔒 Security Improvements by File

### 1. `ImportsExercise.sol`
- **Original Issue**: None critical (basic library usage).  
- **Improvement**:
  - Confirmed `shruggie()` extension cannot break state.
  - Safe since only struct/string operations, no Ether transfer.  
- **Educational Focus**: Demonstrates `using for` with library + struct.

---

### 2. `WeightedVoting.sol`
- **Original Issues**:
  - Governance votes could stay open indefinitely.
  - No event logs for important actions.
  - Tokens minted without cap check beyond `maxSupply`.  
- **Improvements**:
  - Added **quorum enforcement** with closing condition.
  - Ensured `claim()` respects max supply.
  - Used **custom errors** for efficiency.
  - Added **EnumerableSet** for clean voter tracking.  
- **Educational Focus**: Governance + ERC20 + sets.

---

### 3. `HaikuNFT.sol`
- **Original Issues**:
  - Haiku uniqueness check was expensive (`O(n^2)` string comparisons).
  - Missing proper events (minting/sharing).
  - No return for shared Haikus if none exist (revert only).  
- **Improvements**:
  - Added **custom errors** (`HaikuNotUnique`, `NotYourHaiku`, `NoHaikusShared`).
  - Ensured `_safeMint` used instead of `_mint`.
  - Improved uniqueness logic clarity (still heavy, but okay for demo).  
- **Educational Focus**: ERC721 basics, mapping for sharing, custom logic.

---

## 🚀 Usage

### Compile & Deploy
You can use [Remix](https://remix.ethereum.org/) or Hardhat/Foundry.

Example (Remix):
1. Open one of the files in `contracts/`
2. Compile with Solidity ^0.8.0 or higher
3. Deploy on a testnet (e.g., Base Goerli, Sepolia)

---

## ⚠️ Disclaimer

> These contracts are **for learning purposes only**.  
> They are **not audited** and should **NOT** be used in production or with real funds.

---

## 📖 References

- [Solidity Documentation](https://docs.soliditylang.org/)
- [OpenZeppelin Contracts](https://github.com/OpenZeppelin/openzeppelin-contracts)
- [Base Docs](https://docs.base.org/)
