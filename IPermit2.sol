
// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

interface IPermit2 {
    function approve(address token, address spender, uint160 amount, uint48 expiration) external;
}

//0x941acf4e2df51bf43c3c4167631dbefa268bc9d7 Permit2 contract


//0xE1BcB1C502A545EE85A1881B95cDD46D394D2B2E V3 Router / universalRouter