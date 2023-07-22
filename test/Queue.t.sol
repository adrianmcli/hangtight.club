// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Queue.sol";

contract QueueTest is Test {
    Queue public queue;

    function setUp() public {
        queue = new Queue();
    }

    function testIssueTicket() public {
        queue.issueTicket();
        assertEq(queue.getCurrentTicketNumber(), 1);
        assertEq(queue.getMyTicketNumber(), 1);
    }

    function testServeTicket() public {
        queue.issueTicket();
        queue.serveTicket();
        assertEq(queue.getLastServedTicketNumber(), 1);
    }

    function testServeTicketNoTickets() public {
        vm.expectRevert("No tickets to serve");
        queue.serveTicket();
    }

    function testGetMyTicketNumberNoTicketIssued() public {
        vm.expectRevert("No ticket issued to this address");
        queue.getMyTicketNumber();
    }

    function testGetCurrentTicketNumberAndLastServedTicketNumber() public {
        queue.issueTicket();
        queue.issueTicket();
        assertEq(queue.getCurrentTicketNumber(), 2);
        queue.serveTicket();
        assertEq(queue.getLastServedTicketNumber(), 1);
        assertEq(queue.getCurrentTicketNumber(), 2);
    }
}
