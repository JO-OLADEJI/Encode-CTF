// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import { Test } from "forge-std/Test.sol";
import { Level_2 } from "../src/Level_2.sol";

contract Level_2Test is Test {
    Level_2 public level_2;

    function setUp() public {
        level_2 = new Level_2();
    }

    function test_Solution() public view {
        uint256[10] memory buffer = [
            uint256(12), // 4 - index 0
            uint256(9),  // 2 - index 1
            uint256(33), // 6 - index 2
            uint256(64), // 8 - index 3
            uint256(22), // 5 - index 4
            uint256(7),  // 0 - index 5
            uint256(8),  // 1 - index 6
            uint256(10), // 3 - index 7
            uint256(99), // 9 - index 8
            uint256(41)  // 7 - index 9
        ];

        uint256[10] memory result = level_2.solution(buffer);
        assertEq(result[0], buffer[5]);
        assertEq(result[1], buffer[6]);
        assertEq(result[2], buffer[1]);
        assertEq(result[3], buffer[7]);
        assertEq(result[4], buffer[0]);
        assertEq(result[5], buffer[4]);
        assertEq(result[6], buffer[2]);
        assertEq(result[7], buffer[9]);
        assertEq(result[8], buffer[3]);
        assertEq(result[9], buffer[8]);
    }
}
