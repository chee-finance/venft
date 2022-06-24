// SPDX-License-Identifier: MIT
// solhint-disable-next-line
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract TestToken is ERC20, ERC20Burnable {
  address public admin;

  event MinterChanged(address indexed from, address to);

  constructor(string memory _name, string memory _symbol) payable ERC20(_name, _symbol) {
    admin = msg.sender;
  }

  function claim(address account, uint256 amount) public {
    _mint(account, amount);
  }
}
