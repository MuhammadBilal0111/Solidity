// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;
contract Calculator{
    uint256 result=0; // save in blockchain and we are just manipulating the result
    function add(uint256 num) public { // public function anybody can see it
        result+=num;
    }
    function subtract(uint256 num) public{
        result-=num;
    }
    function multiply(uint256 num) public {
        result*=num;
    }
    function division(uint256 num) public {
        result/=num;
    }
    function get() public view returns (uint256){ // view b/c we are not changing the state
        return result;
    }
}