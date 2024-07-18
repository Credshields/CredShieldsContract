// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/utils/Pausable.sol";

contract TOKEN is ERC20, Pausable {
    address owner;
    event Burn(address from, uint256 amount);
    event UpdateOwner(address newOwner);

    constructor(uint256 initialSupply) ERC20("TOKEN", "TKN") {
        _mint(msg.sender, initialSupply * 10**18);
        owner = msg.sender;
    }

    function burn(address _from, uint256 _amount) external whenNotPaused {
        _burn(_from, _amount);
        emit Burn(_from, _amount);
    }

    function pause() external {
        _pause();
    }
    function unpause() external {
        _unpause();
    }
}
