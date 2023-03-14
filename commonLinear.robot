*** Settings ***
Library                   QWeb
Library                   QForce
Library                   String


*** Variables ***
${BROWSER}                chrome
${username}               lumos@fiber.com
${login_url}              https://copadoprofessionalservices-crt--lumosfiber.sandbox.my.salesforce.com         # Salesforce instance. NOTE: Should be overwritten in CRT variables
${home_url}               ${login_url}/lightning/page/home


*** Keywords ***
Start New Account
    Set Library Search Order      QForce
    LaunchApp                     Sales
    ClickText                     Accounts
    ClickText                     New
    UseModal                      On

Setup Browser
    Set Library Search Order      QForce
    Open Browser          about:blank                 ${BROWSER}
    SetConfig             LineBreak                   ${EMPTY}               #\ue000
    SetConfig             DefaultTimeout              20s                    #sometimes salesforce is slow


End suite
    Set Library Search Order      QForce
    Close All Browsers


Login
    Set Library Search Order      QForce
    [Documentation]       Login to Salesforce instance
    GoTo                  ${login_url}
    TypeText              Username                    ${username}             delay=1
    TypeText              Password                    ${password}
    ClickText             Log In


Home
    Set Library Search Order      QForce
    [Documentation]       Navigate to homepage, login if needed
    GoTo                  ${home_url}
    ${login_status} =     IsText                      To access this page, you have to log in to Salesforce.    2
    Run Keyword If        ${login_status}             Login
    ClickText             Home
    VerifyTitle           Home | Salesforce

Sales App
    Set Library Search Order      QForce
    [Documentation]        Navigate to the Sales App
    LaunchApp              Sales

# Example of custom keyword with robot fw syntax
VerifyStage
    Set Library Search Order      QForce
    [Documentation]       Verifies that stage given in ${text} is at ${selected} state; either selected (true) or not selected (false)
    [Arguments]           ${text}                     ${selected}=true
    VerifyElement         //a[@title\="${text}" and @aria-checked\="${selected}"]


NoData
    Set Library Search Order      QForce
    VerifyNoText          ${data}                     timeout=3                        delay=2


DeleteAccounts
    Set Library Search Order      QForce
    [Documentation]       RunBlock to remove all data until it doesn't exist anymore
    ClickText             ${data}
    ClickText             Delete
    VerifyText            Are you sure you want to delete this account?
    ClickText             Delete                      2
    VerifyText            Undo
    VerifyNoText          Undo
    ClickText             Accounts                    partial_match=False


DeleteLeads
    [Documentation]       RunBlock to remove all data until it doesn't exist anymore
    ClickText             ${data}
    ClickText             Delete
    VerifyText            Are you sure you want to delete this lead?
    ClickText             Delete                      2
    VerifyText            Undo
    VerifyNoText          Undo
    ClickText             Leads                    partial_match=False
