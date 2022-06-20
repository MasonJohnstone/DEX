// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

interface ERC20 
{
	function transferFrom(address sender, address recipient, uint256 amount) external;	
}

contract Options
{
	uint256 public count;

	mapping
	(
		uint256 => address;
	)
	public seller;

	mapping
	(
		uint256 => address;
	)
	public owner;

	mapping
	(
		uint256 => address;
	)
	public saleToken;

	mapping
	(
		uint256 => uint256;
	)
	public saleAmount;

	mapping
	(
		uint256 => address;
	)
	public contractAddressA;

	mapping
	(
		uint256 => uint256;
	) 
	public amountA;

	mapping
	(
		uint256 => address;
	)
	public contractAddressB

	mapping
	(
		uint256 => uint256;
	)
	public amountB;

	mapping
	(
		uint256 => uint256;
	)
	public expiryBlock;

	mapping
	(
		uint256 => address;
	)
	public reseller;

	function create
	(
		address _saleToken,
		uint256 _saleAmount,
		address _tokenA,
		uint256 _amountA,
		address _tokenB,
		uint256 _amountB,
		uint256 _expiryBlock
	)
	public
	{
		ERC20(tokenA[_id]).transferFrom(msg.sender, this.address, amountA[_id]);

		count++;
		seller[count] = msg.sender;
		saleToken[count] = _saleToken;
		saleAmount[count] = _saleAmount;
		tokenA[count] = _tokenA;
		amountA[count] = _amountA;
		tokenB[count] = _tokenB;
		amountB[count] = _amountB;
		expiryBlock[count] = _expiryBlock;
		reseller[count] = _msg.sender;
	}

	function purchase
	(
		uint256 _id;
	)
	public
	{
		ERC20(saleToken[_id]).transferFrom(msg.sender, reseller[_id], saleAmount[_id]);
		owner[_id] = msg.sender;
	}

	function exercise
	(
		uint256 _id
	)
	public
	{
		if (block.number > expiryblock[_id])
		{
			return;
		}
		if (msg.sender != owner[_id])
		{
			return;
		}

		ERC20(_tokenA[_id]).transferFrom(this.address, msg.sender, amountA[_id]);
		ERC20(_tokenB[_id]).transferFrom(msg.sender, seller[_id], amountB[_id]);
	}

	function list
	(
		uint256 _id,
		address _saleToken,
		uint256 _saleAmount
	)
	public
	{
		if (block.number > expiryblock[_id])
		{
			return;
		}
		if (msg.sender != owner[_id])
		{
			return;
		}

		reseller[_id] = msg.sender;
		saleToken[_id] = _saleToken;
		saleAmount[_id] = _saleAmount;
	}
}
