// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Level_0} from "../src/Level_0.sol";

contract Level_0Test is Test {
    Level_0 public level_0;

    function setUp() public {
        level_0 = new Level_0();
    }

    function test_Sol() public view {
        // uint256 res = level_0.solution();
        // assertEq(res, 42);
    }
}
