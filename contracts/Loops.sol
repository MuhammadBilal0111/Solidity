// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract ExpenseTracker{
    struct Expense{
        address user;
        string description;
        uint amount;
    }
    Expense[] public expense;
    constructor(){
        expense.push(Expense(msg.sender,"Groceries",56));
        expense.push(Expense(msg.sender,"Transportation",100));
        expense.push(Expense(msg.sender,"Dining out",200));
    }
    function addExpense(string memory _description, uint _amount) public {
        expense.push(Expense(msg.sender, _description, _amount));
    }
    function getTotalexpense(address _user) public view returns (uint){
        uint256 totalExpenses;
        for(uint i=0;i<expense.length;i++){
            if(expense[i].user==_user){
                totalExpenses+=expense[i].amount;
            }
        }
        return totalExpenses;
    }

}