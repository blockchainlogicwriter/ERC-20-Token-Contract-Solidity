contract ERC20Token is IERC20 {
    struct Timelock {
        uint256 amount;
        uint256 releaseTime;
    }

    mapping(address => Timelock[]) private _timelocks;

    function transferWithLock(address recipient, uint256 amount, uint256 releaseTime) public returns (bool) {
        require(recipient != address(0), "ERC20: transfer to the zero address");
        require(_balances[msg.sender] >= amount, "ERC20: transfer amount exceeds balance");
        require(releaseTime > block.timestamp, "ERC20: release time is before current time");

        _balances[msg.sender] -= amount;
        _timelocks[recipient].push(Timelock(amount, releaseTime));
        emit Transfer(msg.sender, address(this), amount);
        return true;
    }

    function releaseLockedTokens() public {
        uint256 totalReleased = 0;
        for (uint256 i = 0; i < _timelocks[msg.sender].length; i++) {
            if (_timelocks[msg.sender][i].releaseTime <= block.timestamp) {
                totalReleased += _timelocks[msg.sender][i].amount;
                _timelocks[msg.sender][i] = _timelocks[msg.sender][_timelocks[msg.sender].length - 1];
                _timelocks[msg.sender].pop();
            }
        }
        require(totalReleased > 0, "ERC20: no tokens to release");
        _balances[msg.sender] += totalReleased;
        emit Transfer(address(this), msg.sender, totalReleased);
    }
}
