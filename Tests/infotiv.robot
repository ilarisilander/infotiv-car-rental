*** Settings ***
Documentation                       Testing the usability of Infotiv Car Rental
Library                             SeleniumLibrary
Test Setup                          Begin Web Test
Test Teardown                       End Web Test

*** Keywords ***
Begin Web Test
    Open Browser                    about:blank             chrome
    Maximize Browser Window         # Needs to be more than 821px wide
Go To Web Page
    Go To                           http://rental1.infotiv.net/webpage/html/gui/index.php
End Web Test
    Close Browser

*** Test Cases ***
Testing The Header Of The Website
    [Documentation]                 Testing many different functionalities of the header
    [Tags]                          Test Header
    Go To Web Page