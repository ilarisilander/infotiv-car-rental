*** Settings ***
Documentation                       Testing the usability of Infotiv Car Rental
Library                             SeleniumLibrary
Resource                            ../Resources/Keywords.robot
Test Setup                          Begin Web Test
Test Teardown                       End Web Test


*** Test Cases ***
Header Should Exist On All Pages
    [Documentation]                 Testing that the header exists in all URL's
    [Tags]                          Test Header Exists
    Go To Home Page
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
    Go To Home Page
    Click Header Icon
    Verify Main Page URL
    Click Header Title Text
    Verify Main Page URL
    Click About Text Button
    Verify About Page URL

User Information Exist On Page
    [Documentation]                 The informatin about the user should be visible when logged in
    [Tags]                          Verify User Info
    Go To Home Page
    Login User
    Verify User Information Exists

Verify Login Fields And Buttons Are Visible
    [Documentation]                 If the user is not logged in, the fields and buttons for username and password should be visible
    [Tags]                          Verify Login Fields And Buttons
    Go To Home Page
    Verify Login User Field
    Verify Login Password Field
    Verify Login Button
    Verify Create User Button

Email And Password Field Should Have Required
    [Documentation]                 If email and password fields are left empty, there should be a popup that says so
    [Tags]                          Required Input In Fields
    Go To Home Page
    Fields Should Have Required

Alert Message If Wrong Email And/Or Password
    # Uppfyller det godkända kravet för "ogiltig input"
    [Documentation]                 If email and/or password get wrong input, an alert message is displayed
    [Tags]                          Wrong Email Password
    Go To Home Page
    Wrong Username And Password
    Click Login Button
    Check For Alert Message

Successful Login Shows Firstname In User Information
    # Uppfyller det godkända kravet för "Gherkin syntax"
    [Documentation]                 User information will have a welcome phrase with the users first name in it
    [Tags]                          Firstname In User Info
    Given that the user is on the landing page
    And the user has filled in the correct user information
    When the user clicks on the login button
    Then the users first name should be in the user information welcome phrase

Users Bookings Should Contain No Bookings
    # Uppfyller det väl godkända kravet för navigation mellan två sidor, VG_test tag och Gherkin-syntax
    [Documentation]                 There should be no active bookings in the users private page
    [Tags]                          VG_test
    Given that the user is logged in
    And the My page button is visible
    When the user clicks on the My page button
    Then the user gets redirected to the users page and there should be no bookings active

User Should Be Able To Book A Vehicle
    # Uppfyller det godkända kravet för ett längre testfall med bokning och att ta bort bokning
    [Documentation]                 Test to login, book a car and then remove the bookings from "my page"
    [Tags]                          Booking Test
    Go To Home Page
    Login User
    Click Header Icon
    Click On Continue Button
    Click On Book Button For Audi Q7
    Input 16 Digits For Card Number
    Input Firstname And Lastname For Booking
    Input Security Number From Back Of Card
    Click Confirm Button For Booking
    Click My Page Button
    Click Cancel Booking Button
    Click Ok On Alert Message
    Verify That Car Has Been Returned

