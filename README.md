# MoodNFT 🎭

A dynamic NFT (dNFT) project that demonstrates advanced smart contract development using Foundry. MoodNFT creates unique tokens that can change their visual representation based on their current "mood" state - switching between happy and sad pixel art characters.

## 🌟 Project Overview

MoodNFT is an ERC-721 compliant NFT collection where each token can exist in one of two states:

- **Happy** 😊 - Displays a smiling pixel art character
- **Sad** 😢 - Displays a frowning pixel art character

The unique feature of this project is that token holders can flip the mood of their NFTs, dynamically changing the token's metadata and visual appearance.

## 🚀 Features

- **Dynamic NFT Metadata**: Token metadata changes based on mood state
- **On-chain SVG Storage**: Images are stored as base64-encoded SVG data on-chain
- **Mood Flipping**: Token owners and approved operators can change NFT moods
- **Pixel Art Design**: Retro-style 20x20 pixel art characters
- **Gas Optimized**: Efficient storage and retrieval of mood states
- **Authorization Controls**: Only authorized users can modify NFT moods

## 🛠️ Technology Stack

- **Foundry**: Smart contract development framework
- **Solidity ^0.8.18**: Smart contract programming language
- **OpenZeppelin v5**: Industry-standard smart contract libraries
- **Base64 Encoding**: For on-chain SVG storage
- **Forge**: Testing and deployment framework
- **SVG**: Scalable vector graphics for NFT images

## 📁 Project Structure

```
foundry-nft/
├── src/
│   ├── MoodNft.sol          # Main dynamic NFT contract
│   └── BasicNFT.sol         # Basic NFT implementation for reference
├── script/
│   ├── DeployMoodNft.s.sol  # Deployment script
│   └── Interactions.s.sol   # Contract interaction scripts
├── test/
│   └── unit/
│       └── MoodNftTest.t.sol # Comprehensive unit tests
├── lib/                     # Dependencies
│   ├── forge-std/           # Foundry standard library
│   ├── openzeppelin-contracts/ # OpenZeppelin contracts
│   └── foundry-devops/      # DevOps utilities
└── public/
    ├── happy.svg            # Happy mood SVG file
    └── sad.svg              # Sad mood SVG file
```

## 📋 Smart Contract Details

### MoodNft.sol

The main contract inheriting from OpenZeppelin's ERC721:

**Key Functions:**

- `mintNft()`: Creates a new NFT (starts in HAPPY mood)
- `flipMood(uint256 tokenId)`: Changes NFT mood between HAPPY/SAD
- `tokenURI(uint256 tokenId)`: Returns dynamic metadata based on current mood

**Storage:**

- `s_tokenCounter`: Tracks total number of minted tokens
- `s_tokenIdToMood`: Maps token IDs to their current mood
- `s_happySvgURI` & `s_sadSvgURI`: Base64-encoded SVG data

**Authorization:**
Uses OpenZeppelin v5's `_isAuthorized()` function to ensure only token owners or approved operators can flip moods.

## 🎨 NFT Metadata Structure

```json
{
  "name": "MoodNFT",
  "description": "A mood NFT",
  "attributes": [
    {
      "trait_type": "moodiness",
      "value": "100"
    }
  ],
  "image": "data:image/svg+xml;base64,..."
}
```

## 🧪 Testing

Comprehensive test suite covers:

- NFT minting functionality
- Mood flipping mechanics
- Authorization controls
- Metadata generation
- SVG URI validation

Run tests:

```bash
forge test
```

Run tests with gas reporting:

```bash
forge test --gas-report
```

## 🚀 Deployment

### Prerequisites

- [Foundry](https://book.getfoundry.sh/getting-started/installation) installed
- Ethereum wallet with testnet ETH

### Deploy to Local Network

```bash
# Start local Anvil node
anvil

# Deploy contract
forge script script/DeployMoodNft.s.sol --rpc-url http://localhost:8545 --private-key $PRIVATE_KEY --broadcast
```

### Deploy to Testnet

```bash
forge script script/DeployMoodNft.s.sol --rpc-url $SEPOLIA_RPC_URL --private-key $PRIVATE_KEY --broadcast --verify --etherscan-api-key $ETHERSCAN_API_KEY
```

## 🔧 Usage Examples

### Minting an NFT

```solidity
// Mint a new NFT (starts as HAPPY)
moodNft.mintNft();
```

### Flipping Mood

```solidity
// Change NFT mood from HAPPY to SAD (or vice versa)
moodNft.flipMood(tokenId);
```

### Viewing Token Metadata

```solidity
// Get current token metadata
string memory metadata = moodNft.tokenURI(tokenId);
```

## 🛡️ Security Features

- **Access Control**: Only token owners and approved operators can flip moods
- **Input Validation**: Proper checks for token existence and ownership
- **Reentrancy Protection**: Uses OpenZeppelin's battle-tested contracts
- **Gas Optimization**: Efficient storage patterns and function calls

## 🔍 Gas Usage

Approximate gas costs (may vary):

- Minting: ~80,000 gas
- Mood Flipping: ~30,000 gas
- Token URI Generation: View function (no gas cost)

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [OpenZeppelin](https://openzeppelin.com/) for secure smart contract libraries
- [Foundry](https://book.getfoundry.sh/) for the excellent development framework
- [Patrick Collins](https://github.com/PatrickAlphaC) for educational inspiration
- The Ethereum community for continuous innovation

## 📚 Learning Resources

- [Foundry Book](https://book.getfoundry.sh/)
- [OpenZeppelin Documentation](https://docs.openzeppelin.com/)
- [ERC-721 Standard](https://eips.ethereum.org/EIPS/eip-721)
- [Dynamic NFTs](https://ethereum.org/en/developers/docs/standards/tokens/erc-721/)

---

**Built with ❤️ using Foundry and OpenZeppelin**
