*** Settings ***
Library           SeleniumLibrary
Library           Collections

*** Test Cases ***
get count menu
    Open Browser    https://www.guru99.com/    Chrome
    Sleep    20S
    Click Element    //span[contains(text(),'Testing') and @class='nav-drop-title-wrap']
    Sleep    2s
    @{b}    Create List    Agile Testing    JUnit    Quality Center(ALM)    Bugzilla    HP Loadrunner    RPA    Cucumber    Software Testing    SAP Testing    Database Testing    Mobile Testing    Selenium    ETL Testing    Mantis    SoapUI
    ...    JMeter    Postman    TEST Management    JIRA    QTP    TestLink
    ${a}    Get Element Count    //ul[@class="sub-menu show"]//li/a
    FOR    ${i}    IN RANGE    1    ${a}+1
        ${text}    Get Text    (//ul[@class="sub-menu show"]//li/a)[${i}]
        ${t}    Evaluate    ${i}-1
        Should Be Equal    ${text}    ${b}[${t}]
        log    ${b}[${t}]
    END

test
    @{b}    Create List    Agile Testing    JUnit    Quality Center(ALM)    Bugzilla    HP Loadrunner    RPA    Cucumber    Software Testing    SAP Testing    Database Testing    Mobile Testing    Selenium    ETL Testing    Mantis    SoapUI
    ...    JMeter    Postman    TEST Management    JIRA    QTP    TestLink
    log    ${b}[1]
