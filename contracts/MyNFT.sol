// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyNFT is ERC721URIStorage, Ownable {
    uint public tokenCount;

    constructor() ERC721("KIA NFT", "KNFT") Ownable(msg.sender) {
        // msg.sender به عنوان مالک قرارداد تنظیم می‌شود
    }

    function mintNFT(address to, string memory tokenURI) public onlyOwner returns (uint) {
        tokenCount++;
        _safeMint(to, tokenCount);
        _setTokenURI(tokenCount, tokenURI);
        return tokenCount;
    }
}
