// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract MyToken {

    // public variables
    string public name;
    string public symbol;
    uint256 public totalSupply;

    // mapping variable
    mapping(address => uint256) public balances;

    // constructor to initialize the token details
    constructor(string memory _name, string memory _symbol, uint256 _totalSupply) {
        name = _name;
        symbol = _symbol;
        totalSupply = _totalSupply;
        balances[msg.sender] = _totalSupply; // Assign the total supply to the contract creator initially
    }

    // mint function
    function mint(address _recipient, uint256 _value) public {
        totalSupply += _value;
        balances[_recipient] += _value;
    }

    // burn function
    function burn(address _owner, uint256 _value) public {
        require(balances[_owner] >= _value, "Insufficient balance to burn");
        totalSupply -= _value;
        balances[_owner] -= _value;
    }
}

