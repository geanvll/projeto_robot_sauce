*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/login_keywords.resource
Test Setup    Open Browser    browser=chrome

*** Variables ***
${URL}    https://www.saucedemo.com/
${BROWSER}    chrome
${USERNAME}    standard_user
${PASSWORD}    secret_sauce

*** Test Cases ***
Successful Login
    I navigate to the login page    ${URL}
    I input correct credentials    ${USERNAME}    ${PASSWORD}
    I click in login button
    I am able view the home page

Unsuccesful Login - No credentials
    I navigate to the login page    ${URL}
    Wait Until Element Is Visible    id=user-name
    I click in login button
    I am able to see the expected error message    Epic sadface: Username is required

Unsuccesful Login - No username
    I navigate to the login page    ${URL}
    I input only the password    ${PASSWORD}
    I click in login button
    I am able to see the expected error message    Epic sadface: Username is required

Unsuccesful Login - No password
    I navigate to the login page    ${URL}
    I input only the username    ${USERNAME}
    I click in login button
    I am able to see the expected error message    Epic sadface: Password is required

Unsuccesful Login - Wrong username
    I navigate to the login page    ${URL}
    Wait Until Element Is Visible    id=user-name
    Input Text    id=user-name    gejskslf
    Input Text    id=password    ${PASSWORD}
    I click in login button
    I am able to see the expected error message    Epic sadface: Username and password do not match any user in this service

Unsuccesful Login - Wrong password
    I navigate to the login page    ${URL}
    Wait Until Element Is Visible    id=user-name
    Input Text    id=user-name    ${USERNAME}
    Input Text    id=password    fjgkfldl
    I click in login button
    I am able to see the expected error message    Epic sadface: Username and password do not match any user in this service

Unsuccesful Login - Wrong credentials
    I navigate to the login page    ${URL}
    I input wrong credentials    fjjfjl    nfkmdm
    I click in login button
    I am able to see the expected error message    Epic sadface: Username and password do not match any user in this service





