// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Queue.sol";

contract QueueTest is Test {
    Queue public queue;
    address deployer;
    address user1 = address(0x123);
    address user2 = address(0x456);

    function setUp() public {
        queue = new Queue();
        deployer = queue.contractDeployer(); // get deployer address
    }

    function testIssueTicket() public {
        vm.prank(user1);
        queue.issueTicket();
        vm.prank(user1);
        assertEq(
            queue.getMyTicketNumber(),
            1,
            "Incorrect ticket number for user1"
        );
        assertEq(
            queue.getCurrentTicketNumber(),
            1,
            "Incorrect current ticket number"
        );
    }

    function testIssueTicketMultiple() public {
        vm.prank(user1);
        queue.issueTicket();
        vm.prank(user2);
        queue.issueTicket();

        vm.prank(user1);
        assertEq(
            queue.getMyTicketNumber(),
            1,
            "Incorrect ticket number for user1"
        );
        assertEq(
            queue.getCurrentTicketNumber(),
            2,
            "Incorrect current ticket number"
        );
    }

    function testIssueTicketSameUser() public {
        vm.prank(user1);
        queue.issueTicket();
        vm.prank(user1);
        vm.expectRevert("Address already holds an unserved ticket.");
        queue.issueTicket();
    }

    function testServeTicket() public {
        vm.prank(user1);
        queue.issueTicket();
        vm.prank(deployer);
        queue.serveTicket();
        assertEq(
            queue.getLastServedTicketNumber(),
            1,
            "Incorrect last served ticket number"
        );
    }

    function testServeTicketNotDeployer() public {
        vm.prank(user1);
        queue.issueTicket();
        vm.prank(user2);
        vm.expectRevert("Only the contract deployer can serve tickets.");
        queue.serveTicket();
    }

    function testServeTicketNoTickets() public {
        vm.prank(deployer);
        vm.expectRevert("No tickets to serve.");
        queue.serveTicket();
    }

    function testGetMyTicketNumberNoTicketIssued() public {
        vm.prank(user1);
        vm.expectRevert("No ticket issued to this address.");
        queue.getMyTicketNumber();
    }

    function testGetCurrentTicketNumberAndLastServedTicketNumber() public {
        vm.prank(user1);
        queue.issueTicket();
        vm.prank(user2);
        queue.issueTicket();
        vm.prank(deployer);
        assertEq(
            queue.getCurrentTicketNumber(),
            2,
            "Incorrect current ticket number"
        );
        queue.serveTicket();
        assertEq(
            queue.getLastServedTicketNumber(),
            1,
            "Incorrect last served ticket number"
        );
        vm.prank(deployer);
        assertEq(
            queue.getCurrentTicketNumber(),
            2,
            "Incorrect current ticket number after serving"
        );
    }
}
