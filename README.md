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

