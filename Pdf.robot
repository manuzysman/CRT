*** Settings ***
Resource  resources/common.robot
Suite Setup                   Setup Browser
Suite Teardown                End suite
Library                   QWeb
Library                       DateTime
Library                       QVision
Library                       Screenshot

${BASE_IMAGE_PATH}          ${CURDIR}${/}..${/}resources


*** Test Cases ***
Entering A Lead
    [tags]                    Lead                        Git Repo Exercise   
    Appstate                  Home

  
