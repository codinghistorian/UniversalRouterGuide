// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UniversalRouterWrapper {
    // Removed the universalRouterAddress since it's no longer directly used in the contract

    constructor() {
        // Constructor can be empty if no initialization is required
    }

    function prepareSwapExactInputSingle(
        address recipient,
        uint256 amountIn,
        uint256 amountOutMinimum,
        bytes memory path,
        bool sourceOfFundsIsMsgSender,
        uint256 deadline
    ) public pure returns (bytes memory commands, bytes[] memory inputs, uint256 finalDeadline) {
        // Command for V3_SWAP_EXACT_IN
        bytes1 command = 0x00; // Assuming 0x00 is the command for V3_SWAP_EXACT_IN

        // Encode the inputs for the V3_SWAP_EXACT_IN command
        bytes memory input = abi.encode(recipient, amountIn, amountOutMinimum, path, sourceOfFundsIsMsgSender);

        // Prepare the command and input for the caller to use with `execute` function of UniversalRouter
        commands = abi.encodePacked(command);
        inputs = new bytes[](1);
        inputs[0] = input;

        // Returning the deadline as is, since it's a direct parameter to `execute`
        finalDeadline = deadline;

        // No need for `require` checks or `call` statements since we're only preparing data here
    }

    // Function to receive ETH when `msg.data` is empty
    receive() external payable {}

    // Fallback function to receive ETH
    fallback() external payable {}
}
