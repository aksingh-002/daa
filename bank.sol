pragma solidity 0.4.25;

contract Bank {

    int bal;

    constructor() public {
        bal = 0;
    }

    function input_bal (int amt) public {
        bal = amt;
    }

    function deposit(int amt) public {
        bal = bal + amt;
    }

    function withdraw(int amt) public {
        if (bal >= amt) {
            bal = bal - amt;
        } else {
            revert ("Amount is not enough !!");
        }
    }

    function getBalance() public view returns(int) {
        return bal;
    }

}