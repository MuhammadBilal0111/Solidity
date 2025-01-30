// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Array{
    // ways to innitialize array
    // 1. Dynamic initialization

    uint[] public arr = [1,2,3];
    string[] public name = ["john", "will", "doe"];

    // 2. Static initialization
    uint[10] public myFixedSizeArr;
    string[5] public names=["bill","john","doe","smith","carl"];

    function get(uint i) public view returns (uint) {
        return arr[i];
    }
    // function to return array
    function getArr() public view returns (uint[] memory){
        return arr;
    }
    function getName() public view returns (string[5] memory) {
        return names;
    }
    function addToDynamicArray(uint value) public {
        arr.push(value);
    }
    function getDynamicarrayLength() public view returns (uint[] memory){
        return arr;
    }

}