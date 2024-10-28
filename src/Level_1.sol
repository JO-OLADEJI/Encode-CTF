// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Level_1 {

    function solution(
        uint256[2][3] calldata,
        uint256[2][3] calldata
    ) external pure returns (uint256[2][3] memory) {
        unchecked {
            assembly {

                // SCALABLE SOLUTION
                // let cdIndex := 0x04
                // let mIndex := mload(0x80)

                // for {let i := 0} lt(i, 6) { i := add(i, 1) } {
                //     mstore(
                //         add(mIndex, mul(0x20, i)),
                //         add(
                //             calldataload(add(cdIndex, mul(0x20, i))),
                //             calldataload(add(add(cdIndex, mul(0x20, i)), 0xc0))
                //         )
                //     )
                // }
                // return(mload(0x80), 0xc0)

                // MOST GAS EFFICIENT SOLUTION
                mstore(0x00e0, add(calldataload(0x04), calldataload(0x00c4)))
                mstore(0x0100, add(calldataload(0x24), calldataload(0x00e4)))
                mstore(0x0120, add(calldataload(0x44), calldataload(0x0104)))
                mstore(0x0140, add(calldataload(0x64), calldataload(0x0124)))
                mstore(0x0160, add(calldataload(0x84), calldataload(0x0144)))
                mstore(0x0180, add(calldataload(0xa4), calldataload(0x0164)))

                return(0xe0, 0xc0)
            }
        }
    }

}
