// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

import {Script} from "forge-std/Script.sol";
import {SmartBank} from "../src/SmartBank.sol";

contract DeploySmartBark is Script {
    function run() external returns (SmartBank) {
        vm.startBroadcast();
        SmartBank smartBank = new SmartBank();
        vm.stopBroadcast();
        return smartBank;
    }
}
