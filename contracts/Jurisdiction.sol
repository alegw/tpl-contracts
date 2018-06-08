pragma solidity ^0.4.19;

import "openzeppelin-solidity/contracts/ownership/Ownable.sol";
import "./Registry.sol";

contract Jurisdiction is Ownable, Registry {

  mapping(address => mapping(string => uint256)) attributes;

  mapping(address => mapping(string => bool)) validators;

  modifier onlyValidatorFor(string attribute) {
    require(isValidatorFor(msg.sender, attribute));
    _;
  }

  function addValidatorFor(address validator, string attribute) public onlyOwner {
    validators[validator][attribute] = true;
  }

  function removeValidatorFor(address validator, string attribute) public onlyOwner {
    validators[validator][attribute] = false;
  }

  function isValidatorFor(address who, string attribute) public view returns (bool) {
    return validators[who][attribute];
  }

  function addAttribute(address who, string attribute, uint256 value) public onlyValidatorFor(attribute) {
    attributes[who][attribute] = value;
  }

  function hasAttribute(address who, string attribute) public view returns (bool)  {
    return attributes[who][attribute] != 0;
  }

  function getAttribute(address who, string attribute) public view returns (uint256) {
    return attributes[who][attribute];
  }
}