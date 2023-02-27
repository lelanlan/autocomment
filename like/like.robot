*** Settings ***
Library           SeleniumLibrary
Library           Collections
Library           ExcellentLibrary
Library           String
Library           JSONLibrary
Library           OperatingSystem
Library           String
Library           ../../Libs/LogApiToText.py
Library           RequestsLibrary
Library           ../../Libs/Supplier-Json.py
Library           XML

*** Variables ***
@{a}              THYSM194595900101    THYSM193961900201    THYSM192110900401    THYSM190854900001    THYSM172094900801    THYSM166955900701    THYSM166355900801    THYSM161706900701    THYSM155935900001    THYSM155864900201    THYSM147225900701    THYSM144706900001    THYSM141706900801    THYSM141506900601    THYSM137543900801    THYSM127972900401    THYSM127855900801
...               THYSM127442900901    THYSM124544900201    THYSM112806900001    THYSM112224900901    THYSM112175900501    THYSM111955900201    THYSM105054900801    THYSM102364900101    THYSM100175900301
@{b}              SM130411200401    SM120611200501    SM140511200101    SM140511200201    SM110311200201    SM161311200801    SM171411200701    SM132411200501    SM122411200701    SM132411200401    SM102411200701    SM132411200301    SM121801200401    SM141701200901    SM177370200503

*** Test Cases ***
like
    Open Browser    https://www.like4like.org/    Chrome
    Execute Javascript    window.open('https://vi-vn.facebook.com/','_blank')
    Sleep    5s
    Switch Window    NEW
    Input Text    //input[@id='email']    lelan2297@gmail.com
    Input Text    //input[@id='pass']    lelan2297%
    Click Element    //button[@name='login']
    Sleep    3s
    Switch Window    MAIN
    Sleep    5s
    Click Element    //a[@title='Login ']
    Input Text    //input[@id='username']    lelan22971
    Input Text    //input[@id='password']    lancd162354
    Sleep    50s
    Click Element    //a[text()='Submit']
    Sleep    10s
    Mouse Over    //a[@title='Earn Pages by Social Media Exchange']
    Sleep    5s
    Click Element    //a[@title='Earn Credits By Facebook Followers']
    ${s}    Set Variable    100
    ${i}    Set Variable    1
    FOR    ${i}    IN RANGE    ${s}
        Sleep    7s
        Click Element    //span[contains(@id,'likebutton')]
        Sleep    2s
        Switch Window    NEW
        Sleep    20s
        ${a}    Run Keyword And Return Status    Element Should Be Visible    //span[text()='Theo dõi']
        Sleep    1s
        Run Keyword If    ${a}    Click Element    //span[text()='Theo dõi']
        Sleep    3s
        Run Keyword If    ${a}    Close Window
        Run Keyword If    ${a}    Switch Window    MAIN
        Run Keyword If    ${a}    Click Element    //img[contains(@src,'confirm1.png')]
        Sleep    3s
        Continue For Loop If    ${a}
        ${b}    Run Keyword And Return Status    Element Should Be Visible    //div[@data-pagelet='ProfileActions']//span[text()='Thêm b?n bè']
        Sleep    1s
        Run Keyword If    ${b}    Click Element    //div[@data-pagelet='ProfileActions']//span[text()='Thêm b?n bè']
        Sleep    5s
        Close Window
        Switch Window    MAIN
        Click Element    //img[contains(@src,'confirm1.png')]
    END

test
    Open Browser    https://vi-vn.facebook.com/    Chrome
    Sleep    5s
    Input Text    //input[@id='email']    lelan2297@gmail.com
    Input Text    //input[@id='pass']    lelan2297%
    Click Element    //button[@name='login']
    Sleep    80s
    ${t}    Set Variable    ..
    FOR    ${i}    IN RANGE    1    830
        ${name}    Get Text    (//h2[text()="Bình luận"]/following-sibling::div[2]/ul/li[${i}]/div//span[@class="pq6dq46d"]//span[@dir="auto"])
        ${gio}    Get Text    (//h2[text()="Bình luận"]/following-sibling::div[2]/ul/li[${i}]//span[@class="e9vueds3"]//div[@tabindex="0"])
        ${cmt}    Get Text    (//h2[text()="Bình luận"]/following-sibling::div[2]/ul/li[${i}]//div[@dir="auto"])
        ${line}    Set Variable    ${name}: ${gio}: ${cmt}
        ${t}    Set Variable    ${t}${line}${\n}
        Open Workbook    Data/customer.xlsx
        Write To Cell    A${i}+1    aaaaa
        Write To Cell    B${i}+1    aaaaa
        Write To Cell    C${i}+1    aaaaa
        ${EMPTY}
        ${EMPTY}
        Save
    END
    Log    ${t}
    ${/}

t1
    Open Browser    https://vi-vn.facebook.com/    Chrome
    Sleep    5s
    Input Text    //input[@id='email']    lelan2297@gmail.com
    Input Text    //input[@id='pass']    123456a@
    Click Element    //button[@name='login']
    Comment    Get Title    https://www.facebook.com/ki.dang.9619934/videos/1600538710381928/?idorvanity=568725337287636
    Sleep    50s
    ${t}    Set Variable    ..
    Open Workbook    Data/customer1.xlsx
    FOR    ${i}    IN RANGE    1    110
        ${name}    Get Text    (//h2[text()="Bình luận"]/following-sibling::div[2]/ul/li[${i}]/div//span[@class="x3nfvp2"]//span[@dir="auto"])[1]
        ${gio}    Get Text    (//h2[text()="Bình luận"]/following-sibling::div[2]/ul/li[${i}]//span[@class="x1nxh6w3"]//div[@tabindex="0"])[1]
        ${check}    Run Keyword And Return Status    Wait Until Element Is Visible    (//h2[text()="Bình luận"]/following-sibling::div[2]/ul/li[${i}]//div[@dir="auto"])    10S
        Continue For Loop If    ${check}==False
        ${cmt}    Get Text    (//h2[text()="Bình luận"]/following-sibling::div[2]/ul/li[${i}]//div[@dir="auto"])[1]
        ${line}    Set Variable    ${name}: ${gio}: ${cmt}
        Write To Cell    A${i}    ${name}
        Write To Cell    B${i}    ${gio}_${cmt}
        ${t}    Set Variable    ${t}${line}${\n}
    END
    Log    ${t}
    Save

get data
    Open Browser    https://www.facebook.com/groups/522062882485710    Chrome
    Sleep    5s
    login face
    Sleep    15s
    keo thanh scroll
    Sleep    10s
    login page Get thong tin
    Switch Window    title=(20+) Chung Cư Long Biên - Mua bán cho thuê căn hộ tại Long Biên | Facebook
    Open Workbook    Data/thongtin.xlsx
    FOR    ${i}    IN RANGE    50    100
        ${ten}    ${congviec}    ${id}    Open trang ca nhan    ${i}
        Switch Window    title=Convert UID
        ${sdt}    Thao tac voi page Get thong tin    ${id}
        Switch Window    title=(20+) Chung Cư Long Biên - Mua bán cho thuê căn hộ tại Long Biên | Facebook
        Write To Cell    A${i}    ${ten}
        Write To Cell    B${i}    ${congviec}
        Write To Cell    C${i}    ${sdt}
    END
    Save

test1111
    Open Workbook    Data/thongtin.xlsx
    @{data_sheet}    Read Sheet Data    get_column_names_from_header_row=${TRUE}
    ${length}    Get Length    ${data_sheet}
    ${lisID}=    Create List
    FOR    ${row}    IN RANGE    ${length}
        ${ID}    Get From Dictionary    ${data_sheet}[${row}]    ID
        Append To List    ${lisID}    ${ID}
    END
    Log    ${lisID}

test1111134
    ${t}=    Set Variable    wertyu
    ${l}    Get Length    ${b}
    FOR    ${i}    IN RANGE    0    ${l}
        ${t}    Set Variable    ${t};${b}[${i}]
    END
    log    ${t}
    Comment    Sleep    1s
    Comment    Execute JavaScript    window.scrollTo(1100,1100)
    Comment    Sleep    2s
    Comment    Click Element    (//span[@aria-label='Xem ai đã bày tỏ cảm xúc về tin này'])[1]
    Comment    Sleep    1s
    Comment    Comment    Mouse Over    //div[@aria-label="Đóng"]/parent::div/preceding-sibling::div/ancestor::div[@role="dialog"]//a/div
    Comment    Execute JavaScript    window.scrollTo(3500,3500)
    Comment    ${count}    SeleniumLibrary.Get Element Count    //div[@aria-label="Đóng"]/parent::div/preceding-sibling::div/ancestor::div[@role="dialog"]//a/div    #//span[text()='Thêm bạn bè']
    Comment    Sleep    1s
    Comment    log    ${count}
    Comment    Scroll Element Into View    (//div[@aria-label="Đóng"]/parent::div/preceding-sibling::div/ancestor::div[@role="dialog"]//a/div)[${count}-1]
    Comment    Sleep    10s
    Comment    Scroll Element Into View    (//div[@aria-label="Đóng"]/parent::div/preceding-sibling::div/ancestor::div[@role="dialog"]//a/div)[20]
    Comment    ${count}    SeleniumLibrary.Get Element Count    //div[@aria-label="Đóng"]/parent::div/preceding-sibling::div/ancestor::div[@role="dialog"]//a/div
    Comment    Scroll down my item

id role
    ${options}=    Evaluate    sys.modules['selenium.webdriver.chrome.options'].Options()
    Call Method    ${options}    add_argument    --disable-notifications
    Open Browser    https://vi-vn.facebook.com/    Chrome    options=${options}
    Sleep    3s
    Input Text    //input[@id='email']    lelanautu3@gmail.com
    Input Text    //input[@id='pass']    Lelan2297
    Click Element    //button[@name='login']
    Maximize Browser Window
    Sleep    1s
    Go To    https://www.facebook.com/groups/diendanyoga
    Sleep    3s
    Click Element    //a[contains(text(),'thành viên')]
    Sleep    3s
    keo thanh scroll
    Comment    Execute JavaScript    window.scrollTo(6000,6000)
    Scroll Element Into View    //span[text()='Mới tham gia Nhóm']
    Open Workbook    Data/thongtin.xlsx
    @{data_sheet}    Read Sheet Data    get_column_names_from_header_row=${TRUE}
    ${length}    Get Length    ${data_sheet}
    ${lisID}=    Create List
    FOR    ${row}    IN RANGE    ${length}
        ${ID}    Get From Dictionary    ${data_sheet}[${row}]    ID
        Append To List    ${lisID}    ${ID}
    END
    Log    ${lisID}
    FOR    ${i}    IN RANGE    25    40
        ${length}    Evaluate    ${length}+1
        ${id}    Open trang ca nhan span    ${i}
        ${compe}    Run Keyword And Return Status    Should Contain    ${lisID}    ${id}
        Run Keyword If    ${compe}!=True    Viet Binh Luan Len Trang Ca Nhan    ${length}    ${id}
        ...    ELSE    Close Window
        Switch Window    MAIN
        Execute JavaScript    window.scrollTo(300,300)
    END
    Save

*** Keywords ***
check buton xem trang ca nhan
    Wait Until Element Is Enabled    //span[contains(text(),'Xem trang cá nhân chính')]

click button xem trang ca nhan o ngoai
    ${link}    Get Element Attribute    //a[@aria-label="Xem trang cá nhân chính"]    href
    Click Element    //span[contains(text(),'Xem trang cá nhân chính')]
    [Return]    ${link}

click button xem trang ca nhan o trong
    Click Element    //div[@aria-label="Xem lựa chọn"]
    Sleep    2s
    ${link}    Get Element Attribute    //span[contains(text(),"Xem trang cá nhân chính")]/ancestor::a    href
    Click Element    //span[contains(text(),"Xem trang cá nhân chính")]
    [Return]    ${link}

lay thon tin
    ${b}    Get Text    ((//img[@src='https://static.xx.fbcdn.net/rsrc.php/v3/yp/r/Q9Qu4uLgzdm.png'])[1]/parent::div/following-sibling::div//span)[1]
    [Return]    ${b}

Thao tac voi page Get thong tin
    [Arguments]    ${id}
    Input Text    (//textarea)[1]    ${id}    clear=True
    Click Element    (//button[contains(text(),'Convert')])[1]
    Sleep    5s
    ${sdt}    Get Text    (//textarea)[2]
    [Return]    ${sdt}

login page Get thong tin
    Sleep    2s
    Execute Javascript    window.open('https://id.salemall.vn/login?pay_url=https://fbuid.net/login/loginid')
    Switch Window    NEW
    Sleep    5s
    Input Text    //input[@name="email" and @ required="required"]    lelan2297@gmail.com
    Input Text    //input[@name="password" and @ required="required"]    123456
    Click Element    //button[text()='ĐĂNG NHẬP']
    Sleep    3s
    Double Click Element    //button[@id="convert_uid"]

Open trang ca nhan
    [Arguments]    ${i}
    [Documentation]    sẽ lấy từ người thứ 25
    ${a}    Get Element Attribute    ((//div[@data-visualcompletion="ignore-dynamic"])[${i}]//a)[2]    href
    Execute Javascript    window.open('${a}')
    Switch Window    NEW
    Sleep    2s
    ${kq}    Run Keyword And Return Status    check buton xem trang ca nhan
    ${link}    Run Keyword If    ${kq}    click button xem trang ca nhan o ngoai
    ...    ELSE IF    ${kq}==False    click button xem trang ca nhan o trong
    ${id}    Split String    ${link}    =
    ${id_user}    Set Variable    ${id}[1]
    Sleep    3s
    ${ten}    Get Text    (//h1)[2]
    ${kq1}    Run Keyword And Return Status    Wait Until Element Is Enabled    ((//img[@src='https://static.xx.fbcdn.net/rsrc.php/v3/yp/r/Q9Qu4uLgzdm.png'])[1]/parent::div/following-sibling::div//span)[1]
    Execute JavaScript    window.scrollTo(0,3000)
    ${congviec}    Run Keyword If    ${kq1}    lay thon tin
    Close Window
    [Return]    ${ten}    ${congviec}    ${id_user}

keo thanh scroll
    ${c}    Set Variable    0
    ${d}    Set Variable    3000
    FOR    ${i}    IN RANGE    0    3
        Sleep    1s
        Execute JavaScript    window.scrollTo(${c},${d})
        ${c}    Evaluate    ${c}+3000
        ${d}    Evaluate    ${d}+3000
    END

login face
    Input Text    //input[@name="email"]    lelan2297@gmail.com
    Input Text    //input[@name="pass"]    123456a@
    Click Element    //div[@aria-label="Accessible login button"]

Open trang ca nhan span
    [Arguments]    ${i}
    [Documentation]    sẽ lấy từ người thứ 25
    ${a}    Get Element Attribute    ((//div[@data-visualcompletion="ignore-dynamic"])[${i}]//a)[2]    href
    Execute Javascript    window.open('${a}')
    Switch Window    NEW
    Sleep    2s
    ${kq}    Run Keyword And Return Status    check buton xem trang ca nhan
    ${link}    Run Keyword If    ${kq}    click button xem trang ca nhan o ngoai
    ...    ELSE IF    ${kq}==False    click button xem trang ca nhan o trong
    ${id}    Split String    ${link}    =
    ${id_user}    Set Variable    ${id}[1]
    [Return]    ${id_user}

Viet Binh Luan Len Trang Ca Nhan
    [Arguments]    ${length}    ${id}
    Comment    Close Window
    Sleep    2s
    Execute JavaScript    window.scrollTo(800,1000)
    Sleep    2s
    ${binhLuan}    Run Keyword And Return Status    Wait Until Element Is Visible    (//span[contains(text(),'Bình luận')])[1]
    Run Keyword If    ${binhLuan}==True    Viet Binh Luan    ${length}    ${id}
    ...    ELSE    Close Window

Viet Binh Luan
    [Arguments]    ${length}    ${id}
    Click Element    (//span[contains(text(),'Bình luận')])[1]
    Sleep    2s
    Click Element    (//div[@aria-label="Viết bình luận..."])[1]
    Input Text    (//div[@aria-label="Viết bình luận..."])[1]    Anh/ Chị tham gia vào nhóm này có rất nhiều đồ tập rẻ đẹp ạ: https://www.facebook.com/groups/494240550771045
    Press Keys    (//div[@aria-label="Viết bình luận..."])[1]    ENTER
    Sleep    2s
    Write To Cell    A${length}    ${id}
    Close Window
