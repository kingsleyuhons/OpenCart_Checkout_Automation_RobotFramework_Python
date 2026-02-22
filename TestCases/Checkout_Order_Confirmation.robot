*** Settings ***
Documentation      Checkout Functionality
Resource    ../Resources/Keywords.robot
Suite Teardown      Close All Browsers

*** Test Cases ***
Verify Users are able to checkout selected product - Checkout/Order confirmation Workflow via API
    User should be able to checkout and pay for products
