*** Settings ***
Documentation       Guest Checkout
Resource    Keywords.robot
Library     SeleniumLibrary

#User should be able to navigate to checkout page and proceed to pay for product
#    [Setup]   Users should be able to add product to cart
#    Wait and Click Element    ${CART_ITEMS}
#    Wait and Click Element    ${VIEW_CART}
#    Wait Until Element Is Enabled    ${CHECKOUT_ITEMS2}
#    Wait and Click Element    ${CHECKOUT_ITEMS2}
    #Creating guest account, completing guest billing details, and checking out as guest
#    Wait Until Element Is Enabled    ${GUEST_CHECKOUT_SELECT}    10s
#    Wait and Click Element    ${GUEST_CHECKOUT_SELECT}
#    Sleep    2s
#    Wait and Click Element    ${GUEST_CHECKOUT_CONTINUE}
#    Wait Until Element Is Enabled    ${BILLING_DETAILS}
#    Wait and Input Text    ${GUEST_FIRSTNAME}      Uhonmhoi
#    Wait and Input Text    ${GUEST_LASTNAME}      Kingsl
#    ${RANDOM}=  Generate Random String    6    [NUMBERS]
#    ${EMAIL}=     Set Variable    uhon${RANDOM}@test.com
#
#    Wait and Input Text    ${GUEST_EMAIL}      ${EMAIL}
#    Wait and Input Text    ${GUEST_TELEPHONE}    45663778
#    Wait and Input Text    ${GUEST_COMPANY_NAME}    Cash and Carry
#    Wait and Input Text    ${GUEST_ADDRESS}    22 Idemudia Str
#    Wait and Input Text    ${GUEST_CITY}    Los Angeles
#    Wait and Input Text    ${GUEST_POSTCODE}    90001
#    Select From List By Label    ${GUEST_COUNTRY}      United States
#    Wait Until Element Is Enabled     ${GUEST_REGION_STATE}     10s
#    Sleep    2s
#    #Wait Until Keyword Succeeds    15s    1s    Wait Until Zone Loaded
#    Select From List By Label    ${GUEST_REGION_STATE}    California
#    Sleep    2s
##    Execute Javascript
##    ...    $('#collapse-payment-address input, #collapse-payment-address select').each(function(){
##    ...        $(this).trigger('change');
##    ...        $(this).trigger('blur');
##    ...        $(this).trigger('keyup');
##    ...    });
#    ${resp}=    Execute Javascript
#    ...    return $.ajax({
#    ...        url: 'index.php?route=checkout/guest/save',
#    ...        type: 'post',
#    ...        data: $('#collapse-payment-address input, #collapse-payment-address select'),
#    ...        async: false
#    ...    }).responseText;
#
#    Log    ${resp}
#    Should Not Contain    ${resp}    error
#
#
#    Click Button    ${GUEST_PROCEED_BTN1}
#
#    Wait Until Page Contains Element    id=shipping_address    20s



#    Click Button    ${GUEST_PROCEED_BTN1}
#    Wait Until Page Contains Element    id=shipping_address    15s
#    Wait Until Page Contains    Flat Shipping Rate     10s
#    Wait and Input Text    ${LOGIN_EMAIL}      ${my_login_email}
#    Wait and Input Text    ${LOGIN_PASSWORD}    ${my_login_password}
#    Wait and Click Element    ${LOGIN_BTN}
#    Sleep    5s
#    Wait and Click Element    ${CONTINUE_CHECKOUT_BTN1}
#    Sleep    5s
#    Wait and Click Element    ${CONTINUE_CHECKOUT_BTN2}
#    Sleep    5s
#    Wait and Click Element    ${CONTINUE_CHECKOUT_BTN3}
#    Sleep    5s
#    Wait and Click Element    ${AGREE_TERMS}
#    Wait and Click Element    ${CONTINUE_CHECKOUT_BTN4}
#    Sleep    5s
#    Capture Page Screenshot
#    Sleep    2s
#    Wait and Click Element    ${CONFIRM_ORDER_BTN}
#    Page Should Contain    Your order has been placed!