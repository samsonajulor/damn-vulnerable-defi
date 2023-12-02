// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import {Utilities} from "./utils/Utilities.sol";
import "forge-std/Test.sol";

import {StringUtil} from "../src/Contracts/challenge.sol";

contract ChallengeTest is Test {
    uint256 internal constant ETHER_FOR_USER = 1_000e18;

    Utilities internal utils;

    address payable internal user;
    address payable internal attacker;

    StringUtil internal stringUtil;

    bytes a;

    string b;

    string c;

    string palindromeString = "A man a plan a canal Panama";
    string palindromeStringRaw = "A man a plan a canal Panama";

    function setUp() public {
        utils = new Utilities();
        address payable[] memory users = utils.createUsers(2);
        user = users[0];
        attacker = users[1];

        vm.label(user, "User");
        vm.label(attacker, "Attacker");

        vm.deal(user, ETHER_FOR_USER);
        vm.deal(attacker, ETHER_FOR_USER);

        stringUtil = new StringUtil();

        palindromeString = stringUtil.toLower(palindromeString);

        console.log(palindromeString, "palindromeString to lowercase");

        c = stringUtil.replaceString(palindromeString, " ", "");

        console.log(unicode"🧨 Getting started... 🧨");
    }

    function testStringChallenge() public {
        vm.startPrank(user);

        // bool isPalindrome = stringUtil.isPalindrome("amanaplanacanalpanama");
        bool isPalindrome = stringUtil.isPalindrome(palindromeStringRaw);

        assertEq(isPalindrome, true);

        console.log(unicode"\n🎉 Congratulations, you can go to the next level! 🎉");
    }
}
