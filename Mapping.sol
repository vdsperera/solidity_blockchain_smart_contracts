pragma solidity 0.8.7;

contract Mapping{
    
    mapping(address => uint) balance;

    function add_balance(uint _balance) public returns(uint)
    {
        balance[msg.sender] = balance[msg.sender]+_balance;
        return balance[msg.sender];
    }
    
    function get_balance() public view returns(uint)
    {
        return balance[msg.sender];
    }
}