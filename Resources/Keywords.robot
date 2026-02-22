*** Settings ***
Documentation    Project Keywords
Resource    Variables.robot
Resource    API_Upload_Backend.robot
Library     SeleniumLibrary
Library     RequestsLibrary
Library     Collections
Library     FakerLibrary
Library     String
Library     date_helper.py
Library     apple_date_helper.py
Library     time_helper.py
Library     datetime_helper.py
Library     file_helper.py


*** Keywords ***
Check homepage logo
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    ${APP_LOGO}    10S
    Capture Page Screenshot

# Registration keywords
Register New User
    Open Browser   ${URL}   ${BROWSER}
    Maximize Browser Window
    Click Element    ${ACCOUNT_BTN}
    Wait and Click Element    ${REGISTER_LINK}
    Input fake firstname
    Wait and Input Text    ${LAST_NAME}      Uhons
    Input fake email
    Wait and Input Text    ${TELEPHONE}    4566377378
    Wait and Input Text    ${PASSWORD}    School5
    Wait and Input Text    ${CONFIRM_PASSWORD}    School5
    Wait and Click Element    ${NEWSLETTER_SUBSCRIBE}
    Wait and Click Element    ${AGREE_POLICY}   
    Wait and Click Element    ${SUBMIT_BTN}
    Page Should Contain    Your Account Has Been Created!


Register New User without inputting email address (missing email address)
    Open Browser   ${URL}   ${BROWSER}
    Maximize Browser Window
    Click Element    ${ACCOUNT_BTN}
    Wait and Click Element    ${REGISTER_LINK}
    Input fake firstname
    Wait and Input Text    ${LAST_NAME}      Uhons
    Wait and Input Text    ${TELEPHONE}    4566377378
    Wait and Input Text    ${EMAIL}     kingsleyuhos@gmail
    Wait and Input Text    ${PASSWORD}    School5
    Wait and Input Text    ${CONFIRM_PASSWORD}    School5
    Wait and Click Element    ${NEWSLETTER_SUBSCRIBE}
    Wait and Click Element    ${AGREE_POLICY}
    Wait and Click Element    ${SUBMIT_BTN}
    Page Should Contain   E-Mail Address does not appear to be valid!
    
Register New User with wrong email format (incomplete email address)
    Open Browser   ${URL}   ${BROWSER}
    Maximize Browser Window
    Click Element    ${ACCOUNT_BTN}
    Wait and Click Element    ${REGISTER_LINK}
    Input fake firstname
    Wait and Input Text    ${LAST_NAME}      Uhons
    Wait and Input Text    ${TELEPHONE}    4566377378
    Wait and Input Text    ${PASSWORD}    School5
    Wait and Input Text    ${CONFIRM_PASSWORD}    School5
    Wait and Click Element    ${NEWSLETTER_SUBSCRIBE}
    Wait and Click Element    ${AGREE_POLICY}
    Wait and Click Element    ${SUBMIT_BTN}
    Page Should Contain   E-Mail Address does not appear to be valid!

Register New User without inputting phone number
    Open Browser   ${URL}   ${BROWSER}
    Maximize Browser Window
    Click Element    ${ACCOUNT_BTN}
    Wait and Click Element    ${REGISTER_LINK}
    Input fake firstname
    Wait and Input Text    ${LAST_NAME}      Uhons
    Input fake email
    Wait and Input Text    ${TELEPHONE}    ${EMPTY}
    Wait and Input Text    ${PASSWORD}    School5
    Wait and Input Text    ${CONFIRM_PASSWORD}    School5
    Wait and Click Element    ${NEWSLETTER_SUBSCRIBE}
    Wait and Click Element    ${AGREE_POLICY}   
    Wait and Click Element    ${SUBMIT_BTN}
    Page Should Contain    Telephone must be between 3 and 32 characters!
    
Register New User with incorrect phone number (less than minimum digits required)
    Open Browser   ${URL}   ${BROWSER}
    Maximize Browser Window
    Click Element    ${ACCOUNT_BTN}
    Wait and Click Element    ${REGISTER_LINK}
    Input fake firstname
    Wait and Input Text    ${LAST_NAME}      Uhons
    Input fake email
    Wait and Input Text    ${TELEPHONE}    45
    Wait and Input Text    ${PASSWORD}    School5
    Wait and Input Text    ${CONFIRM_PASSWORD}    School5
    Wait and Click Element    ${NEWSLETTER_SUBSCRIBE}
    Wait and Click Element    ${AGREE_POLICY}   
    Wait and Click Element    ${SUBMIT_BTN}
    Page Should Contain    Telephone must be between 3 and 32 characters!

Register New User with incorrect phone number (more than maximum digits required)
    Open Browser   ${URL}   ${BROWSER}
    Maximize Browser Window
    Click Element    ${ACCOUNT_BTN}
    Wait and Click Element    ${REGISTER_LINK}
    Input fake firstname
    Wait and Input Text    ${LAST_NAME}      Uhons
    Input fake email
    Wait and Input Text    ${TELEPHONE}    454444444444444444444444444444444444444444444
    Wait and Input Text    ${PASSWORD}    School5
    Wait and Input Text    ${CONFIRM_PASSWORD}    School5
    Wait and Click Element    ${NEWSLETTER_SUBSCRIBE}
    Wait and Click Element    ${AGREE_POLICY}
    Wait and Click Element    ${SUBMIT_BTN}
    Page Should Contain    Telephone must be between 3 and 32 characters!

#Login/Logout keywords
Login User with correct credentials
    [Arguments]    ${email}      ${password}
    [Setup]     Get to login page
    Wait and Input Text    ${LOGIN_EMAIL}    ${email}
    Wait and Input Text    ${LOGIN_PASSWORD}     ${password}
    Wait and Click Element    ${ACCOUNT_LOGIN_BTN}
    Page Should Contain    My Account

Logout User
    [Arguments]    ${email}      ${password}
    [Setup]     Get to login page
    Wait and Input Text    ${LOGIN_EMAIL}    ${email}
    Wait and Input Text    ${LOGIN_PASSWORD}     ${password}
    Wait and Click Element    ${ACCOUNT_LOGIN_BTN}
    Wait and Click Element  ${LOGOUT_USER}
    Page Should Contain     Account Logout

Login with incorrect email
    [Arguments]    ${email}      ${password}
    [Setup]  Get to login page
    Wait and Input Text    ${LOGIN_EMAIL}     ${email}
    Wait and Input Text    ${LOGIN_PASSWORD}     ${password}
    Wait and Click Element    ${ACCOUNT_LOGIN_BTN}
    Page Should Contain     ${AUTH_ERROR_INVALID_LOGIN}

Login with incorrect password
    [Arguments]    ${email}      ${password}
    [Setup]  Get to login page
    Wait and Input Text    ${LOGIN_EMAIL}     ${email}
    Wait and Input Text    ${LOGIN_PASSWORD}     ${password}
    Wait and Click Element    ${ACCOUNT_LOGIN_BTN}
    Page Should Contain     ${AUTH_ERROR_INVALID_LOGIN}

Login with empty email field
    [Arguments]   ${email}   ${password}
    [Setup]   Get to login page
    Wait and Input Text    ${LOGIN_EMAIL}    ${EMPTY}
    Wait and Input Text    ${LOGIN_PASSWORD}    ${password}
    Wait and Click Element    ${ACCOUNT_LOGIN_BTN}
    Page Should Contain         ${AUTH_ERROR_INVALID_LOGIN}

Login with empty password field
    [Arguments]   ${email}   ${password}
    Open Browser    ${URL}      ${BROWSER2}
    Maximize Browser Window
    Wait and Click Element    ${ACCOUNT_BTN}
    Wait and Click Element    ${LOGIN_LINK}
    Wait and Input Text    ${LOGIN_EMAIL}    ${email}
    Wait and Input Text    ${LOGIN_PASSWORD}    ${EMPTY}
    Wait and Click Element    ${ACCOUNT_LOGIN_BTN}
    Page Should Contain         ${AUTH_ERROR_INVALID_LOGIN}

Verifying error messages for different invalid login scenarios
    [Arguments]   ${email}      ${password}     ${errormessage}
    Open Browser    ${URL}      ${BROWSER}
    Maximize Browser Window
    Wait and Click Element    ${ACCOUNT_BTN}
    Wait and Click Element    ${LOGIN_LINK}
    Wait and Input Text    ${LOGIN_EMAIL}     ${email}
    Wait and Input Text    ${LOGIN_PASSWORD}    ${password}
    Wait and Click Element    ${ACCOUNT_LOGIN_BTN}
    Page Should Contain     ${errormessage}

Retrieve registered user password
    [Arguments]   ${forgotPassword_link}   ${EmailAddress_field}    ${EmailAddress}     ${RetrievePassword_btn}
    [Setup]     Get to login page
    Wait and Click Element    ${forgotPassword_link}
    Wait and Input Text    ${EmailAddress_field}    ${EmailAddress}
    Wait and Click Element    ${RetrievePassword_btn}
    
Input fake email
    ${faker_email}=  FakerLibrary.email
    log     ${faker_email}
    Set Test Variable    ${faker_email}
    Wait and Input Text    ${EMAIL}  ${faker_email}

Input fake firstname
    ${faker_firstname}=  FakerLibrary.Name
    log   ${faker_firstname}
    Set Test Variable    ${faker_firstname}
    Wait and Input Text    ${FIRST_NAME}    ${faker_firstname}

#Main menu links keywords
Check functionality of shop by category feature
    Open Browser    ${URL}      ${BROWSER}
    Maximize Browser Window
    Wait and Click Element    ${SHOP_CATEGORY_MAIN_MENU}
    Page Should Contain    Top categories
    Sleep    10s
    Capture Page Screenshot

# Account update/Profile management keywords
Update user account information
    [Setup]  Login User with correct credentials    kingsleyuhons@gmail.com    School5
    Wait and Click Element    ${UPDATE_ACCOUNT_INFO}
    Wait and Input Text    ${FIRSTNAME_UPDATE}    KINGS
    Wait and Input Text    ${LASTNAME_UPDATE}    UHON
    Wait and Input Text    ${TELEPHONE_UPDATE}    2345678576
    Click Button    ${PROFILE_UPDATE_SUBMIT_BTN}
    Page Should Contain     Success: Your account has been successfully updated.

Update password
    [Setup]  Login User with correct credentials    kings2021uh@gmail.com    School3
    Wait and Click Element    ${UPDATE_PASSWORD_LINK}
    Wait and Input Text    ${UPDATE_PASSWORD_FIELD}    School3
    Wait and Input Text    ${UPDATE_CONFIRM-PASSWORD_FIELD}    School3
    Wait and Click Element    ${UPDATE_PASSWORD_SUBMIT_BTN}
    Page Should Contain     Success: Your password has been successfully updated.

Add user address
    [Setup]  Login User with correct credentials    kingsleyuhons@gmail.com    School5
    Wait and Click Element    ${ADD_USER_ADDRESS_LINK}
    Wait and Click Element    ${NEW_ADDRESS_BTN}
    Wait and Input Text    ${FIRSTNAME_UPDATE}    KINGS
    Wait and Input Text    ${LASTNAME_UPDATE}    EBES
    Wait and Input Text    ${ADDRESSBOOK_COMPANYNAME}    FILTERED
    Wait and Input Text    ${ADDRESSBOOK_ADDRESS}    155 Qqua road
    Wait and Input Text    ${ADDRESSBOOK_CITY}    Durra
    Wait and Input Text    ${ADDRESSBOOK_POSTCODE}    345344
    Select From List By Label    ${ADDRESSBOOK_COUNTRY}  United Kingdom
    Select From List By Label    ${ADDRESSBOOK_REGION}  Cardiff
    Click Button    ${SUBMIT_ADDRESS_BTN}
    Page Should Contain     Your address has been successfully added
    
Edit user addressbook
    [Setup]  Login User with correct credentials    kingsleyuhons@gmail.com    School5
    Wait and Click Element   ${MODIFY_ADDRESSBOOK_LINK}
    Wait and Click Element    ${EDIT_ADDRESSBOOK}
    Wait and Input Text    ${EDIT_ADDRESSBOOK_CITY}    Texas
    Wait and Click Element    ${UPDATE_ADDRESSBOOK_BTN}
    Page Should Contain     Your address has been successfully updated

Delete user addressbook
    [Setup]  Login User with correct credentials    kingsleyuhons@gmail.com    School5
    Wait and Click Element   ${MODIFY_ADDRESSBOOK_LINK}
    Wait and Click Element    ${DELETE_ADDRESSBOOK}
    Handle Alert   timeout=10s
    Page Should Contain      Your address has been successfully deleted


# Product Catalog & Search Keywords
Search should return correct products for valid keywords
    Open Browser   ${URL}      ${BROWSER}
    Maximize Browser Window
    Wait and Input Text    ${SEARCH_FIELD}    mac
    Sleep    2s
    Wait and Click Element    ${SEARCH_BTN}
    Page Should Contain    mac

Invalid search keywords should return no result message
    Open Browser   ${URL}      ${BROWSER}
    Maximize Browser Window
    Wait and Input Text    ${SEARCH_FIELD}    stone
    Sleep    2s
    Wait and Click Element    ${SEARCH_BTN}
    Page Should Contain    There is no product that matches the search criteria.

Sort products after search by name (A-Z)
    Open Browser   ${URL}      ${BROWSER}
    Maximize Browser Window
    Wait and Input Text    ${SEARCH_FIELD}    mac
    Sleep    2s
    Wait and Click Element    ${SEARCH_BTN}
    Select From List By Label    ${SORT_FIELD}      Name (A - Z)
    Scroll Element Into View    ${SCROLL_DOWN}
    Sleep    5s
    Capture Page Screenshot

Sort products after search by name (Z-A)
    Open Browser   ${URL}      ${BROWSER}
    Maximize Browser Window
    Wait and Input Text    ${SEARCH_FIELD}    mac
    Sleep    2s
    Wait and Click Element    ${SEARCH_BTN}
    Select From List By Label    ${SORT_FIELD}      Name (Z - A)
    Scroll Element Into View    ${SCROLL_DOWN}
    Sleep    5s
    Capture Page Screenshot

Sort products after search by Price (Low > High)
    Open Browser   ${URL}      ${BROWSER}
    Maximize Browser Window
    Wait and Input Text    ${SEARCH_FIELD}    mac
    Sleep    2s
    Wait and Click Element    ${SEARCH_BTN}
    Select From List By Label    ${SORT_FIELD}      Price (Low > High)
    Scroll Element Into View    ${SCROLL_DOWN}
    Sleep    5s
    Capture Page Screenshot

Sort products after search by Price (High > Low)
    Open Browser   ${URL}      ${BROWSER}
    Maximize Browser Window
    Wait and Input Text    ${SEARCH_FIELD}    mac
    Sleep    2s
    Wait and Click Element    ${SEARCH_BTN}
    Select From List By Label    ${SORT_FIELD}      Price (High > Low)
    Scroll Element Into View    ${SCROLL_DOWN}
    Sleep    5s
    Capture Page Screenshot

Sort products after search by Rating (Highest)
    Open Browser   ${URL}      ${BROWSER}
    Maximize Browser Window
    Wait and Input Text    ${SEARCH_FIELD}    mac
    Sleep    2s
    Wait and Click Element    ${SEARCH_BTN}
    Select From List By Label    ${SORT_FIELD}      Rating (Highest)
    Scroll Element Into View    ${SCROLL_DOWN}
    Sleep    5s
    Capture Page Screenshot

Sort products after search by Rating (Lowest)
    Open Browser   ${URL}      ${BROWSER}
    Maximize Browser Window
    Wait and Input Text    ${SEARCH_FIELD}    mac
    Sleep    2s
    Wait and Click Element    ${SEARCH_BTN}
    Select From List By Label    ${SORT_FIELD}      Rating (Lowest)
    Scroll Element Into View    ${SCROLL_DOWN}
    Sleep    5s
    Capture Page Screenshot

Sort products after search by Model (A - Z)
    Open Browser   ${URL}      ${BROWSER}
    Maximize Browser Window
    Wait and Input Text    ${SEARCH_FIELD}    mac
    Sleep    2s
    Wait and Click Element    ${SEARCH_BTN}
    Select From List By Label    ${SORT_FIELD}    Model (A - Z)
    Scroll Element Into View    ${SCROLL_DOWN}
    Sleep    5s
    Capture Page Screenshot

Sort products after search by Model (Z - A)
    Open Browser   ${URL}      ${BROWSER}
    Maximize Browser Window
    Wait and Input Text    ${SEARCH_FIELD}    mac
    Sleep    2s
    Wait and Click Element    ${SEARCH_BTN}
    Select From List By Label    ${SORT_FIELD}    Model (Z - A)
    Scroll Element Into View    ${SCROLL_DOWN}
    Sleep    5s
    Capture Page Screenshot

Users should be able to search for product and preview
    Open Browser   ${URL}      ${BROWSER}
    Maximize Browser Window
    Wait and Input Text    ${SEARCH_FIELD}    mac
    Sleep    2s
    Wait and Click Element    ${SEARCH_BTN}
    Wait and Click Element    ${MACBOOK}
    Wait and Click Element    ${MACBOOK_PREVIEW}
    FOR    ${i}    IN RANGE    4
        Wait Until Element Is Enabled    ${MACBOOK_NEXT}
        Click Element    ${MACBOOK_NEXT}
        #Log   Clicked next ${i+1} times
    END
    Sleep    5s
    Capture Page Screenshot
    Wait and Click Element    ${MACBOOK_CLOSE}
    Page Should Contain    MacBook

Users should be able to add product to cart
    Open Browser   ${URL}      ${BROWSER}
    Maximize Browser Window
    Wait and Input Text    ${SEARCH_FIELD}    mac
    Sleep    2s
    Wait and Click Element    ${SEARCH_BTN}
    Wait and Click Element    ${MACBOOK}
    Clear Element Text    ${MACBOOK_QTY}
    Wait and Input Text    ${MACBOOK_QTY}    3
    Wait and Click Element    ${ADD_TO_CART_BTN}
    Sleep    2S
    Page Should Contain    Success: You have added MacBook to your shopping cart!

Users should be able to add product to cart with delivery date
    Open Browser   ${URL}      ${BROWSER}
    Maximize Browser Window
    Wait and Click Element    ${LAPTOPS_NOTEBOOKS_MENU}
    Wait and Click Element    ${ALL_LAPTOPS_NOTEBOOKS}
    Wait and Click Element    ${HP_LP3065}
    Scroll Element Into View   ${SCROLL_TO_ADD_CART}
# Get target date data from Python
    ${date_data}=    Get Target Date
    ${target_month}=    Set Variable    ${date_data['month_year']}
    ${target_day}=      Set Variable    ${date_data['day']}
    ${expected_date}=   Set Variable    ${date_data['expected_value']}
    Wait and Click Element    ${CALENDAR}
    Sleep    2s

   ${current_month}=    Get Text    ${MONTH_YEAR_CALENDAR}
    WHILE    '${target_month}' not in '${current_month}'
    Click Element    ${NEXT_ARROW}
    Sleep    0.2s
    ${current_month}=    Get Text    ${MONTH_YEAR_CALENDAR}
    END

    Wait and Click Element    ${DAY_CALENDAR}
    Clear Element Text    ${HP_LP3065_QUANTITY}
    Wait and Input Text    ${HP_LP3065_QUANTITY}    3
    Wait and Click Element    ${ADD_TO_CART}
    Sleep    2S
    Page Should Contain    Success: You have added HP LP3065 to your shopping cart!

Users should be able to add product to cart with specifications and additional product information
    Open Browser   ${URL}      ${BROWSER}
    Maximize Browser Window
    Wait and Click Element    ${COMPONENTS_MENU}
    Wait and Click Element    ${COMPONENTS_MONITORS}
    Wait and Click Element    ${APPLE_CINEMA}
    Scroll Element Into View   ${RADIO_MEDIUM}
    Wait and Click Element    ${RADIO_MEDIUM}
    Wait and Click Element    ${CHECKBOX3}
    Wait and Input Text    ${ADDITIONAL_TEXT}     Apple black cover
    Select From List By Index    ${SELECT_COLOUR}   2
    Wait and Input Text    ${REF_TEXTAREA}     Waybill to right address
    #Upload file
    Scroll Element Into View    ${SCROLL_TO_ADD_CART2}
    #${file_path}=  Get Upload File Path
    Wait Until Element is Enabled    ${FILE_UPLOAD}
    Execute JavaScript
    ...    document.getElementById('input-option222').value='test_upload.png';

    # Get target date data from Python to select delivery date
    ${date_data}=    Get Apple Target Date
    ${target_month}=    Set Variable    ${date_data['month_year']}
    ${target_day}=      Set Variable    ${date_data['day']}
    ${expected_date}=   Set Variable    ${date_data['expected_value']}
    Wait and Click Element    ${APPLE_CALENDAR}
    Sleep    2s
    ${current_month}=    Get Text    ${MONTH_YEAR_CALENDAR}
    WHILE    '${target_month}' not in '${current_month}'
        Click Element    ${NEXT_ARROW}
        Sleep    0.2s
        ${current_month}=    Get Text    ${MONTH_YEAR_CALENDAR}
    END
    Wait and Click Element    ${APPLE_DAY_CALENDAR}

    #Get time from python file to input delivery time
    ${time_value}=  Get Target Time
    Wait and Input Text    ${APPLE_DELIVERY_TIME_FIELD}    ${time_value}

    #Get datetime data from python file to select delivery date and time
    ${dt}=  Get Target Datetime
    ${target_month2}=    Set Variable     ${dt['month_year']}
    ${target_day2}=    Set Variable     ${dt['day']}
    ${target_hour}=     Set Variable    ${dt['hour']}
    ${target_minute}=   Set Variable    ${dt['minute']}
    Wait and Click Element    ${APPLE_DELIVERY_DATE_TIME}
    Sleep    2s
    Wait Until Element is Enabled    ${APPLE_MONTH_YEAR_CALENDAR}
    ${current_month2}=    Get Text    ${APPLE_MONTH_YEAR_CALENDAR}
    WHILE    '${target_month2}' not in '${current_month2}'
        Click Element    ${APPLE_NEXT_ARROW}
        Sleep    0.2s
        ${current_month2}=    Get Text    ${APPLE_MONTH_YEAR_CALENDAR}
    END
    Wait and Click Element    ${APPLE_DELIVERY_DAY}

    # Selecting delivery hour and minute
    Wait and Click Element    ${APPLE_TIME_PICKER}
    Wait Until Element is Enabled  ${APPLE_DELIVERY_HOUR}
    ${current_hour}=  Get Text  ${APPLE_DELIVERY_HOUR}
    WHILE    '${target_hour}' not in '${current_hour}'
        Wait and Click Element       ${PREV_HOUR_ARROW}
        Sleep   0.5s
        ${current_hour}=  Get Text  ${APPLE_DELIVERY_HOUR}
    END
    Wait Until Element is Enabled   ${APPLE_DELIVERY_MINUTE}
    ${current_minute}=  Get Text  ${APPLE_DELIVERY_MINUTE}
    WHILE    '${target_minute}' not in '${current_minute}'
        Sleep   1s
        Wait and Click Element   ${NEXT_MINUTE_ARROW}
        Sleep  0.5s
        ${current_minute}=  Get Text  ${APPLE_DELIVERY_MINUTE}
    END
    Wait Until Element is Enabled    ${APPLE_DELIVERY_DATE_TIME}
    Click Element   ${APPLE_DELIVERY_DATE_TIME}
    #Scroll Element Into View   ${SCROLL_TO_ADD_CART2}
    Clear Element Text    ${APPLE_QUANTITY}
    Wait and Input Text    ${APPLE_QUANTITY}    2
    Wait Until Element is Enabled    ${APPLE_ADD_TO_CART}
    Click Element    ${APPLE_ADD_TO_CART}
    Sleep   10s
    #Scroll Element Into View   ${SCROLL_APPLE_CINEMA}
    Page Should Contain    Success: You have added Apple Cinema 30" to your shopping cart!

#Checkout keywords
User should be able to checkout and pay for products
    Create Session    shop    ${BASE}       verify=${FALSE}     disable_warnings=1
    ${cart}=    Create Dictionary    product_id=43    quantity=2
    ${resp}=    POST On Session    shop    url=/index.php?route=checkout/cart/add    data=${cart}
    Log    ${resp.text}

    ${login}=  Create Dictionary
    ...  email=kings2021uh@gmail.com
    ...  password=School5
    ${resp}=    POST On Session    shop   url=/index.php?route=checkout/login/save    data=${login}
    Log    ${resp.text}

    POST On Session    shop    url=/index.php?route=checkout/payment_address
    POST On Session    shop    url=/index.php?route=checkout/shipping_address

    ${ship}=    Create Dictionary    shipping_method=flat.flat
    ${resp}=  POST On Session    shop    url=/index.php?route=checkout/shipping_method/save    data=${ship}
    Log    ${resp.text}

    ${pay}=    Create Dictionary    payment_method=cod    agree=1
    POST On Session    shop    url=/index.php?route=checkout/payment_method/save    data=${pay}
    Log    ${resp.text}

    ${resp}=  POST On Session    shop    url=/index.php?route=checkout/confirm
    Log    ${resp.text}





# Waits keywords
Wait and Click Element
    [Arguments]   ${selector}    ${timeouts}=20s
    Wait Until Element Is Enabled    ${selector}    ${timeouts}
    Click Element    ${selector}

Wait and Input Text
    [Arguments]    ${selector}     ${text}      ${timeouts}=20s
    Wait Until Element Is Enabled    ${selector}    ${timeouts}
    Input Text    ${selector}    ${text}

Get to login page
    Open Browser    ${URL}      ${BROWSER}
    Maximize Browser Window
    Wait and Click Element    ${ACCOUNT_BTN}
    Wait and Click Element    ${LOGIN_LINK}

Wait Until Zone Loaded
    ${count}=    Execute Javascript    return document.querySelectorAll('#input-payment-zone option').length;
    Should Be True    ${count} > 5


