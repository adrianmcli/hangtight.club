// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Queue {
    uint256 private currentTicketNumber = 0;
    uint256 private lastServedTicketNumber = 0;
    address public contractDeployer;

    mapping(address => uint256) private ticketMapping;
    address[] private ticketHolders;

    event TicketIssued(address _from, uint256 _ticketNumber);
    event TicketServed(uint256 _ticketNumber, address _participant);

    constructor() {
        contractDeployer = msg.sender; // Store the address of the contract deployer
    }

    function issueTicket() public {
        require(
            ticketMapping[msg.sender] == 0 ||
                ticketMapping[msg.sender] <= lastServedTicketNumber,
            "Address already holds an unserved ticket."
        );
        currentTicketNumber++;
        ticketMapping[msg.sender] = currentTicketNumber;
        ticketHolders.push(msg.sender); // Added line: store address in the ticketHolders array

        emit TicketIssued(msg.sender, currentTicketNumber);
    }

    function serveTicket() public {
        require(
            msg.sender == contractDeployer,
            "Only the contract deployer can serve tickets."
        ); // Only allow the contract deployer to serve tickets

        require(
            currentTicketNumber > lastServedTicketNumber,
            "No tickets to serve."
        );

        lastServedTicketNumber++;

        emit TicketServed(
            lastServedTicketNumber,
            getTicketHolder(lastServedTicketNumber)
        );
    }

    function getMyTicketNumber() public view returns (uint256) {
        require(
            ticketMapping[msg.sender] > 0,
            "No ticket issued to this address."
        );

        return ticketMapping[msg.sender];
    }

    function getCurrentTicketNumber() public view returns (uint256) {
        return currentTicketNumber;
    }

    function getLastServedTicketNumber() public view returns (uint256) {
        return lastServedTicketNumber;
    }

    // Return the address of the participant who owns the given ticket number
    function getTicketHolder(
        uint256 ticketNumber
    ) internal view returns (address) {
        require(
            ticketNumber > 0 && ticketNumber <= ticketHolders.length,
            "Ticket number is invalid."
        );

        return ticketHolders[ticketNumber - 1];
    }
}
