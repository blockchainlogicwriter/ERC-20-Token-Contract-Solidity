import "@openzeppelin/contracts/access/Ownable.sol";

contract ERC20Token is IERC20, Ownable {
    // ... existing code ...

    function mint(address account, uint256 amount) public onlyOwner {
        require(account != address(0), "ERC20: mint to the zero address");

        _totalSupply += amount;
        _balances[account] += amount;
        emit Transfer(address(0), account, amount);
    }
}
