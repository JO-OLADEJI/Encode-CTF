// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Level_2 {
    function solution(
        uint256[10] calldata
    ) public pure returns (uint256[10] memory) {
        unchecked {
            assembly {
                // load array values to memory from calldata
                mstore(0x0080, calldataload(0x0004))
                mstore(0x00a0, calldataload(0x0024))
                mstore(0x00c0, calldataload(0x0044))
                mstore(0x00e0, calldataload(0x0064))
                mstore(0x0100, calldataload(0x0084))
                mstore(0x0120, calldataload(0x00a4))
                mstore(0x0140, calldataload(0x00c4))
                mstore(0x0160, calldataload(0x00e4))
                mstore(0x0180, calldataload(0x0104))
                mstore(0x01a0, calldataload(0x0124))

                for { let i := 1 } lt(i, 10) { i := add(i, 1) }
                {
                    // i - pointer
                    mstore(
                        0x00,
                        add(0x80, mul(i, 0x20))
                    )

                    for { let j := i } gt(j, 0) { j := sub(j, 1) }
                    {
                        // j - pointer
                        mstore(
                            0x20,
                            add(0x80, mul(sub(j, 1), 0x20))
                        )

                        if lt(mload(mload(0x20)), mload(mload(0x00))) {
                            break
                        } {
                            // copy `i` into a temp storage
                            // mstore(mload(0x40), mload(mload(0x00)))
                            mstore(0x60, mload(mload(0x00)))

                            // replace `i` with `j`
                            mstore(mload(0x00), mload(mload(0x20)))

                            // replace `j` with `i`
                            mstore(mload(0x20), mload(0x60))

                            // i - pointer [memory update]
                            mstore(
                                0x00,
                                sub(mload(0x00), 0x20)
                            )
                        }
                    }
                }

                return(0x80, 0x0140)
            }
        }
    }

}
