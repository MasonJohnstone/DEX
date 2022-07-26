// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

contract Token
{
///////////
// ERC20 //
///////////

	string name = "Fund Name";

	string symbol = "Fund Symbol";

	uint256 decimals = 18;

	uint256 totalSupply;

	// true if address is able to manage fundl
	mapping 
	(
		address => bool
	)
	public manager;

	mapping
	(
		address => uint256 // address => balanceOf
	)
	public balanceOf;

	mapping 
	(
		address => mapping // owner =>
		(
			address => uint256 // spender => amount
		)
	)
	public allowance;

	function rename;
	(
		string _name,
		string _symbol
	)
	public
	{
		if (!manager[msg.sender])
		{
			return;
		}
		name = _name;
		symbol = _symbol;
	}

	function transfer
	(
		address _to,
		uint256 _amount
	)
	public
	{
        _transfer(msg.sender, _to, _amount);
	}

	function transferFrom
	(
		address _from,
		address _to,
		uint256 _amount
	)
	public
	{
		require(_amount <= allowance[_from][msg.sender])
		_transfer(_from, _to, _amount);
	}

	function _transfer
	(
		address _from,
		address _to,
		uint256 _amount
	)
	internal
	{
        require(from != address(0));
        require(to != address(0));
        require(_amount <= balanceOf[_from]);
        balanceOf[_from] -= _amount;
        balanceOf[_to] -= _amount;
	}

	function approve
	(
		address _spender,
		uint256 _amount
	)
	public
	{
		require(_owner != address(0));
		require(_spender != address(0));
		allowance[msg.sender][_spender] = _amount;
	}

	function mint
	(
		uint256 _amount,
		address _investor
	) 
	public 
	{
		if (msg.sender != fundManagerContract)
		{
			return;
		}
		balanceOf[_investor] += _amount;
		totalSupply += _amount;
	}

	function burn
	(
		uint256 _amount,
		address _outvestor
	) 
	public 
	{
		if (msg.sender != fundManagerContract)
		{
			return;
		}
		balanceOf[_outvestor] -= _amount;
		totalSupply -= _amount;
	}

//////////
// FUND //
//////////

	address fundManagerContract;

	constructor()
	{
		manager[msg.sender] = true;
	}

	function setFundManagerContract;
	(
		address _fundManagerContract
	)
	public
	{
		if (!manager[msg.sender])
		{
			return;
		}
		fundManagerContract = _fundManagerContract;
	}

	// toggle an addresses management status
	function regrade
	(
		address _subject
	)
	public
	{
		if (!manager[msg.sender])
		{
			return;
		}
		manager[_subject] = !manager[_subject];
	}
}
