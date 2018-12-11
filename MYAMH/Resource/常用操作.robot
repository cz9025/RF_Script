*** Settings ***
Library           Selenium2Library
Resource          配置参数.robot
Library           Screenshot
Library           String

*** Keywords ***
登录
    ${api}    环境配置    auto
    ${url}    Set Variable
    Set Selenium Timeout    20
    Open Browser    ${api.url}    chrome
    页面最大化
    Set Browser Implicit Wait    20
    Input Text    id=staff_id    ${api.name}
    Input Text    id=password    ${api.password}
    Input Text    id=captcha    111111    #输入验证码
    Click Button    id=login    #点击登录
    等待时间    5

页面最大化
    Maximize Browser Window

关闭浏览器
    Sleep    3
    Close All Browsers

失败重启
    Run Keyword If Test Failed    Take Screenshot
    Sleep    2
    #Run Keyword If Test Failed    登录
    Sleep    3

点击菜单链接
    [Arguments]    ${links}
    Set Browser Implicit Wait    20
    Click Link    ${links}
    Set Browser Implicit Wait    20

随机字符
    [Arguments]    ${pre}=None    ${len}=10
    ${prelen}    Get Length    ${pre}
    ${randlen}    Evaluate    ${len}-${prelen}
    ${rand}    Generate Random String    ${randlen}
    ${randstr}    Set Variable    ${pre}${rand}
    [Return]    ${randstr}

弹框校验
    [Arguments]    ${msg}=成功
    Sleep    3
    ${alert}    Get Alert Message
    Should Contain    ${alert}    ${msg}
    Sleep    3

确定
    [Arguments]    ${action}=确定
    Click Element    //button[@data-id="ok" and text()="${action}"]
    Sleep    1.5

列表是否有数据
    [Arguments]    ${local}=//*[@id="main-container"]/div[1]/div[2]/div[2]/div/div/div[3]/table/tbody/tr
    ${count}    Get Matching Xpath Count    ${local}
    ${sum}    Evaluate    ${count}-1
    Pass Execution If    ${sum}==0    没有数据
