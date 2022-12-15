*** Settings ***
Resource  resources/common.robot
Suite Setup                   Setup Browser
Suite Teardown                End suite
Library                   QWeb
Library                       DateTime
Library                       QVision
Library                       Screenshot

*** Variables ***
${BASE_IMAGE_PATH}          ${/}resources${/}images


*** Test Cases ***
Entering A Lead
    [tags]                    Lead                        Git Repo Exercise   
    Appstate                  Home
    # QWeb.VerifyText  ${BASE_IMAGE_PATH}
    

    ClickText    Files
    ClickText    Adobe PDF
    ClickIcon                   pdf_download_icon
    ExpectFileDownload
    ClickText               Download
    VerifyFileDownload      timeout=20s     # file should be downloaded in 20 seconds
