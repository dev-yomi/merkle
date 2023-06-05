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

MIT so do whatever

## Disclaimer

This contract has not been audited. Use at your own risk.

# MerkleNFT Contract

This repository contains the smart contract implementation of MerkleNFT, an ERC721 non-fungible token (NFT) contract with Merkle proof verification. 

## Contract Details

- **Name**: MerkleNFT
- **Symbol**: NFTN
- **License**: MIT License

## Contract Structure

The MerkleNFT contract extends the ERC721URIStorage contract from the OpenZeppelin library and inherits from the Ownable contract.

## Contract Variables

- **tokenCounter**: A variable that keeps track of the total number of tokens minted.
- **price**: The price required to mint a token, set to 0.1 ether.
- **maxPerWallet**: The maximum number of tokens that can be minted per wallet, set to 1.
- **maxSupply**: The maximum total supply of tokens that can be minted, set to 400.
- **baseURI**: The base URI used to construct the token URI.
- **merkleRoot**: The Merkle root hash used for verifying ownership.

## Contract Functions

- **constructor**: The constructor function initializes the contract by setting the base URI and the Merkle root.
- **mint**: This function allows users to mint a token by providing a valid Merkle proof and paying the specified price. It verifies the Merkle proof, mints the token, and sets the token URI.
- **withdrawEther**: This function allows the contract owner to withdraw the contract's balance (ETH).
- **updateMerkleRoot**: This function allows the contract owner to update the Merkle root.
- **updatePrice**: This function allows the contract owner to update the price required to mint a token.

## Dependencies

The contract relies on the following external libraries from the OpenZeppelin framework:

- ERC721URIStorage.sol: Provides the implementation for ERC721 tokens with URI storage.
- Strings.sol: Provides utility functions for manipulating string data.
- Ownable.sol: Implements a contract ownership mechanism.
- MerkleProof.sol: Implements Merkle proof verification.

## License

This contract is licensed under the MIT License. Please refer to the SPDX-License-Identifier comment at the beginning of the contract for more details.

For more information about the contract, please refer to the source code and comments within the contract file.

