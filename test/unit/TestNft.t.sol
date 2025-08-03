//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {BasicNFT} from "../../src/BasicNFT.sol";
import {DeployScript} from "../../script/DeployScript.s.sol";

contract TestNft is Test {
    BasicNFT private nft;
    address private constant USER = address(1);
    string public constant URI =
        "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

    function setUp() public {
        DeployScript deployScript = new DeployScript();
        nft = deployScript.run();
    }

    function testNftName() public view {
        string memory expectedName = "Catto";
        string memory actualName = nft.name();
        assertEq(
            actualName,
            expectedName,
            "NFT name does not match expected value"
        );
    }

    function testCanMintAndHaveBalance() public {
        vm.prank(USER);
        nft.mintNFT(URI);
        assertEq(
            nft.balanceOf(USER),
            1,
            "User should have a balance of 1 NFT after minting"
        );
    }
}
