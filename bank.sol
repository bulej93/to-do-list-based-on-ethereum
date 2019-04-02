pragma solidity >=0.4.22 < 0.6.0;

contract bank {

    //put addresses in a mapping
    mapping (address => uint) private balances;
    address public owner;

    event LogDepositMade(address indexed accountAddress, uint amount);


    //withdraw function
    function deposit() public payable returns (uint) {
        //gets the amount deposited and adds it to the balance
        balances[msg.sender] += msg.value;
        emit LogDepositMade(msg.sender, msg.value);
        return balances[msg.sender];
    }

    function withdraw(uint withdrawAmount) public returns (uint remainingBal) {
        // Check enough balance available, otherwise just return balance
        if (withdrawAmount <= balances[msg.sender]) {
            balances[msg.sender] -= withdrawAmount;
            msg.sender.transfer(withdrawAmount);
        }
        return balances[msg.sender];
    }

    function balance() public view returns (uint) {
        return balances[msg.sender];
    }

    function depositsBalance() public view returns (uint) {
        return address(this).balance;
    }


}
