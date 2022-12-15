*** Settings ***
Resource  resources/common.robot
Suite Setup                   Setup Browser
Suite Teardown                End suite
Library                   QWeb
Library                       DateTime
Library                       QVision
Library                       Screenshot

*** Variables ***
${BASE_IMAGE_PATH}          ${CURDIR}${/}..${/}resources${/}images


*** Test Cases ***
Entering A Lead
    [tags]                    Lead                        Git Repo Exercise   
    Appstate                  Home
    # QWeb.VerifyText  ${BASE_IMAGE_PATH}
    ClickIcon                   plane
