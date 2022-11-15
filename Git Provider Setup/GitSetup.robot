*** Settings ***
Resource                      ../resources/common.robot
Suite Setup                   Setup Browser
Suite Teardown                End suite
Library                   QWeb
Library                       DateTime

*** Variables ***
${currentTimestamp}



*** Test Cases ***
Entering A Lead
    [tags]                    Lead                        Git Repo Exercise   
    Appstate                  Home
    ${currentTimestamp}=          Get Current Date

    ClickText                 Leads
    VerifyText                Recently Viewed             timeout=120s
    ClickText                 New                        anchor=Import
    VerifyText                Lead Information
    UseModal                  On                          # Only find fields from open modal dialog

    Picklist                  Salutation                  Ms.
    TypeText                  First Name                  Tina
    Log To Console   customer name is ${currentTimestamp}
    TypeText                  Last Name                   Smith
    Picklist                  Lead Status                 Qualified
    TypeText                  Phone                       +12234567858449             First Name
    TypeText                  Company                     Growmore                    Last Name
    TypeText                  Title                       Manager                     Address Information
    TypeText                  Email                       tina.smith@gmail.com        Rating
    TypeText                  Website                     https://www.growmore.com/

    ClickText                 Lead Source
    ClickText                 Save                        partial_match=False
    UseModal                  Off
    Sleep                     2
    
    ClickText                 Details                    anchor=Chatter
    VerifyText               Ms. Tina Smith
    VerifyText               Manager                     anchor=Title
    VerifyField               Phone                       +12234567858449
    VerifyField               Company                     Growmore
    VerifyField               Website                     https://www.growmore.com/

    # as an example, let's check Phone number format. Should be "+" and 14 numbers
    ${phone_num}=             GetFieldValue               Phone
    Should Match Regexp	      ${phone_num}	              ^[+]\\d{14}$
    
    ClickText                 Leads
    VerifyText                Tina Smith
    VerifyText                Manager
    VerifyText                Growmore

Delete Tina Smith's Lead
    [tags]                    Lead                        Git Repo Exercise
    Log To Console   customer name is ${currentTimestamp}
        Log To Console   customer name is ${currentTimestamp}

    LaunchApp                 Sales
    ClickText                 Leads
    VerifyText                Recently Viewed             timeout=120s
        Log To Console   customer name is ${currentTimestamp}

    Wait Until Keyword Succeeds   1 min   5 sec   ClickText    Tina Smith
    ClickText                    Show more actions
    ClickText                    Delete
    ClickText                    Close
    VerifyNoText                 Tina Smith
