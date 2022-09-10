pragma solidity 0.8.7;

contract Structs
{
    
    struct Person
    {
        uint id;
        string name;
        uint age;
    }
    
    Person[] person_array;
    
    function add_person(uint _id, string memory _name, uint _age) public
    {
        Person memory person = Person(_id, _name, _age);
        person_array.push(person);
    }
    
    function get_person(uint _index) public view returns(Person memory)
    {
        Person memory person = person_array[_index];
        return person;
    }
    
    // function get_person(uint _index) public view returns(uint, string memory, uint)
    // {
    //     Person memory person = person_array[_index];
    //     return (person.index, person.name, person.age);
    // }
    
    
}