*** Settings ***
Resource  resources/common.robot
Suite Setup                   Setup Browser
Suite Teardown                End suite
Library                   QWeb
Library                       DateTime
#Library                       QVision
Library                       Screenshot
Library        CSVLibrary

*** Variables ***
${BASE_IMAGE_PATH}          ${/}resources${/}images
${pdf}


*** Test Cases ***
Upload File Test
    Open Browser    https://yourwebsite.com    chrome    # Replace with your website URL
    Log To Console                         ${EXECDIR}
    UploadFile      fileUpload     ${EXECDIR}/aaa.robot
    Close Browser

# *** Test Cases ***
# Entering A Lead
#     [tags]                    Lead                        Git Repo Exercise   
#     Appstate                  Home
#     # QWeb.VerifyText  ${BASE_IMAGE_PATH}
    
#     ClickIcon  icon-plus
#     ClickText    Files
#     ClickText    Adobe PDF

   
#     # Pdf opens to a new tab and we need to switch focus
#     SwitchWindow            NEW

#     # Use QVision library to access elements on the pdf viewer
#     # QVision.SetReferenceFolder   resources/images
#     # QVision.ClickIcon       pdf_download_icon
#     ClickText    Download
#     ExpectFileDownload
#     ${variable}=  VerifyFileDownload  timeout=20sec
#     # QVision.ClickText       Save    anchor=Cancel

#     # ${file_exists}          Set Variable    False

#     # Wait for file download
#    #  FOR    ${i}    IN RANGE    0    20
#       #  ${file_exists}      Run Keyword And Return Status
#      #    ...                 File Should Exist    /root/Downloads/${pdf_file}.pdf

#        # IF                  ${file_exists}       BREAK
#        # Sleep               0.5s
#    # END

#     # List Files In Directory    /root/Downloads/

#     # When dowloading a large file there should be a waiting mechanism
#     UsePdf                  ${pdf}

#     # Read file contents to a variable and find an address
#     ${file_content}         GetPdfText
#     ${find_position}        Evaluate    $file_content.find("${text_in_file}")
#     ${onsight_address}      Evaluate    $file_content[$find_position:$find_position+77].lstrip("${text_in_file}; ")
#     Log                     ${onsight_address}    console=true
    
#     CloseWindow
#     SwitchWindow            1
#     ClickIcon                   pdf_download_icon
#     ExpectFileDownload
#     ClickText               Download
#     VerifyFileDownload      timeout=20s     # file should be downloaded in 20 seconds
