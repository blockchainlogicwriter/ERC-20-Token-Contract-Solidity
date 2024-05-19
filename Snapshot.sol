import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Snapshot.sol";

contract ERC20Token is IERC20, ERC20Snapshot {
    // ... existing code ...

    function snapshot() public onlyOwner {
        _snapshot();
    }
}
