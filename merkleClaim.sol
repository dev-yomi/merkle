pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/utils/cryptography/MerkleProof.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

contract MerkleClaim is ReentrancyGuard {

    IERC20 public token;
    address public owner;
    uint256 public claimAmount;
    uint256 public totalClaimed;
    bytes32 public merkleRoot;
    bool public paused;

    mapping(address => bool) public hasClaimed;

    constructor(IERC20 _token, uint256 _claimAmount, bytes32 _merkleRoot) {
        token = _token;
        owner = msg.sender;
        claimAmount = _claimAmount;
        merkleRoot = _merkleRoot;
        paused = true;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }

    function togglePause() external onlyOwner {
        if(paused){
            paused = false;
        } else {
            paused = true;
        }
    }

    function recoverTokens() external onlyOwner {
        token.transfer(owner, token.balanceOf(address(this)));
    }

    function updateToken(address _newToken) external onlyOwner {
        IERC20 _Token = IERC20(_newToken);
        token = _Token;
    }

    function updateClaimAmount(uint256 _newClaimAmount) external onlyOwner {
        claimAmount = _newClaimAmount;
    }

    function updateMerkleRoot(bytes32 _newRoot) external onlyOwner {
        merkleRoot = _newRoot;
    }

    function updateOwner(address _newOwner) external onlyOwner {
        owner = _newOwner;
    }
    
    function claimTokens(bytes32[] calldata _merkleProof) external nonReentrant {
        // Require claim be unpaused for anyone but owner to claim.
        require(!paused || msg.sender == owner, "Claim is paused.");
        // Ensure the user hasn't claimed tokens already
        require(!hasClaimed[msg.sender], "Tokens already claimed");

        // Verify the Merkle proof
        bytes32 leaf = keccak256(abi.encodePacked(msg.sender));
        require(MerkleProof.verify(_merkleProof, merkleRoot, leaf), "Invalid Merkle proof");

        // Mark as claimed and transfer tokens
        hasClaimed[msg.sender] = true;
        require(token.balanceOf(address(this)) >= claimAmount, "Insufficient tokens in contract");
        token.transfer(msg.sender, claimAmount);
        totalClaimed += claimAmount;
    }
}