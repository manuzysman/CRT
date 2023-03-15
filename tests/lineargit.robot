*** Settings ***
Resource                      commonLinear.robot
Suite Setup                   Setup Browser
Suite Teardown                End suite

*** Variables ***
${salutation}
${firstName}
${lastName}
${fullTitle}
${fullName}

*** Test Cases ***
Entering A Lead
    [tags]                    Lead    testgen    numtests=3    Linear Generation
    Appstate                  Home
    LaunchApp                 Sales

    ClickText                 Leads
    VerifyText                Recently Viewed             timeout=120s
    ClickText                 New                         anchor=Import                timeout=120s
    VerifyText                Lead Information
    UseModal                  On                          # Only find fields from open modal dialog

    ${salutation}=            Convert To String           [Ms.,Mrs.,Mr.]
    ${firstName}=             Convert To String           [Tina,Jessica,John]
    ${lastName}=              Convert To String           [Smith,Thomas,Theodore]
    ${fullTitle}=             Catenate                    ${salutation}               ${firstName}    ${lastName}
    ${fullName}=              Catenate                    ${firstName}                ${lastName}

    Picklist                  Salutation                  ${salutation}
    TypeText                  First Name                  ${firstName}
    TypeText                  Last Name                   ${lastName}
    Picklist                  Lead Status                 New
    TypeText                  Phone                       +12234567858449             First Name
    TypeText                  Company                     Growmore                    Last Name
    TypeText                  Title                       Manager                     Address Information
    TypeText                  Email                       VALID_EMAIL_ADDRESS         Rating                  #Test Data Generation
    TypeText                  Website                     https://www.growmore.com/

    Picklist                  Lead Source                 Partner
    ClickText                 Save                        partial_match=False
    UseModal                  Off
    