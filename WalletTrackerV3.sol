// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;
// in version two decided to use a struct so I could have names and addresses in seperate fields for updating purposes
contract WalletnamesV2 {
    struct Walletnames {
        string name;
        address walletAddress;
    }
    //this allows users to have there own trackers not everyuone sharing one got rid off array no longer needed since now using a mapping
    mapping(address => Walletnames[]) public userWallets; 
   
    event WalletAdded(string _name, address _walletAdress);

    function addWallet(string memory _name, address _walletAddress) public {
        userWallets[msg.sender].push(Walletnames(_name, _walletAddress));

        emit WalletAdded(_name, _walletAddress);
    }

    event WalletRemoved(string removeName, address removeAddress);
    //save the old values remove the entry and announce the saved values then remove wallet
    function removeWallet(uint256 index) public {
        require(index < userWallets[msg.sender].length, "Invalid index");
        // replace the selected wallet with last wallet in list
        string memory removeName = userWallets[msg.sender][index].name;
        address removeAddress = userWallets[msg.sender][index].walletAddress;

        userWallets[msg.sender][index] = userWallets[msg.sender][userWallets[msg.sender].length - 1];
        userWallets[msg.sender].pop();

        emit WalletRemoved(removeName, removeAddress);
    }
    //use dot operator to access specific catagory in a struct
    function renameWallet(uint256 index, string memory newname) public {
        userWallets[msg.sender][index].name = newname;
    }

    function getLength() public view returns (uint256) {
        return userWallets[msg.sender].length;
    }

    event _newAddress(address newAddress);
    //changes the address keeping the name the same
    function changeAddress(uint256 index, address newAddress) public {
        userWallets[msg.sender][index].walletAddress = newAddress;

        emit _newAddress(newAddress);
    }
}
