# hangtight.club 

Just hang in there, it's almost your turn 🎟️

Made with ❤️ by your frens at Nouns ⌐◨-◨ Running Club 🏃‍♀️

<img width="958" alt="image" src="https://github.com/adrianmcli/hangtight.club/assets/943555/b62cd283-4b7c-47d5-b872-b8e5a418d2b7">


# HangTight.club 🚀

HangTight.club is a decentralized application that manages a basic queue system. Built on Ethereum, it's a perfect tool for managing numbered ticket queues on the blockchain. You can use it in various scenarios like waiting lists, customer service lines, and much more.

## Features 🌟

- **Issue a ticket**: Any Ethereum address can get a unique ticket number.
- **Serve a ticket**: Only the contract deployer can serve a ticket, meaning advancing the queue to the next ticket.
- **View your ticket number**: An address that has been issued a ticket can view their ticket number at any time.
- **View the current ticket number**: The latest ticket number issued can be viewed by anyone.
- **View the last served ticket number**: The latest served ticket number can be viewed by anyone.

## Architecture 🔧

The project is split into two parts:

1. **Smart Contract** 📜: Written in Solidity and developed with Foundry, it is the heart of the app. It manages the issuing and serving of tickets, ensuring that the same address can't have an unserved ticket and only the deployer can serve a ticket.

2. **Frontend** 🎨: A Web3 enabled frontend created with Next.js and RainbowKit for a smooth user experience. RainbowKit provides out-of-the-box wallet management and is easily customizable. Under the hood, it uses Wagmi for Ethereum interactions and Viem for contract interactions.

## Tools & Libraries 🛠️

- **Solidity** for Ethereum smart contract.
- **Foundry** for smart contract development.
- **Next.js** for frontend interface.
- **RainbowKit** for easy wallet connection and management.
- **Wagmi** for Ethereum interactions.
- **Viem** for contract interactions.

## Setup & Installation 🚀

1. Clone this repository: `git clone https://github.com/adrianmcli/hangtight.club.git`

2. Ensure [Foundry](https://github.com/foundry-rs/foundry) is already instsalled. Build and deploy onto a testnet.

3. Navigate into the app folder: `cd app`

4. Install the necessary packages: `pnpm install`

5. Start the local development server: `pnpm dev`

6. Connect your Ethereum wallet and interact with the Dapp at `localhost:3000`.

## Contributing 🤝

Feel free to fork the project and submit a pull request with your changes!

## Links 🔗

- [Foundry](https://github.com/foundry-rs/foundry)
- [Wagmi](https://wagmi.sh/)
- [Viem](https://viem.sh/)
- [Next.js](https://nextjs.org/)
- [RainbowKit](https://rainbowkit.io/)

HangTight.club: Where everyone gets their turn 🌈🕒
