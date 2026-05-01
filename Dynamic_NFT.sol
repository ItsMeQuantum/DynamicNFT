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



    
    function mint() public {
        require(ownerToToken[msg.sender] == 0, "Already owns NFT");

        tokenCount++;

        nfts[tokenCount] = NFT({
            id: tokenCount,
            owner: msg.sender,
            level: 1,
            mintedAt: block.timestamp,
            totalTips: 0
        });

        ownerToToken[msg.sender] = tokenCount;

        emit Minted(tokenCount, msg.sender);
    }

    
    function addTip(address user, uint256 amount) public {
        uint256 tokenId = ownerToToken[user];
        require(tokenId != 0, "No NFT");

        nfts[tokenId].totalTips += amount;
    }

    
    function levelUp() public {
        uint256 tokenId = ownerToToken[msg.sender];
        require(tokenId != 0, "No NFT");

        NFT storage nft = nfts[tokenId];

        uint256 timeHeld = block.timestamp - nft.mintedAt;

        
        uint256 newLevel = 1;

        if (timeHeld > 1 days) newLevel++;
        if (timeHeld > 7 days) newLevel++;
        if (nft.totalTips > 1 ether) newLevel++;
        if (nft.totalTips > 5 ether) newLevel++;

        require(newLevel > nft.level, "No upgrade yet");

        nft.level = newLevel;

        emit LeveledUp(tokenId, newLevel);
    }