# ERC-20-Token-Contract-Solidity

This Solidity contract implements an ERC-20 token, a standard for fungible tokens on the Ethereum blockchain. The contract defines the essential functions and events as per the ERC-20 specification, allowing for token creation, transfer, and management.

Features
Token Creation: Initializes the token with a name, symbol, decimals, and initial supply.
Token Transfer: Allows users to transfer tokens to other addresses.
Allowance Mechanism: Enables an account to approve another account to spend tokens on its behalf.
Event Logging: Emits events for transfers and approvals, facilitating easier tracking and logging.
Contract Details
Name: The name of the token.
Symbol: The symbol representing the token.
Decimals: The number of decimal places the token uses.
Total Supply: The total supply of tokens created.
Balances: A mapping to track the balance of each account.
Allowances: A mapping to track the allowances granted to spenders by token owners.
