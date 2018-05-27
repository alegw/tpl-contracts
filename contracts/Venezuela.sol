pragma solidity ^0.4.19;

import "./Jurisdiction.sol";

contract Venezuela is Jurisdiction {

  function validateNationalID(address who) public onlyValidator {
      addAttribute(who, "IsANaturalPerson", 1);
      addAttribute(who, "HoldsANationalID", 1);
  }

  function validateVoteRegistry(address who) public onlyValidator {
      addAttribute(who, "IsRegisteredToVote", 1);
  }

  function holdsANationalID(address who) public view returns (bool) {
      return hasAttribute(who, "HoldsANationalID");
  }

  function isRegisteredToVote(address who) public view returns (bool) {
      return hasAttribute(who, "IsRegisteredToVote");
  }

}
