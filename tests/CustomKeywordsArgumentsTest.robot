*** Settings ***
Resource                      ../resources/commonbis.robot
Resource                      ../tests/accounts.robot

Suite Setup                   Open Browser          about:blank                 ${BROWSER}
Suite Teardown                Close All Browsers

*** Test Cases ***

Create an Account and Delete using Arguments
    Login
    New Account with Mandatory Arguments        My second account    Customer
    Verify Account with Optional Arguments
    Delete Account with Mandatory Arguments     My second account