import "@openzeppelin/contracts/security/Pausable.sol";

contract ERC20Token is IERC20, Pausable {
    // ... existing code ...

    function transfer(address recipient, uint256 amount) public override whenNotPaused returns (bool) {
        // ... existing code ...
    }

    function transferFrom(address sender, address recipient, uint256 amount) public override whenNotPaused returns (bool) {
        // ... existing code ...
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }
}
