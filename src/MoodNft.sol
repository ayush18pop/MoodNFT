// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

contract MoodNft is ERC721 {
    error MoodNft__NotApprovedOrOwner();

    uint256 private s_tokenCounter;
    string private s_sadSvgURI;
    string private s_happySvgURI;

    enum Mood {
        SAD,
        HAPPY
    }

    constructor(
        string memory sadSvg,
        string memory happySvg
    ) ERC721("MoodNFT", "MN") {
        s_tokenCounter = 0;
        s_sadSvgURI = sadSvg;
        s_happySvgURI = happySvg;
    }

    function _baseURI() internal view virtual override returns (string memory) {
        return "data:application/json;base64,";
    }

    function mintNft() public {
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenCounter++;
    }

    mapping(uint256 => Mood) private s_tokenIdToMood;

    function tokenURI(
        uint256 tokenId
    ) public view override returns (string memory) {
        string memory imageURI;
        if (s_tokenIdToMood[tokenId] == Mood.HAPPY) {
            imageURI = s_happySvgURI;
        } else {
            imageURI = s_sadSvgURI;
        }

        string memory tokenMetaData = string(
            abi.encodePacked(
                _baseURI(),
                Base64.encode(
                    bytes(
                        string(
                            abi.encodePacked(
                                '{"name":"',
                                name(),
                                '", "description":"A mood NFT", "attributes": [{"trait_type": "moodiness", "value": "100"}], "image":"',
                                imageURI,
                                '"}'
                            )
                        )
                    )
                )
            )
        );
        return tokenMetaData;
    }

    function flipMood(uint256 tokenId) public {
        if (!_isAuthorized(ownerOf(tokenId), msg.sender, tokenId)) {
            revert MoodNft__NotApprovedOrOwner();
        }
        if (s_tokenIdToMood[tokenId] == Mood.HAPPY) {
            s_tokenIdToMood[tokenId] = Mood.SAD;
        } else {
            s_tokenIdToMood[tokenId] = Mood.HAPPY;
        }
    }
}
