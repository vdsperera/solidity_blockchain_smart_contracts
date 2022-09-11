// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.6.0;

contract SimpleStorage 
{
    // 'internal' is the default visibility for state variables
    // uint256 internal favorite_number
    // bool internal favorite_bool
    uint256 favorite_number;
    bool favorite_bool;
    
    struct People
    {
        uint256 favorite_number;
        string favorite_name;
    }

    People[] public people;
    mapping(uint256 => string) public name_to_favorite_number;
    
    // with 'public' this function is added to contract interface
    function store(uint256 _favorite_number) public
    {
        favorite_number = _favorite_number;
    }
    
    // with 'view', state variables can be read, but not modify
    // with 'returns', it specify that this function will return uint256
    function retrieve() public view returns(uint256)
    {
        return favorite_number;
    }
    
    function add_person(uint256 _favorite_number, string memory _name) public
    {
        people.push(People(_favorite_number, _name));
        // name_to_favorite_number[_name] = _favorite_number;
    }

    function retrieve_persons() public view returns(People[] memory)
    {
        return people;
    }

}