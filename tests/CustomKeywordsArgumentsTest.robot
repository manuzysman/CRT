*** Settings ***
Resource                      ../resources/commonbis.robot
Resource                      ../resources/accounts.robot

Suite Setup                   Open Browser          about:blank                 ${BROWSER}
Suite Teardown                Close All Browsers

*** Test Cases ***

Create an Account and Delete using Arguments
    [tags]                    Exercice7
    Login
    New Account with Mandatory Arguments        My 5 account    Customer
    Verify Account with Optional Arguments
    Delete Account with Mandatory Arguments     My 5 account