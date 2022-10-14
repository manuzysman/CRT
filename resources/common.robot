*** Settings ***
Library                   QWeb
Library                   QForce
Library                   String


*** Variables ***
${username}               YOUR USERNAME HERE
${login_url}              https://YOURDOMAIN.my.salesforce.com          # Salesforce instance. NOTE: Should be overwritten in CRT variables
${home_url}               ${login_url}/lightning/page/home


*** Keywords ***
Setup Browser
    Open Browser          about:blank                 ${BROWSER}
    SetConfig             LineBreak                   ${EMPTY}               #\ue000
    SetConfig             DefaultTimeout              20s                    #sometimes salesforce is slow


End suite
    Close All Browsers


Login
    [Documentation]             Login to Salesforce instance
    GoTo                        ${login_url}
    TypeText                    Username                    ${username}
    TypeText                    Password                    ${password}
    ClickText                   Log In
    ${isMFA}=  IsText     Verify Your Identity                                    #Determines MFA is prompted
    Log To Console                       ${isMFA}
     IF   ${isMFA}                                                        #Conditional Statement for if MFA verification is required to proceed
          ${mfa_code}=    GetOTP    ${username}    ${MY_SECRET}    ${password}
          TypeSecret      Code      ${mfa_code}
          ClickText       Verify
    END

Home
    [Documentation]       Navigate to homepage, login if needed
    GoTo                  ${home_url}
    ${login_status} =     IsText                      To access this page, you have to log in to Salesforce.    2
    Run Keyword If        ${login_status}             Login
    ClickText             Home
    VerifyTitle           Home | Salesforce

Sales App
    [Documentation]        Navigate to the Sales App
    LaunchApp              Sales

# Example of custom keyword with robot fw syntax
VerifyStage
    [Documentation]       Verifies that stage given in ${text} is at ${selected} state; either selected (true) or not selected (false)
    [Arguments]           ${text}                     ${selected}=true
    VerifyElement         //a[@title\="${text}" and @aria-checked\="${selected}"]


NoData
    VerifyNoText          ${data}                     timeout=3                        delay=2

