# *** Settings ***
# Resource                      ../resources/common.robot
# Suite Setup                   Setup Browser
# Suite Teardown                End suite
# Library                   QWeb
# Library                       DateTime
# #Library                       QVision

# Library                       Screenshot


# *** Variables ***
# ${v1}  1
# ${v2}  1
# ${v3}  1
# ${v4}  2 
# ${v5}  1
# ${currentTimestamp}
# ${manu}
# ${ooo}
# ${label}
# ${x}
# ${BASE_IMAGE_PATH}          ${CURDIR}${/}..${/}resources


# *** Test Cases ***
# Entering A Lead
#     [tags]                    Lead                        Git Repo Exercise   
#     Appstate                  Home

#     ClickText    Refresh Chart
#     ClickText    Key Deals Trigger    anchor=Key Deals - Recent Opportunities
#     ClickText    Key Deals Trigger    anchor=Key Deals - Recent Opportunities
#     ClickText    Key Deals Trigger    anchor=Key Deals - Recent Opportunities

#     LaunchApp    Dashboards
#     ClickText    Adoption Dashboard
#     #QVision.LogScreenshot    normal  screenshot=aaa.gif 
#     Take Screenshot 	mypic  1024
#     QWeb.VerifyIcon                   	mypic_4.jpg
  
#     Set Suite Variable    $currentTimestamp    Hello, world!

#    ${attribute_value}  GetAttribute            xpath\=/html/body/div[4]/div[1]/section/div[1]/div[2]/div[2]/div[1]/div/div/div/div/div/div/div/div[1]/div[1]/div/div/div[2]/div[1]/div[4]/div   class

#    Hover Element  /html/body/div[3]/div/div[1]/div/div/div/div[1]/div[2]/div[2]/div[3]/div/article/div[1]/div


#    #${Top}    Execute Javascript    var element=document.evaluate("/html/body/div[3]/div/div[1]/div/div/div/div[1]/div[2]/div[2]/div[3]/div/article/div[1]/div/div[1]/canvas", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue; var rect = element.getBoundingClientRect(); return rect.top

#    #Execute Javascript  document.evaluate(‘//*[text()='Patients']‘,document.body,null,9,null).singleNodeValue.click()

#    Execute JavaScript  document.getElementById(‘widget-canvas-2’).onclick()
#    Execute JavaScript  document.evaluate(‘//*[@id\="widget-canvas-2"]/div[1]/canvas‘,document.body,null,9,null).singleNodeValue.click()
#    Execute JavaScript  document.evaluate(‘//*[@id\="widget-canvas-2"]/div[1]/div‘,document.body,null,9,null).singleNodeValue.click()
#    Execute JavaScript  document.evaluate(‘//*[@id\="main"]/div/div[1]/div/div/div/div[1]/div[2]/div[2]/div[1]/div/article/div[2]/div/div/span/a‘,document.body,null,9,null).singleNodeValue.click()
#    Execute JavaScript  document.evaluate(‘/html/body/div[3]/div/div[1]/div/div/div/div[1]/div[2]/div[2]/div[1]/div/article/div[2]/div/div/span/a‘,document.body,null,9,null).singleNodeValue.click()

#    Execute JavaScript  alert('qaaa');
   
#    ${Top}  Execute JavaScript  var canvas \= document.getElementsByTagName('canvas'); var rect \= canvas.getBoundingClientRect(); alert(rect.width); var context \= canvas.getContext("2d"); var x \= getPosX(canvas, context); alert(context.clientX); function getPosX(canvas, evt) { var rect \= canvas.getBoundingClientRect(); return evt.clientX - rect.left;} function getElementByXpath(path) { return document.evaluate(path, document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;};
  
#    ${Top}  Execute JavaScript  var canvas \= document.getElementsByTagName('canvas')[0]; var ctx \= canvas.getContext("2d"); ctx.moveTo(0, 0); ctx.lineTo(200, 100); ctx.stroke();
  


  
# # document.getElementById(‘widget-canvas-0‘)
# #document.querySelector('#widget-canvas-0 canvas')
# #document.querySelector("#widget-canvas-0 canvas");
# #function myFunction() { let x = getElementByXpath("//html[1]/body[1]/button[1]");}


#    # ${aaa}=  GetText  /html/body/div[4]/div[1]/section/div[1]/div[2]/div[2]/div[1]/div/div/div/div/div/div/div/div[2]/div/div/div[1]/header/h2
   

#    GetText          //*[@id\="brandBand_2"]/div/div/div/div/div/div/div[1]/div[1]/div/div/div[1]/div/h2

# #${aaa}   #  GetWebelement          xpath\=/html/body/div[4]/div[1]/section/div[1]/div[2]/div[2]/div[1]/div/div/div/div/div/div/div/div[2]/div/div/div[1]/header/h2  element_type=text
#    # ${aaa}=  GetText  xpath\=/html/body/div[4]/div[1]/section/div[1]/div[2]/div[2]/div[1]/div/div/div/div/div/div/div/div[2]/div/div/div[1]/header/h2
   

#    ${label}=   GetText           //*[@id\="brandBand_2"]/div/div/div/div/div/div/div[1]/div[1]/div/div/div[1]/div/h2/span
#    Log To Console   le label est ${label}

#     IF    "cat" == "cat" and "dog" == "bit"
#         Log    This line is NOT executed.
#         ${ooo}=   GetText           //*[@id\="brandBand_2"]/div/div/div/div/div/div/div[1]/div[1]/div/div/div[1]/div/h2/span
#     END

#     IF    ${v1} == ${v2} or ${v3} == ${v4}
#         Log To Console   la valeur de v5 est ${v5}
#     END

#     Run Keyword If    ${True}    Log    This line IS executed.  Log    ${v4}
#     ${ooo}=   GetText           //*[@id\="brandBand_2"]/div/div/div/div/div/div/div[1]/div[1]/div/div/div[1]/div/h2/span

#    Log To Console   customer name is ${attribute_value}

#     ClickText                 Leads
#     VerifyText                Recently Viewed             timeout=120s
#     ClickText                 New                        anchor=Import
#     VerifyText                Lead Information
#     UseModal                  On                          # Only find fields from open modal dialog
#     ${variable}=  VerifyFileDownload  timeout=20sec
#     Picklist                  Salutation                  Ms.
#     TypeText                  First Name                  Tina
#     Log To Console   customer name is ${currentTimestamp}
#     TypeText                  Last Name                   Smith
#     Picklist                  Lead Status                 Qualified
#     TypeText                  Phone                       +12234567858449             First Name
#     TypeText                  Company                     Growmore                    Last Name
#     TypeText                  Title                       Manager                     Address Information
#     TypeText                  Email                       tina.smith@gmail.com        Rating
#     TypeText                  Website                     https://www.growmore.com/

#     ClickText                 Lead Source
#     ClickText                 Save                        partial_match=False
#     UseModal                  Off
#     Sleep                     2
    
#     ClickText                 Details                    anchor=Chatter
#     VerifyText               Ms. Tina Smith
#     VerifyText               Manager                     anchor=Title
#     VerifyField               Phone                       +12234567858449
#     VerifyField               Company                     Growmore
#     VerifyField               Website                     https://www.growmore.com/

#     # as an example, let's check Phone number format. Should be "+" and 14 numbers
#     ${phone_num}=             GetFieldValue               Phone
#     Should Match Regexp	      ${phone_num}	              ^[+]\\d{14}$
    
#     ClickText                 Leads
#     VerifyText                Tina Smith
#     VerifyText                Manager
#     VerifyText                Growmore

# Delete Tina Smith's Lead
#     [tags]                    Lead                        Git Repo Exercise
#     Log To Console   customer name is ${currentTimestamp}
#         Log To Console   customer name is ${currentTimestamp}

#     LaunchApp                 Sales
#     ClickText                 Leads
#     VerifyText                Recently Viewed             timeout=120s
#         Log To Console   customer name is ${currentTimestamp}

#     Wait Until Keyword Succeeds   1 min   5 sec   ClickText    Tina Smith
#     ClickText                    Show more actions
#     ClickText                    Delete
#     ClickText                    Close
#     VerifyNoText                 Tina Smith
