//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {UUPSUpgradeable} from "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import {OwnableUpgradeable} from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

//storage is stored in the proxy, NOT the implementation
//constructors add storage to the implementation

//proxy doesnt use constructors, they use initilizers instead

contract BoxV1 is UUPSUpgradeable, Initializable, OwnableUpgradeable {
    uint256 internal number;

    function initialize() public initializer {
        __Ownable_init(); //sets owner to msg.sender - prepended with double underscore as its an initializer function
        __UUPSUpgradeable_init(); 
    }

    function getNumber() external view returns (uint256) {
        return number;
    }

    function version() external pure returns (uint256) {
        return 1;
    }

    function _authorizeUpgrade(address newImplementation) internal override {}
}
