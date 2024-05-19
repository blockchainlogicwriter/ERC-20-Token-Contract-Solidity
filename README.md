# ERC-20-Token-Contract-Solidity
This Solidity contract implements the ERC-20 token standard, which is a widely-used protocol for creating fungible tokens on the Ethereum blockchain. Below is a detailed description of the contract's components and functionality:

Contract Overview
Name: ERC20Token
Standards Implemented: ERC-20 (as per the IERC20 interface)
License: MIT
Compiler Version: Solidity 0.8.0
Key Components
1. IERC20 Interface
This interface defines the standard functions and events that an ERC-20 token must implement:

Functions:
totalSupply(): Returns the total supply of tokens.
balanceOf(address account): Returns the token balance of a specific account.
transfer(address recipient, uint256 amount): Transfers a specified amount of tokens to a recipient.
allowance(address owner, address spender): Returns the remaining number of tokens that spender is allowed to spend on behalf of owner.
approve(address spender, uint256 amount): Approves a spender to use a specified amount of tokens.
transferFrom(address sender, address recipient, uint256 amount): Transfers a specified amount of tokens from a sender to a recipient using an allowance.
Events:
Transfer(address indexed from, address indexed to, uint256 value): Emitted when tokens are transferred.
Approval(address indexed owner, address indexed spender, uint256 value): Emitted when an approval is granted.
2. ERC20Token Contract Implementation
State Variables:

name: The name of the token.
symbol: The symbol of the token.
decimals: The number of decimals the token uses (usually 18).
_totalSupply: The total supply of the tokens.
_balances: A mapping that holds the balance of each account.
_allowances: A mapping that holds the allowances granted to spenders by the token owners.
Constructor:
The constructor initializes the token's name, symbol, decimals, and total supply. It assigns the entire initial supply to the deployer's address and emits a Transfer event from the zero address to the deployer.

solidity
Copy code
constructor(string memory _name, string memory _symbol, uint8 _decimals, uint256 initialSupply) {
    name = _name;
    symbol = _symbol;
    decimals = _decimals;
    _totalSupply = initialSupply * 10 ** uint256(decimals);
    _balances[msg.sender] = _totalSupply;
    emit Transfer(address(0), msg.sender, _totalSupply);
}
Functions:

totalSupply(): Returns the total supply of tokens.

balanceOf(address account): Returns the token balance of a specific account.

transfer(address recipient, uint256 amount): Transfers a specified amount of tokens from the caller's account to a recipient.

solidity
Copy code
function transfer(address recipient, uint256 amount) public override returns (bool) {
    require(recipient != address(0), "ERC20: transfer to the zero address");
    require(_balances[msg.sender] >= amount, "ERC20: transfer amount exceeds balance");

    _balances[msg.sender] -= amount;
    _balances[recipient] += amount;
    emit Transfer(msg.sender, recipient, amount);
    return true;
}
allowance(address owner, address spender): Returns the remaining number of tokens that a spender is allowed to spend on behalf of an owner.

solidity
Copy code
function allowance(address owner, address spender) public view override returns (uint256) {
    return _allowances[owner][spender];
}
approve(address spender, uint256 amount): Approves a spender to use a specified amount of the caller's tokens.

solidity
Copy code
function approve(address spender, uint256 amount) public override returns (bool) {
    require(spender != address(0), "ERC20: approve to the zero address");

    _allowances[msg.sender][spender] = amount;
    emit Approval(msg.sender, spender, amount);
    return true;
}
transferFrom(address sender, address recipient, uint256 amount): Transfers a specified amount of tokens from a sender to a recipient using an allowance.

solidity
Copy code
function transferFrom(address sender, address recipient, uint256 amount) public override returns (bool) {
    require(sender != address(0), "ERC20: transfer from the zero address");
    require(recipient != address(0), "ERC20: transfer to the zero address");
    require(_balances[sender] >= amount, "ERC20: transfer amount exceeds balance");
    require(_allowances[sender][msg.sender] >= amount, "ERC20: transfer amount exceeds allowance");

    _balances[sender] -= amount;
    _balances[recipient] += amount;
    _allowances[sender][msg.sender] -= amount;

    emit Transfer(sender, recipient, amount);
    return true;
}
Summary
This contract implements a basic ERC-20 token with standard functionalities such as token transfers, balance inquiries, and allowance mechanisms. It follows the ERC-20 standard interface to ensure compatibility with other Ethereum applications and services. The initial supply of tokens is assigned to the deployer of the contract, and the contract includes necessary safety checks to prevent invalid transactions.
