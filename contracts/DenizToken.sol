// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract DenizToken is ERC20 {
    uint256 public maxTotalSupply;
    address public owner;

    modifier onlyOwner {
        require(owner == msg.sender, "only owner");
        _;
    }

    constructor(uint256 _maxTotalSupply) ERC20("Deniz Token", "DNZ") {
        owner = msg.sender;
        maxTotalSupply = _maxTotalSupply * 1e18;
    }

    function mint(address to, uint256 amount) public onlyOwner {
        require(totalSupply() + amount <= maxTotalSupply, "Max total supply exceeded");
        _mint(to, amount);
    }
}
