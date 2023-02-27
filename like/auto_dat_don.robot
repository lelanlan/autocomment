*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
add_to_cart
    Open Browser    http://10.124.60.233:81/b2b_order/    Chrome
    Click Element    //select[@id="env"]
    Sleep    2s
    Click Element    //option[text()=' UAT ']
    Clear Element Text    //input[@id='phone']
    Input Text    //input[@id='phone']    0111358359
    Clear Element Text    //input[@id='offer_list']
    Input Text    //input[@id='offer_list']    3770008_1MG
    Clear Element Text    //input[@id='qty_list']
    Input Text    //input[@id='qty_list']    10
    Click Element    //input[@id='place_order']
    FOR    ${i}    IN RANGE    1    30
        Wait Until Element Is Enabled    //div[contains(text(),'Đặt hàng thành công, mã đơn hàng:')]    30s
        Sleep    5s
        Click Element    //input[@id='place_order']
    END

aaaaa
    Open Browser    http://10.124.60.67:81/b2b_order/    Chrome
    Clear Element Text    //input[@id='phone']
    Input Text    //input[@id='phone']    0111111186
    Clear Element Text    //input[@id='offer_list']
    Input Text    //input[@id='offer_list']    3514086_1MG
    Clear Element Text    //input[@id='qty_list']
    Sleep    10s
    Input Text    //input[@id='qty_list']    5
    Sleep    10s
    Click Element    //input[@id='place_order']

test
    Open Browser    https://vinid-team.atlassian.net/plugins/servlet/ac/com.infostretch.QmetryTestManager/qtm4j-test-management?project.key=TM1D&project.id=10556#!/executionPage/M99tbwJHGDW7    chrome
    Sleep    120s
    FOR    ${i}    IN RANGE    1    200
        Sleep    2s
        Click Element    (//li[3]//div[@role="presentation"])[1]
    END
