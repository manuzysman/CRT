*** Settings ***
Library                              QForce
Library                              String
Suite Setup                     Open Browser          about:blank                 ${BROWSER}
Suite Teardown              Close All Browsers


*** Variables ***
${BROWSER}                    chrome
${username}                    pkievit@copado.com.crttestprod.crtedu
${login_url}                       https://copadoprofessionalservices-crt--crtedu.sandbox.lightning.force.com          # Salesforce instance. NOTE: Should be overwritten in CRT variables
${home_url}                     ${login_url}/lightning/page/home


*** Test Cases ***
