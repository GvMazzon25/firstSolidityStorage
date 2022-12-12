//SPDX-License-Identifier: MIT
pragma solidity >=0.8.7 <0.8.17; //dichiarare la versione

contract SimpleStorage {
    //bolean, (solo + )uint, (+,-)int, address, bytes)
    //bool hasFavouriteNumber = true;
    //string favouriteNumberInText = "Five";
    //int256 favouriteInt = -5;
    //address myAddress = 0x946D6ea7AdEC3379236A5A297A61eFc715105e72;
    //bytes32 favouriteBytes = "cat";

    uint256 favouriteNumber; //automaticamente è 0
    //People public person = People({favouriteNumber: 21, name: "Giorgio"});
    //People public person1 = People({favouriteNumber: 10, name: "Antonio"});
    //People public person2 = People({favouriteNumber: 2, name: "Naria"});

    mapping(string => uint256) public nameToFavouriteNumber;

    struct People {
        uint256 favouriteNumber;
        string name;
    }

    People[] public people;

    function store(uint256 _favouriteNumber) public {
        favouriteNumber = _favouriteNumber;
    }

    //view, pure
    function retreive() public view returns(uint256){
        return favouriteNumber;
    }

    //calldata (la variabile esiste momentaneamente non modificabile), memory (la variabile esiste momentaneamente ed è modificabile), storage(variabile permanente e modificabile). Servono per tipi come array, stringhe ecc non per tipi come int, uint.
    function addPerson(string memory _name, uint256 _favouriteNumber) public {
        People memory newPerson = People({favouriteNumber: _favouriteNumber, name: _name});
        people.push(newPerson);
        nameToFavouriteNumber[_name] = _favouriteNumber;
    }
}
//0xd9145CCE52D386f254917e481eB44e9943F39138