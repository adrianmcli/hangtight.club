// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Queue {

    uint public currentTicketNumber = 0;
    uint public lastServedTicketNumber = 0;

    mapping (address => uint) public ticketMapping;

    event TicketIssued(address indexed _from, uint _ticketNumber);
    event TicketServed(uint _ticketNumber);

    function issueTicket() public {
        currentTicketNumber++;
        ticketMapping[msg.sender] = currentTicketNumber;
        emit TicketIssued(msg.sender, currentTicketNumber);
    }

    function serveTicket() public {
        require(lastServedTicketNumber < currentTicketNumber, "No tickets to serve");
        lastServedTicketNumber++;
        emit TicketServed(lastServedTicketNumber);
    }

    function getMyTicketNumber() public view returns(uint) {
        require(ticketMapping[msg.sender] != 0, "No ticket issued to this address");
        return ticketMapping[msg.sender];
    }

    function getCurrentTicketNumber() public view returns(uint) {
        return currentTicketNumber;
    }

    function getLastServedTicketNumber() public view returns(uint) {
        return lastServedTicketNumber;
    }
}
