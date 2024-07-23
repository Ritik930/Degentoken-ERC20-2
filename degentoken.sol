pragma solidity ^0.8.23;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC20, Ownable {
    
    uint256 public constant REDEMPTION_RATE_SWORD = 100;
    uint256 public constant REDEMPTION_RATE_SHIELD = 150;
    uint256 public constant REDEMPTION_RATE_ARMOR = 200;

    struct Items {
        uint256 swords;
        uint256 shields;
        uint256 armors;
    }

    mapping(address => Items) public itemsOwned;

    constructor() ERC20("Degen", "DGN") Ownable(msg.sender) {
        _mint(msg.sender, 10 * (10 ** uint256(decimals())));
    }

    function redeemSword(uint256 quantity) public {
        uint256 cost = REDEMPTION_RATE_SWORD * quantity;
        require(balanceOf(msg.sender) >= cost, "Not enough tokens to redeem for a sword");

        itemsOwned[msg.sender].swords += quantity;
        _burn(msg.sender, cost);
    }

    function redeemShield(uint256 quantity) public {
        uint256 cost = REDEMPTION_RATE_SHIELD * quantity;
        require(balanceOf(msg.sender) >= cost, "Not enough tokens to redeem for a shield");

        itemsOwned[msg.sender].shields += quantity;
        _burn(msg.sender, cost);
    }

    function redeemArmor(uint256 quantity) public {
        uint256 cost = REDEMPTION_RATE_ARMOR * quantity;
        require(balanceOf(msg.sender) >= cost, "Not enough tokens to redeem for armor");

        itemsOwned[msg.sender].armors += quantity;
        _burn(msg.sender, cost);
    }

    function checkItemsOwned(address user) public view returns (uint256 swords, uint256 shields, uint256 armors) {
        Items storage items = itemsOwned[user];
        return (items.swords, items.shields, items.armors);
    }

    function mintTokens(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function checkBalance(address account) public view returns (uint256) {
        return balanceOf(account);
    }

    function burnTokens(uint256 amount) public {
        require(balanceOf(msg.sender) >= amount, "Not enough tokens to burn");
        _burn(msg.sender, amount);
    }

    function transferTokens(address to, uint256 amount) public {
        require(to != address(0), "Invalid address");
        require(balanceOf(msg.sender) >= amount, "Not enough tokens to transfer");
        _transfer(msg.sender, to, amount);
    }
}
