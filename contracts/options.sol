// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

interface ERC20 
{
	function transferFrom(address sender, address recipient, uint256 amount) external;	
}

contract Options
{
	//string name = '$MTRG Calls ($BUSD)';

	uint256 public count;

	mapping
	(
		uint256 => address;
	)
	public writer;

	mapping
	(
		uint256 => address;
	)
	public ownerOf;

	// $MTRG
	address tokenA = 0x228ebbee999c6a7ad74a6130e81b12f9fe237ba3;

	mapping
	(
		uint256 => uint256;
	) 
	public amountA;

	// $BUSD
	address tokenB = 0x24aa189dfaa76c671c279262f94434770f557c35;

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

	function create
	(
		address _saleToken,
		uint256 _saleAmount,
		uint256 _amountA,
		uint256 _amountB,
		uint256 _expiryBlock
	)
	public
	{
		ERC20(tokenA[_id]).transferFrom(msg.sender, this.address, amountA[_id]);

		count++;
		writer[count] = msg.sender;
		ownerOf[count] = msg.sender;
		amountA[count] = _amountA;
		amountB[count] = _amountB;
		expiryBlock[count] = _expiryBlock;
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

	function transfer
	(
		uint256 _id;
	)
	public
	{
		// similar to ERC20 transfer
	}

	function cancel
	(
		uint256 _id
	)
	public
	{
		// cancel contract and get tokens back
		// only if person calling function is contract writer
		// only if person calling function is contract owner ()
	}
}
