*** Variables ***
${URL_HOME}                         http://rental1.infotiv.net/webpage/html/gui/index.php
${BROWSER_DRIVER}                   chrome
${URL_ABOUT}                        http://rental1.infotiv.net/webpage/html/gui/about.php
${URL_SHOW_CARS}                    http://rental1.infotiv.net/webpage/html/gui/showCars.php
${URL_CREATE_USER}                  http://rental1.infotiv.net/webpage/html/gui/userRegistration.php
${URL_MY_PAGE}                      http://rental1.infotiv.net/webpage/html/gui/myPage.php
${PASSWORD_WRONG}                   passwordpassword
${PASSWORD_CORRECT}                 password
${EMAIL_WRONG}                      ilari.silander@hotmail.com
${EMAIL_CORRECT}                    ilarisilander@hotmail.com
${BUTTON_LOGIN}                     xpath://*[@id="login"]
${BUTTON_MY_PAGE}                   xpath://*[@id="mypage"]
${BUTTON_CANCEL_BOOKING}            xpath://*[@id="unBook1"]

*** Keywords ***
Begin Web Test
    Open Browser                    about:blank             ${BROWSER_DRIVER}
    Maximize Browser Window

Go To Home Page
    Go To                           ${URL_HOME}
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
    Click Element                   xpath://*[@id="about"]

Go To About Page
    Go To                           ${URL_ABOUT}
    Wait Until Page Contains        Welcome

Go To Cars Page
    Go To                           ${URL_SHOW_CARS}
    Wait Until Page Contains        What would you like to drive?

Go To Create User Page
    Go To                           ${URL_CREATE_USER}
    Wait Until Page Contains        Create a new user

Go To My Page
    Go To                           ${URL_MY_PAGE}
    Wait Until Page Contains        xpath://*[@id="show"]

Click On Continue Button
    Click Element                   xpath://*[@id="continue"]

Click Create User
    Click Element                   xpath://*[@id="createUser"]

Login User
    Input Text                      id:email        ${EMAIL_CORRECT}
    Input Text                      id:password     ${PASSWORD_CORRECT}
    Click Element                   ${BUTTON_LOGIN}

Verify Main Page URL
    Location Should Be              ${URL_HOME}

Verify About Page URL
    Location Should Be              ${URL_ABOUT}

Verify User Information Exists
    Page Should Contain Element     xpath://*[@id="userInfoWrapper"]

Verify Login User Field
    Page Should Contain Element     xpath://*[@id="email"]

Verify Login Password Field
    Page Should Contain Element     xpath://*[@id="password"]

Verify Login Button
    Page Should Contain Element     ${BUTTON_LOGIN}

Verify Create User Button
    Page Should Contain Element     xpath://*[@id="createUser"]

Click Login Button
    Click Element                   ${BUTTON_LOGIN}

Check For Alert Message
    Element Should Contain          xpath://*[@id="signInError"]      Wrong e-mail or password

Wrong Username And Password
    Input Text                      id:email            ${EMAIL_WRONG}
    Input Text                      id:password         ${PASSWORD_WRONG}

that the user is on the landing page
    Go To Home Page
    Page Should Contain Button     ${BUTTON_LOGIN}

the user has filled in the correct user information
    Input Text                      id:email            ${EMAIL_CORRECT}
    Input Text                      id:password         ${PASSWORD_CORRECT}

the user clicks on the login button
    Click Login Button

the users first name should be in the user information welcome phrase
    Element Should Contain          xpath://*[@id="welcomePhrase"]      Ilari

that the user is logged in
    Go To Home Page
    Login User

the My page button is visible
    Page Should Contain Button      ${BUTTON_MY_PAGE}

the user clicks on the My page button
    Click Button                    ${BUTTON_MY_PAGE}

the user gets redirected to the users page and there should be no bookings active
    Element Should Contain          xpath://*[@id="historyText"]        You have no bookings

Click On Book Button For Audi Q7
    Click Button                    xpath://*[@id="bookQ7pass5"]

Input 16 Digits For Card Number
    Input Text                      xpath://*[@id="cardNum"]            1111111111111111

Input Firstname And Lastname For Booking
    Input Text                      xpath://*[@id="fullName"]           Ilari Silander

Input Security Number From Back Of Card
    Input Text                      xpath://*[@id="cvc"]                111

Click Confirm Button For Booking
    Click Button                    xpath://*[@id="confirm"]

Click My Page Button
    Click Button                    ${BUTTON_MY_PAGE}

Click Cancel Booking Button
    Click Button                    ${BUTTON_CANCEL_BOOKING}

Click Ok On Alert Message
    Handle Alert                    action=ACCEPT