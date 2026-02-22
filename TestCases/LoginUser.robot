*** Settings ***
Documentation    Login Functionality & Authentification
Resource        ..//Resources/Keywords.robot
Suite Teardown      Close All Browsers

*** Test Cases ***
Registered users should be able to login
    Login User with correct credentials    kingsleyuhons@gmail.com    School5

Logout as user
    Logout User    kings2021uh@gmail.com    School3

Invalid login - incorrect email credential
    Login with incorrect email    ki@gmail.com    School5

#Invalid login - incorrect password credential
    Login with incorrect password    kingsleyuhons@gmail.com    Scha

Invalid login - no email credential
    Login with empty email field    ${EMPTY}    School

Invalid login - no password credential
    Login with empty password field    kingsbhinvest@gmail.com     ${EMPTY}

#Valid error messages for incorrect credentials
    [Template]      Verifying error messages for different invalid login scenarios
    #email                       password                    error messages
    kingsbhinvest@gmail.com      School                      Warning: No match for E-Mail Address and/or Password.
    kig@gmail.com                School5                     Warning: No match for E-Mail Address and/or Password.
    ${EMPTY}                     School5                     Warning: No match for E-Mail Address and/or Password.
    kings2021uh@gmail.com        ${EMAIL}                    Warning: No match for E-Mail Address and/or Password.

Verify that registered users can retrieve forgotten password
    [Setup]     Get to login page
    Retrieve registered user password    ${FORGOT_PASSWORD_LINK}    ${EMAIL}    kingsleyuhons@gmail.com    ${RETRIVE_PASSWORD_BTN}
    Wait Until Page Contains     An email with a confirmation link has been sent your email address.    10s

Verify that non-registered emails cannot be used to retrieve forgotten password
    [Setup]     Get to login page
    Retrieve registered user password    ${FORGOT_PASSWORD_LINK}    ${EMAIL}    kingsleyuhs@gmail.com    ${RETRIVE_PASSWORD_BTN}
    Wait Until Page Contains      Warning: The E-Mail Address was not found in our records, please try again!    10s