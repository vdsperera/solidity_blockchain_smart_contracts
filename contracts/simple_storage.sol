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
    
    // "memory" specify that, where it exists when the function is called
    // when we store data in 'memory' then they only stored during the execution
    // if we store data in 'storage' then they can be access even after the execution 
    function add_person(uint256 _favorite_number, string memory _name) public
    {
        People memory person = People(_favorite_number, _name);
        people.push(person);
        name_to_favorite_number[_favorite_number] = _name;
    }

    function retrieve_person(uint256 _index) public view returns(People memory)
    {
        People memory person = people[_index];
        return person;
    }

    function get_all_persons() public view returns(People[] memory)
    {
        return people;
    }

}