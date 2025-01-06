*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.saucedemo.com/
${BROWSER}    chrome
${USERNAME}    standard_user
${PASSWORD}    secret_sauce

*** Test Cases ***
Successful Login
    Open Browser    url=https://www.saucedemo.com/    browser=chrome
    Wait Until Element Is Visible    id=user-name
    Input Text    id=user-name    ${USERNAME}
    Input Text    id=password    ${PASSWORD}
    Click Button    id=login-button
    ${urlLocation}    Get Location
    Should Be Equal    ${urlLocation}    https://www.saucedemo.com/inventory.html

Unsuccesful Login - No credentials
    Open Browser    url=https://www.saucedemo.com/    browser=chrome
    Wait Until Element Is Visible    id=user-name
    Click Button    id=login-button
    Wait Until Element Contains    class=error-message-container    text=Epic sadface: Username is required

Unsuccesful Login - No username
    Open Browser    url=https://www.saucedemo.com/    browser=chrome
    Wait Until Element Is Visible    id=user-name
    Input Text    id=password    ${PASSWORD}
    Click Button    id=login-button
    Wait Until Element Contains    class=error-message-container    text=Epic sadface: Username is required

Unsuccesful Login - No password
    Open Browser    url=https://www.saucedemo.com/    browser=chrome
    Wait Until Element Is Visible    id=user-name
    Input Text    id=user-name    ${USERNAME}
    Click Button    id=login-button
    Wait Until Element Contains    class=error-message-container    text=Epic sadface: Password is required

Unsuccesful Login - Wrong username
    Open Browser    url=https://www.saucedemo.com/    browser=chrome
    Wait Until Element Is Visible    id=user-name
    Input Text    id=user-name    gejskslf
    Input Text    id=password    ${PASSWORD}
    Click Button    id=login-button
    Wait Until Element Contains    class=error-message-container    text=Epic sadface: Username and password do not match any user in this service

Unsuccesful Login - Wrong password
    Open Browser    url=https://saucedemo.com/    browser=chrome
    Wait Until Element Is Visible    id=user-name
    Input Text    id=user-name    ${USERNAME}
    Input Text    id=password    fjgkfldl
    Click Button    id=login-button
    Wait Until Element Contains    class=error-message-container    text=Epic sadface: Username and password do not match any user in this service

Unsuccesful Login - Wrong credentials
    Open Browser    url=https://saucedemo.com/    browser=chrome
    Wait Until Element Is Visible    id=user-name
    Input Text    id=user-name    fjfjfld
    Input Text    id=password    fjgkfldl
    Click Button    id=login-button
    Wait Until Element Contains    class=error-message-container    text=Epic sadface: Username and password do not match any user in this service