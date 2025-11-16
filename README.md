# 🎰 Lottery Smart Contract (Solidity)

A simple blockchain-based lottery system where users enter by sending ETH, and the owner selects a random winner. Built in **Solidity 0.8.x**.

This is an educational contract (not suitable for production) because randomness is not secure on-chain.

---

## 🚀 Features

- 🎟 Enter lottery by sending ETH  
- 🎲 Random winner selection (pseudo-random)  
- 🧑‍⚖️ Only owner can trigger winner selection  
- 💰 All ETH collected is transferred to the winner  
- 📡 Emits events for transparency  
- 🔁 Automatically resets for next round  

---

## ⚙ How It Works

### 1️⃣ **Enter the Lottery**
Users join by calling:

```solidity
enterRaffle() payable
