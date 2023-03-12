*** Settings ***
Library                       QForce
Library                       String

*** Variables ***
${BROWSER}                    chrome
${username}                   lumos@fiber.com
${login_url}                  https://login.salesforce.com         # Salesforce instance. NOTE: Should be overwritten in CRT variables
${home_url}                   ${login_url}/lightning/page/home

*** Keywords ***

Login
    Set Library Search Order  QForce    QWeb
    SetConfig                 LineBreak                   ${EMPTY}               #\ue000
    SetConfig                 DefaultTimeout              20s                    #sometimes salesforce is slow
    
    GoTo                      ${login_url}
    TypeText                  Username                    ${username}             delay=1
    TypeText                  Password                    ${password}
    ClickText                 Log In

    GoTo                      ${home_url}
    ClickText                 Home
    VerifyTitle               Home | Salesforce

New Account
    LaunchApp                 Accounts
    ClickText                 New

    UseModal                  On                              # Only find fields from open modal dialog
   TypeText                   Account Name                    My second account            anchor=Type    delay=2
    PickList                  Type                            Customer
    TypeText                  Website                         https://gogo.nl
    TypeText                  Description                     Description entry
    ClickText                 Save                            partial_match=False
    UseModal                  Off

Verify Account
    ClickText                 Details                         recognition_mode=vision              delay=10

    VerifyText                My second account
    VerifyText                Customer
    VerifyText                https://gogo.nl
    VerifyText                Description entry

Delete Account
    ClickText                 Accounts

    ClickText                 Accounts
    TypeText                  Search this list...             My second account\n
    ClickCheckbox             Select item 1    on
    UseTable                  Item Number
    ClickCell                 r1c5
    ClickText                 Delete
    UseModal                  On
    ClickText                 Delete
    VerifyText                deleted