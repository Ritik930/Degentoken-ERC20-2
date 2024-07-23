# Degentoken-ERC20-2
# DegenToken Smart Contract

### Prerequisites
- Node.js and npm installed on your computer.
- MetaMask extension installed on your browser.

### Setup Instructions

#### Install Dependencies
Open your terminal and navigate to the project directory:

cd /path/to/your/project
Install npm dependencies:


npm install
Run Local Ethereum Node
Open a second terminal in your VS Code or another terminal window.
Start a local Ethereum node using Hardhat:


npx hardhat node
Deploy Smart Contracts
Open a third terminal in VS Code or another terminal window.
Deploy your smart contracts to the local network:


npx hardhat run --network localhost scripts/deploy.js
Replace scripts/deploy.js with the path to your actual deployment script if it's located elsewhere.

Interacting with the Contract
### Mint Tokens
To mint new tokens, use the following function in your contract:


function mintTokens(address to, uint256 amount) public onlyOwner {
    _mint(to, amount);
}
Only the contract owner can mint new tokens.

### Transfer Tokens
To transfer tokens to another address, use the following function:

function transferTokens(address to, uint256 amount) public {
    require(to != address(0), "Invalid address");
    require(balanceOf(msg.sender) >= amount, "Not enough tokens to transfer");
    _transfer(msg.sender, to, amount);
}
### Redeem Sword
To redeem tokens for an in-game sword, use the following function:


function redeemSword(uint256 quantity) public {
    uint256 cost = REDEMPTION_RATE * quantity;
    require(balanceOf(msg.sender) >= cost, "Not enough tokens to redeem for a sword");

    swordsOwned[msg.sender] += quantity;
    _burn(msg.sender, cost);
}
### Check Balance
To check the token balance of an address, use the following function:


function checkBalance(address account) public view returns (uint256) {
    return balanceOf(account);
}
### Burn Tokens
To burn tokens, use the following function:


function burnTokens(uint256 amount) public {
    require(balanceOf(msg.sender) >= amount, "Not enough tokens to burn");
    _burn(msg.sender, amount);
}
Launch Frontend
Back in the first terminal, start the development server:

npm run dev
Accessing Your Project
Once the development server is running, you can access your project in a web browser at:


http://localhost:3000/
### Additional Notes
Make sure all three terminals remain open while you're working on the project. Each terminal serves a different purpose:
First terminal: Installing dependencies and running the frontend.
Second terminal: Running the local Ethereum node.
Third terminal: Deploying smart contracts.
Ensure that Hardhat is correctly configured (hardhat.config.js) with the necessary network settings (localhost in this case) and that your deploy.js script correctly references your contracts.

### Author
-Ritik Kumar (LinkedIn: Ritik Kumar)
### License

This project is licensed under the MIT License. 
