// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Level_1} from "../src/Level_1.sol";

contract Level_1Test is Test {
    Level_1 public level_1;

    function setUp() public {
        level_1 = new Level_1();
    }

    function test_Solution() public view {
        uint256[2][3] memory x = [
            [uint256(1), uint256(2)],
            [uint256(3), uint256(4)],
            [uint256(5), uint256(6)]
        ];
        uint256[2][3] memory y = [
            [uint256(7), uint256(8)],
            [uint256(9), uint256(10)],
            [uint256(11), uint256(12)]
        ];

        uint256[2][3] memory result = level_1.solution(x, y);

        assertEq(result[0][0], x[0][0] + y[0][0]);
        assertEq(result[0][1], x[0][1] + y[0][1]);
        assertEq(result[1][0], x[1][0] + y[1][0]);
        assertEq(result[1][1], x[1][1] + y[1][1]);
        assertEq(result[2][0], x[2][0] + y[2][0]);
        assertEq(result[2][1], x[2][1] + y[2][1]);
    }

    // FAILING: on arithmetic underflow or overflow
    function testFuzz_Solution(∆
        uint256[2][3] calldata x,
        uint256[2][3] calldata y
    ) public view {
        uint256[2][3] memory computedSum;

        computedSum[0][0] = x[0][0] + y[0][0];
        computedSum[0][1] = x[0][1] + y[0][1];

        computedSum[1][0] = x[1][0] + y[1][0];
        computedSum[1][1] = x[1][1] + y[1][1];

        computedSum[2][0] = x[2][0] + y[2][0];
        computedSum[2][1] = x[2][1] + y[2][1];

        uint256[2][3] memory returnedSum = level_1.solution(x, y);

        assertEq(returnedSum[0][0], computedSum[0][0]);
        assertEq(returnedSum[0][1], computedSum[0][1]);

        assertEq(returnedSum[1][0], computedSum[1][0]);
        assertEq(returnedSum[1][1], computedSum[1][1]);

        assertEq(returnedSum[2][0], computedSum[2][0]);
        assertEq(returnedSum[2][1], computedSum[2][1]);
    }

}
