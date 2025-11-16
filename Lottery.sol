// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Lottery {
    address public immutable owner;
    uint256 public balance;
    address[] public players;

    event Enter(address indexed user, uint256 amount);
    event Winner(address indexed winner, uint256 prize);

    error NotOwner();
    error NoPlayers();
    error ZeroDeposit();

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        if (msg.sender != owner) revert NotOwner();
        _;
    }

    // Enter the lottery by sending ETH
    function enterRaffle() external payable {
        if (msg.value == 0) revert ZeroDeposit();

        players.push(msg.sender);
        balance += msg.value;

        emit Enter(msg.sender, msg.value);
    }

    // Pseudo-random number generator (NOT secure)
    function _random() internal view returns (uint256) {
        return uint256(
            keccak256(
                abi.encodePacked(block.timestamp, block.prevrandao, players.length)
            )
        );
    }

    // Owner picks the winner
    function pickWinner() external onlyOwner {
        if (players.length == 0) revert NoPlayers();

        uint256 index = _random() % players.length;
        address winner = players[index];

        uint256 prize = balance;
        balance = 0;

        payable(winner).transfer(prize);

        emit Winner(winner, prize);

        // Reset players for next round
        delete players;
    }
}
