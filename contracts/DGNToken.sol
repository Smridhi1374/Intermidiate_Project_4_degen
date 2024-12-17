// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "hardhat/console.sol";

contract DGNToken is ERC20, Ownable {

    constructor() ERC20("Degen", "DGN") Ownable(msg.sender) {}

        function mintTokens(address to, uint256 amount) public onlyOwner {
            _mint(to, amount);
        }

        function burnTokens(uint256 _value) external {
        require(balanceOf(msg.sender) >= _value, "You do not have enough tokens");
            _burn(msg.sender,_value);
        }

        function checkBalance() external view returns (uint256) {
            return this.balanceOf(msg.sender);
        }
        
        function checkUserBalance(address usr) external view onlyOwner returns (uint256) {
            return this.balanceOf(usr);
        }

        function transferTokens(address _receiver, uint256 _value) external {
            require(balanceOf(msg.sender) >= _value, "You do not have enough tokens");
            approve(msg.sender, _value);
            transferFrom(msg.sender,_receiver, _value);
        }

        function checkShopInventory() external pure returns (string memory) {
            console.log("Welcome to Crypto Shop!");
            console.log("Available Items are listed below : ");
            console.log("1 car    20DGN");
            console.log("2 truck       10DGN");
            console.log("3 semi-truck    5DGN");
            console.log("4 auto  3DGN");
            console.log("5 cycle  2DGN");
            return "Welcome to crypto Shop!\nAvailable Items are listed below : \n1 car    20DGN\n2 truck      10DGN\n3 semi-truck    5DGN\n4 auto  3DGN\n5 cycle  2DGN";
        }

        function buyItem(uint8 _itemNumber) external payable returns (bool) {
            if (_itemNumber == 1) {
                require(this.balanceOf(msg.sender) >= 20, "You need more tokens!");
                approve(msg.sender, 20);
                transferFrom(msg.sender, owner(), 20);
                console.log("Congratulations! You have successfully purchased the legendary car!");
                return true;
            }
            else if (_itemNumber == 2) {
                require(this.balanceOf(msg.sender) >= 10, "You need more tokens!");
                approve(msg.sender, 10);
                transferFrom(msg.sender, owner(), 10);
                console.log("Congratulations! You have successfully purchased the truck!");
                return true;
            }
            else if (_itemNumber == 3) {
                require(this.balanceOf(msg.sender) >= 5, "You need more tokens!");
                approve(msg.sender, 5);
                transferFrom(msg.sender, owner(), 5);
                console.log("Congratulations. You have successfully purchased semi-truck!");
                return true;
            }
            else if (_itemNumber == 4) {
                require(this.balanceOf(msg.sender) >= 3, "You need more tokens!");
                approve(msg.sender, 3);
                transferFrom(msg.sender, owner(), 3);
                console.log("Congratulations. You have successfully purchased the auto!");
                return true;
            }
            else if (_itemNumber == 5) {
                require(this.balanceOf(msg.sender) >= 2, "You need more tokens!");
                approve(msg.sender, 2);
                transferFrom(msg.sender, owner(), 2);
                console.log("Congratulations. You have successfully purchased the cycle!");
                return true;
            }
            else {
                console.log("Please choose a valid item!");
                return false;
            }
        }
}
