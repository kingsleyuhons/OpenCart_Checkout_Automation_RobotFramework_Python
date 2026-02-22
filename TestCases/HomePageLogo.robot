*** Settings ***
Documentation    Home page functionality
Resource        ..//Resources/Keywords.robot
Library     SeleniumLibrary
Suite Teardown      Close All Browsers

*** Test Cases ***
Verify the visibility of the homepage logo
    Check homepage logo