//SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;

contract A{
        mapping(address => mapping(address => uint256)) private _allowances;

       function transfer(address recipient, uint256 amount) public virtual override returns (bool) {
        _transfer(_msgSender(), recipient, amount);
        return true;
    }
        function _transfer(address sender,address recipient,uint256 amount) internal virtual {
        uint256 senderBalance = _balances[sender];
        _balances[sender] = senderBalance - amount;
        _balances[recipient] += amount;
    }

        function transferFrom(address sender,address recipient,uint256 amount) public virtual override returns (bool) {
        _transfer(sender, recipient, amount);

        uint256 currentAllowance = _allowances[sender][_msgSender()];
        require(currentAllowance >= amount, "ERC20: transfer amount exceeds allowance");
        unchecked {
            _approve(sender, _msgSender(), currentAllowance - amount);
        }

        return true;
    }

    function _approve(address owner,address spender,uint256 amount) internal virtual {
        
        _allowances[owner][spender] = amount;
    }
}