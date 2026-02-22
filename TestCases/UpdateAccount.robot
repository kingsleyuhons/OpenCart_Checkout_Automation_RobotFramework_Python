*** Settings ***
Documentation    Account update/Profile management functionality
Resource    ..//Resources/Keywords.robot
Library     SeleniumLibrary
Suite Teardown      Close All Browsers

*** Test Cases ***
Verify updating user profile details
    Update user account information
    Update password
Verify user address management (add/edit/delete)
    Add user address
    Edit user addressbook
    Delete user addressbook