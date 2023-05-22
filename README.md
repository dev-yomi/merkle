# MerkleClaim Contract

This repository contains a `MerkleClaim` contract, a secure and efficient Solidity contract that manages claimable tokens using a Merkle tree to distribute tokens to a list of predefined recipients. It employs openzeppelin libraries for the ERC20 token standard, cryptographic functions, and for reentrancy protection.

## Contract Features

- ERC20 compatible: Interacts with any ERC20 token.
- Merkle Tree distribution: Uses a Merkle Tree to allow recipients to claim their tokens.
- Security: Uses the OpenZeppelin library for secure, tested contract standards.
- Owner controls: Comes with functions to recover tokens, update the token, claim amount, Merkle root, and the owner.

## How It Works

1. The contract owner deploys the `MerkleClaim` contract with a token, claim amount and a Merkle root.
2. The owner can update the token, claim amount, Merkle root, or owner as they please.
3. Users who are recipients can claim their tokens using a Merkle proof.

The Javascript script in this repository generates the Merkle tree and the associated proofs for the recipients based on the list of addresses provided.

## Setup

### Prerequisites

- Node.js
- npm
- Truffle

### Installation

1. Clone the repository and navigate to its directory.
2. Install the dependencies by running `npm install`.
3. Run tests (if any) with `truffle test`.
4. Deploy the contract on the desired network with `truffle migrate --network <network>`.

## Usage

The following steps demonstrate how to use the script and the contract.

1. Prepare a list of recipient addresses in the script.
2. Run the script to generate the Merkle Tree and the proofs.
3. Deploy the contract using the token address, claim amount, and Merkle root generated from the script.
4. Recipients can claim their tokens by calling `claimTokens` function with their Merkle proof.

## License

[MIT](LICENSE)

## Disclaimer

This contract has not been audited. Use at your own risk.
