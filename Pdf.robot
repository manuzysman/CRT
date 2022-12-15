*** Settings ***
Resource                      ../resources/common.robot
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

    ClickText    Refresh Chart
    ClickText    Key Deals Trigger    anchor=Key Deals - Recent Opportunities
    ClickText    Key Deals Trigger    anchor=Key Deals - Recent Opportunities
    ClickText    Key Deals Trigger    anchor=Key Deals - Recent Opportunities

    LaunchApp    Dashboards
    ClickText    Adoption Dashboard
    QVision.LogScreenshot    normal  screenshot=aaa.gif 
    Take Screenshot 	mypic  1024
    QWeb.VerifyIcon                   	mypic_4.jpg
  
