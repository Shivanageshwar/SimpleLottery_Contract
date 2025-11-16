# Lottery Smart Contract (Solidity)

This is a simple lottery (raffle) smart contract written in Solidity 0.8.x.  
Users can enter the lottery by sending Ether, and the contract owner can pick a random winner.  
This contract is intended for learning purposes only and is not suitable for production use due to insecure randomness.

---

## Features

- Users enter the lottery by sending ETH.
- Owner selects a winner from the list of participants.
- The winner receives the entire contract balance.
- Events emitted for transparency.
- Contract resets after each round.

---

## How It Works

### Enter the Lottery
Users call:

Requirements:
- Must send a non-zero amount of ETH.
- User is added to the players list.
- Enter event is emitted.

### Pick Winner (Owner Only)
Owner calls:

The process:
1. Generates a pseudo-random number.
2. Selects a winner from the players array.
3. Sends the full balance to the winner.
4. Emits the Winner event.
5. Resets the players array and balance.

---
