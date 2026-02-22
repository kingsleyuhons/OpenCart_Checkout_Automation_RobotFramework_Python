*** Settings ***
Documentation    Registration Page Functionality
Resource   ..//Resources/Keywords.robot
Suite Teardown      Close All Browsers

*** Test Cases ***
Verify new user can create account with valid data
    Register New User
Verify error messages for invalid email, missing required fields, or invalid data
    Register New User without inputting email address (missing email address)
    Register New User with wrong email format (incomplete email address)
    Register New User without inputting phone number
    Register New User with incorrect phone number (less than minimum digits required)
    Register New User with incorrect phone number (more than maximum digits required)