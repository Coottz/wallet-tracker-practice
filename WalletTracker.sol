// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;
//This is a little mock contract that keeps track of your wallet addresses and later balances basically a portfolio tracker
//using string type for simplicity
contract MyContract {
    string[] public Walletnames = ["Trading", "LTH", "Meme"];

    function get(uint256 index) public view returns (string memory) {
        return Walletnames[index];
    }

    function addWallet(string memory name) public {
        Walletnames.push(name);
    }
    //instead of just using pop this removes the selected choice
    function removeWallet(uint256 index) public {
        require(index < Walletnames.length, "Invalid index");

        Walletnames[index] = Walletnames[Walletnames.length - 1];
        Walletnames.pop();
    }
    //parameters are inputs the body uses those inputs to make the changes
    //rename an existing wallet in the array
    function renameWallet(uint256 index, string memory newname) public {
        Walletnames[index] = newname;
    }

    function getLength() public view returns (uint256) {
        return Walletnames.length;
    }
}
