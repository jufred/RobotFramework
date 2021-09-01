*** Settings ***
Library    SeleniumLibrary    

Suite Setup    Log    Start test suite
Suite Teardown    Log    Test suite executed
Test Setup    Log    Start test case
Test Teardown    Log    This test was executed by %{username} on %{os}

Default Tags    UnitTest

*** Test Cases ***
MyFirstTest
    [Tags]    Fast
    Log    Hello world...
    

    
FirstSeleniumTest
    [Tags]    Chrome
    #Open Browser    https://google.com    chrome
    Open Browser    https://www.lilo.org/    chrome
    Set Browser Implicit Wait    5
   # Sleep    5
    Maximize Browser Window
    Input Text    id=lilo-search    Automation step by step
    Press Keys    id=lilo-search    ENTER
    #Sleep    2
    Close Browser    
    
SampleLoginTest
    [Tags]    Chrome
    [Documentation]    This is a sample login test
    Open Browser    ${URL}    chrome
    Set Browser Implicit Wait    5
    LoginKW
    Click Element    id=welcome
    Click Element    link=Support
    Click Element    id=welcome
    Click Element    link=Logout
    Close Browser    
    # Log    This test was executed by %{username} on %{os}
    Log    The test name is ${TEST NAME}    #Built-in variable
    
*** Variables ***
${URL}    https://opensource-demo.orangehrmlive.com/
@{CREDENTIALS}    Admin    admin123
&{LOGINDATA}    username=Admin    password=admin123

*** Keywords ***
LoginKW
    [Documentation]    Login on the demo site
    ...    Keyword created for test purpose
    Input Text    name=txtUsername    ${CREDENTIALS}[0]
    Input Text    name=txtPassword    ${LOGINDATA}[password]
    ClickOnSubmit
    
ClickOnSubmit
    Click Button    name=Submit
    