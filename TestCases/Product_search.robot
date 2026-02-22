*** Settings ***
Documentation       Accurate product browsing, filtering, and search verification
Resource        ..//Resources/Keywords.robot
Suite Teardown      Close All Browsers

*** Test Cases ***
Verify that user can search for products using the search field
    Search should return correct products for valid keywords
    Invalid search keywords should return no result message
#Verify user can preview or sort products by name, price, rating, and model
    Sort products after search by name (A-Z)
    Sort products after search by name (Z-A)
    Sort products after search by Price (High > Low)
    Sort products after search by Price (Low > High)
    Sort products after search by Rating (Highest)
    Sort products after search by Rating (Lowest)
    Sort products after search by Model (A - Z)
    Sort products after search by Model (Z - A)
