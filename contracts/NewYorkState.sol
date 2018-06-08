pragma solidity ^0.4.19;

import "./Jurisdiction.sol";

contract NewYorkState is Jurisdiction {
  
  /* Attributes that New York State cares about */
  string holdsStateID = "holdsStateID";
  string canDrive = "canDrive";
  string isTaxResident = "isTaxResident";

  /* The DMV is made a validator for the holdsStateID and canDrive attributes */
  function validateStateID(address who) public onlyValidatorFor(holdsStateID) {
      addAttribute(who, holdsStateID, 1);
  }

  function validateDriversLicense(address who) public onlyValidatorFor(canDrive) {
      addAttribute(who, canDrive, 1);
  }

  /* The NY State Department of Taxation and Finance is made a validator for the isTaxResident attribute */
  function registerTaxResident(address who) public onlyValidatorFor(isTaxResident) {
      addAttribute(who, isTaxResident, 1);
  }
}