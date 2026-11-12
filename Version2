// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;
// in version two decided to use a struct so I could have names and addresses in seperate fields for updating purposes
contract WalletnamesV2 {
    struct Walletnames {
        string name;
        address walletAddress;
    }
    //changed array name from version one array is all lowercase now
    Walletnames[] public walletnames;

    event WalletAdded(string _name, address _walletAdress);

    function addWallet(string memory _name, address _walletAddress) public {
        walletnames.push(Walletnames(_name, _walletAddress));

        emit WalletAdded(_name, _walletAddress);
    }

    event WalletRemoved(string removeName, address removeAddress);
    //save the old values remove the entry and announce the saved values then remove wallet
    function removeWallet(uint256 index) public {
        require(index < walletnames.length, "Invalid index");
        // this allows the event to be able to use the values after. needed to store in local variables other wise we would be earasing everything
        string memory removeName = walletnames[index].name;
        address removeAddress = walletnames[index].walletAddress;

        walletnames[index] = walletnames[walletnames.length - 1];
        walletnames.pop();

        emit WalletRemoved(removeName, removeAddress);
    }
    //use dot operator to access specific catagory in a struct
    function renameWallet(uint256 index, string memory newname) public {
        walletnames[index].name = newname;
    }

    function getLength() public view returns (uint256) {
        return walletnames.length;
    }
}
