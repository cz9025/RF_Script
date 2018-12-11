*** Settings ***
Library           Selenium2Library

*** Variables ***
${baidu}          http://www.baidu.com
${cz}             cz9025

*** Keywords ***
关闭浏览器
    Set Browser Implicit Wait    10
    Close All Browsers

百度搜索
    [Arguments]    ${input}
    Open Browser    ${baidu}    chrome
    Maximize Browser Window
    #默认超时5S
    Set Selenium Timeout    20
    Set Browser Implicit Wait    20
    Input Text    id=kw    ${input}
    Sleep    1
    Click Element    id=su
    Sleep    3
