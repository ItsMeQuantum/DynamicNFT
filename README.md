# DynamicNFT


# DynamicNFT

A simple experiment in **on-chain evolving NFTs**.
Each wallet can mint one NFT that grows based on **time held** and **tips received**.

---

## Concept

This contract creates a basic "progressive NFT":

* Starts at level 1
* Levels increase over time
* Extra levels come from tips

---

## How it works

### Mint

* One NFT per address
* Stores:

  * owner
  * level
  * mint timestamp
  * total tips

### Tip

* Anyone can add tips to a user’s NFT
* Tips are just numbers (no real ETH transfer)

### Level Up

Level increases if conditions are met:

* Held > 1 day → +1
* Held > 7 days → +1
* Tips > 1 ether → +1
* Tips > 5 ether → +1

Max level: **5**

---

## Key Functions

```solidity
mint()
```

```solidity
addTip(address user, uint256 amount)
```

```solidity
levelUp()
```

```solidity
getNFT(uint256 id)
```

---


## Structure

```solidity
struct NFT {
    uint256 id;
    address owner;
    uint256 level;
    uint256 mintedAt;
    uint256 totalTips;
}
```

---

## Notes

* Not ERC721 compatible
* No transfer logic
* Tips are simulated values
* Built only for learning/testing

---

## Structure

```solidity
struct NFT {
    uint256 id;
    address owner;
    uint256 level;
    uint256 mintedAt;
    uint256 totalTips;
}
```

---

## Notes

* Not ERC721 compatible
* No transfer logic
* Tips are simulated values
* Built only for learning/testing

---

## Possible Extensions

* ERC721 integration
* Real ETH tipping
* Dynamic metadata
* Transfer support

---

## Author

Quantum

