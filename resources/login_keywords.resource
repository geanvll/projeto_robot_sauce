*** Settings ***
Library    SeleniumLibrary
Variables    ../variables/variables.py

*** Keywords ***
I navigate to the login page
    [Arguments]    ${URL}
    Go To    ${URL}

I input correct credentials
    Wait Until Element Is Visible    id=user-name
    Input Text    id=user-name    ${LOGIN_DATA["loginSuccess"]["username"]}
    Input Text    id=password    ${LOGIN_DATA["loginSuccess"]["password"]}

I input wrong credentials
    Wait Until Element Is Visible    id=user-name
    Input Text    id=user-name    ${LOGIN_DATA["loginFail"]["username"]}
    Input Text    id=password    ${LOGIN_DATA["loginFail"]["password"]}

I click in login button
    Click Button    id=login-button

I am able view the home page
    ${urlLocation}    Get Location
    Should Be Equal    ${urlLocation}    https://www.saucedemo.com/inventory.html

I am able to see the expected error message for no credentials
    Wait Until Element Contains    class=error-message-container    ${ERROR_MESSAGES["noCredentials"]}

I am able to see the expected error message for no username
    Wait Until Element Contains    class=error-message-container    ${ERROR_MESSAGES["noUsername"]}

I am able to see the expected error message for no password
    Wait Until Element Contains    class=error-message-container    ${ERROR_MESSAGES["noPassword"]}

I am able to see the expected error message for wrong credentials
    Wait Until Element Contains    class=error-message-container    ${ERROR_MESSAGES["wrongCredentials"]}
    
I input only the username
    Wait Until Element Is Visible    id=user-name
    Input Text    id=user-name    ${LOGIN_DATA["loginSuccess"]["username"]}

I input only the password
    Wait Until Element Is Visible    id=user-name
    Input Text    id=password    ${LOGIN_DATA["loginSuccess"]["password"]}

I input no credentials
    Wait Until Element Is Visible    id=user-name