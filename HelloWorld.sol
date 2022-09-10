pragma solidity 0.8.7;

contract Hello_World
{
    string message = '';
    
    constructor(string memory _message)
    {
        message = _message;
    }
    
    function set_message(string memory _message) public
    {
        message = _message;
    }
    
    function get_message() public view returns(string memory)
    {
        return message;
    }
    
    function get_owner() public view returns(string memory)
    {
        if(msg.sender == 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4)
        {
            return message;
        }
        return "Unauthorized Request";
    }
}