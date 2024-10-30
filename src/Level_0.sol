// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Level_0 {
    function solution() public pure returns (uint8) {
        assembly {
            mstore8(0x00, 0x2a)
            return(0x00, 0x20)
        }
    }
}
