// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

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
    
    // "memory" specify that, it exists when the function is called
    function add_person(uint256 _favorite_number, string memory _name) public
    {
        People memory person = People(_favorite_number, _name);
        people.push(person);
        // name_to_favorite_number[_name] = _favorite_number;
    }

    function retrieve_person(uint index) public view returns(People memory)
    {
        People memory person = people[index];
        return person;
    }

    function all_persons() public view returns(People[] memory)
    {
        return people;
    }

}