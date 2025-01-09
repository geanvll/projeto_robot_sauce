*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/login_keywords.resource
Suite Setup    Open Browser    browser=chrome

*** Variables ***
${URL}    https://www.saucedemo.com/
${BROWSER}    chrome
${USERNAME}    standard_user
${PASSWORD}    secret_sauce     

*** Test Cases ***
Successful Login
    I navigate to the login page    ${URL}
    I input correct credentials
    I click in login button
    I am able view the home page

Unsuccesful Login - No credentials
    I navigate to the login page    ${URL}
    I input no credentials
    I click in login button
    I am able to see the expected error message for no credentials

Unsuccesful Login - No username
    I navigate to the login page    ${URL}
    I input only the password
    I click in login button
    I am able to see the expected error message for no username

Unsuccesful Login - No password
    I navigate to the login page    ${URL}
    I input only the username
    I click in login button
    I am able to see the expected error message for no password


Unsuccesful Login - Wrong credentials
    I navigate to the login page    ${URL}
    I input wrong credentials
    I click in login button
    I am able to see the expected error message for wrong credentials 





