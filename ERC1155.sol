// SPDX-License-Identifier: MIT
// ERC 1155 practical
// Testing the git ignore all another file and folder here ...
// new test
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/token/ERC1155/extensions/ERC1155Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract GameItems is ERC1155 {
    uint256 public constant GOLD = 0;
    uint256 public constant SILVER = 1;
    uint256 public id = 3;
    address public owner;
    string public name;
    string public symbol;

    constructor() ERC1155("https://ipfs.io/ipfs/Qmd2ggna3Gi5mtVUGGivj8GNZCULu2JYuZLAZeypKyVrwR/{id}.json") { 
        _mint(msg.sender, GOLD, 1, "");
        owner = msg.sender;
        name = "Tick Tack Toe";
        symbol = "TTT";
    }

    function mint () external {
        require(owner == msg.sender, "You are not owner");
        _mint(msg.sender, GOLD, 1, "");
    }

    function uri(uint256 _tokenid) public pure override returns (string memory) {
        return  string(
            abi.encodePacked(
                "https://ipfs.io/ipfs/Qmd2ggna3Gi5mtVUGGivj8GNZCULu2JYuZLAZeypKyVrwR/",
                Strings.toString(_tokenid),
                ".json"
            )
        );
    }

    function contractURI() public pure returns (string memory){
        return "https://ipfs.io/ipfs/Qmd2ggna3Gi5mtVUGGivj8GNZCULu2JYuZLAZeypKyVrwR/TickTackToe.json";
    }

}