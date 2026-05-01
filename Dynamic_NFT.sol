// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract DynamicNFT {

    uint256 public tokenCount;

    struct NFT {
        uint256 id;
        address owner;
        uint256 level;
        uint256 mintedAt;
        uint256 totalTips;
    }

    mapping(uint256 => NFT) public nfts;
    mapping(address => uint256) public ownerToToken;

    event Minted(uint256 tokenId, address owner);
    event LeveledUp(uint256 tokenId, uint256 newLevel);