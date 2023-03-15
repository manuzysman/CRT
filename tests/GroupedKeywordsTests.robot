*** Settings ***
Resource                      ../resources/commonbis.robot
Resource                      ../resources/accounts.robot

Suite Setup                   Open Browser          about:blank                 ${BROWSER}
Suite Teardown                Close All Browsers

*** Test Cases ***

Create an Account and Delete using grouped Keywords
    Login
    New Account
    Verify Account
    Delete Account