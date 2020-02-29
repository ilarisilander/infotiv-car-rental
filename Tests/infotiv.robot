*** Settings ***
Documentation                       Testing the usability of Infotiv Car Rental
Library                             SeleniumLibrary
Test Setup                          Begin Web Test
Test Teardown                       End Web Test

*** Keywords ***
Begin Web Test
    Open Browser                    about:blank             chrome
    Maximize Browser Window         # Needs to be more than 821px wide
    Set Selenium Speed              0.5 seconds
Go To Web Page
    Go To                           http://rental1.infotiv.net/webpage/html/gui/index.php
    Wait Until Page Contains        When do you want to make your trip?
End Web Test
    Close Browser
Header Should Exist
    Page Should Contain Element     xpath://*[@id="headerWrapper"]
Click Header Icon
    Click Element                   xpath://*[@id="logo"]
Click Header Title Text
    Click Element                   xpath://*[@id="title"]
Click About Text Button
    Click Element                   //*[@id="about"]
Go To About Page
    Go To                           http://rental1.infotiv.net/webpage/html/gui/about.php
    Wait Until Page Contains        Welcome
Go To Cars Page
    Go To                           http://rental1.infotiv.net/webpage/html/gui/showCars.php
    Wait Until Page Contains        What would you like to drive?
Go To Create User Page
    Go To                           http://rental1.infotiv.net/webpage/html/gui/userRegistration.php
    Wait Until Page Contains        Create a new user
Go To My Page
    Go To                           http://rental1.infotiv.net/webpage/html/gui/myPage.php
    Wait Until Page Contains        //*[@id="show"]
Click On Continue Button
    Click Element                   xpath://*[@id="continue"]
Click Create User
    Click Element                   xpath://*[@id="createUser"]
Login User
    Input Text                      id:email        ilarisilander@hotmail.com
    Input Text                      id:password     password
    Click Element                   //*[@id="login"]
Verify Main Page URL
    Location Should Be              http://rental1.infotiv.net/webpage/html/gui/index.php
Verify About Page URL
    Location Should Be              http://rental1.infotiv.net/webpage/html/gui/about.php
Verify User Information Exists
    Page Should Contain Element     xpath://*[@id="userInfoWrapper"]
Verify Login User Field
    Page Should Contain Element     xpath://*[@id="email"]
Verify Login Password Field
    Page Should Contain Element     xpath://*[@id="password"]
Verify Login Button
    Page Should Contain Element     xpath://*[@id="login"]
Verify Create User Button
    Page Should Contain Element     xpath://*[@id="createUser"]
Click Login Button
    Click Element                   xpath://*[@id="login"]
Check For Alert Message
    Alert Should Be Present         
    Handle Alert                    leave


*** Test Cases ***
Header Should Exist On All Pages
    [Documentation]                 Testing that the header exists in all URL's
    [Tags]                          Test Header Exists
    Go To Web Page
    Header Should Exist
    Click On Continue Button
    Header Should Exist
    Go To About Page
    Header Should Exist
    Go To Create User Page
    Header Should Exist
    Login User
    Header Should Exist

Verify Redirection Of Header Buttons
    [Documentation]                 Clicking header icon and title redirects to main page. About button redirects to About page
    [Tags]                          Test Click Header Buttons
    Go To Web Page
    Click Header Icon
    Verify Main Page URL
    Click Header Title Text
    Verify Main Page URL
    Click About Text Button
    Verify About Page URL

User Information Exist On Page
    [Documentation]                 The informatin about the user should be visible when logged in
    [Tags]                          Verify User Info
    Go To Web Page
    Login User
    Verify User Information Exists

Verify Login Fields And Buttons Are Visible
    [Documentation]                 If the user is not logged in, the fields and buttons for username and password should be visible
    [Tags]                          Verify Login Fields And Buttons
    Go To Web Page
    Verify Login User Field
    Verify Login Password Field
    Verify Login Button
    Verify Create User Button

Alert Message If Empty Fields On Login
    [Documentation]                 If the login fields are left empty, then there will be an alert message
    [Tags]                          Alert Message If Empty Login fields
    Go To Web Page
    Click Login Button
    Check For Alert Message

