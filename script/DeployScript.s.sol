//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "forge-std/Script.sol";
import "../src/BasicNFT.sol";

contract DeployScript is Script {
    function run() external returns (BasicNFT) {
        vm.startBroadcast();
        BasicNFT nft = new BasicNFT();
        vm.stopBroadcast();
        return nft;
    }
}
