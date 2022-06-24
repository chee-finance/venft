// SPDX-License-Identifier: MIT
// solhint-disable-next-line
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";

interface ILockedToken {
  function transferFrom(
    address from,
    address to,
    uint256 amount
  ) external returns (bool);
}

contract VeNFT is ERC721, ERC721URIStorage, ERC721Enumerable {
  using Counters for Counters.Counter;

  Counters.Counter private _tokenIdCounter;
  address public admin;
  uint256 public _totalSupply = 0;

  struct LockedBalance {
    uint256 amount;
    uint256 end;
  }

  mapping(uint256 => LockedBalance) public nftLocked;

  constructor(string memory _name, string memory _symbol) ERC721(_name, _symbol) {
    admin = msg.sender;
  }

  function safeMint(
    string memory uri,
    uint256 _end,
    uint256 _amount,
    address _testTokenContract
  ) public returns (uint256) {
    require(_amount > 0 && _end > 0, "Value less than 0");
    ILockedToken(_testTokenContract).transferFrom(msg.sender, address(this), _amount);
    _tokenIdCounter.increment();
    _totalSupply++;
    uint256 tokenId = _tokenIdCounter.current();
    _mint(msg.sender, tokenId);
    _setTokenURI(tokenId, uri);
    nftLocked[tokenId].amount = _amount;
    nftLocked[tokenId].end = _end;
    return tokenId;
  }

  function _beforeTokenTransfer(
    address from,
    address to,
    uint256 tokenId
  ) internal override(ERC721, ERC721Enumerable) {
    super._beforeTokenTransfer(from, to, tokenId);
  }

  function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
    super._burn(tokenId);
  }

  function tokenURI(uint256 tokenId) public view override(ERC721, ERC721URIStorage) returns (string memory) {
    return super.tokenURI(tokenId);
  }

  function supportsInterface(bytes4 interfaceId) public view override(ERC721, ERC721Enumerable) returns (bool) {
    return super.supportsInterface(interfaceId);
  }

  function totalSupply() public view override returns (uint256) {
    return _totalSupply;
  }
}
