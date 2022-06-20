// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

interface ERC20 
{
	function transferFrom(address sender, address recipient, uint256 amount) external;	
}

contract OptionOB
{
	// uint256 optionContractChain
	// [address optionContractAddress]
	// [uint256 expirationBlock]
	// [uint256 rate(tokenA/tokenB)]
	// [int256 quantityTokenA(1*10^x)]
	// [uint256 price(price per token A, can only buy a whole contract)]
	// [uint256 previosIDInChain] - set this as 0 to get first contract that fullfils
	mapping
	(
		address => mapping // option contract address =>
		(
			uint256 => mapping // expiration block =>
			(
				uint256 => mapping // rate =>
				(
					int256 => mapping // quantityTokenA =>
					(
						uint256 => mapping // price =>
						(
							uint256 => uint256 // previous price in chain => option contract ID
						)
					)
				)
			)
		)
	)
	public idChain;

	// uint256 priceChain
	// [address optionContractAddress]
	// [uint256 expirationBlock]
	// [uint256 rate(tokenA/tokenB)]
	// [int256 quantityTokenA(1*10^x)]
	// [uint256 previosPriceInChain] - set this as 0 to get the lowest price a
	mapping
	(
		address => mapping // option contract address =>
		(
			uint256 => mapping // expiration block =>
			(
				uint256 => mapping // rate =>
				(
					int256 => mapping // quantityTokenA =>
					(
						uint256 => uint256 // previous price in chain => price
					)
				)
			)
		)
	)
	public priceChain;

	// bool isListed
	// [address optionContractAddress]
	// [uint256 optionContractId]
	mapping 
	(
		address => mapping // option contract address
		(
			uint256 => bool // option contract id => is listed?
		)
	)
	public isListed;

	// uint256 predecessor
	// [address optionContractAddress]
	// [uint256 optionContractId]
	mapping 
	(
		address => mapping // option contract address
		(
			uint256 => uint256 // option contract id => predecessor
		)
	)
	public predecessor;

	function list
	(
		address _optionContract,
		uint256 _id,
		address _saleToken,
		uint256 _price
	)
	public 
	{

	}

	function delist
	(
		address _optionContract,
		uint256 _id
	)
	public
	{

	}

	function purchase
	(	
		address _optionContract,
		uint256 _id
	)
	public
	{

	}
}
