*** Keywords ***
环境配置
    [Arguments]    ${env}=auto
    &{AUTO}    Create Dictionary    url=http://lopal.shanghu.customstest.snsshop.net/    name=20160905    password=123456
    &{AMH}    Create Dictionary    url=http://anmeihong.shanghu.customstest.snsshop.net/    name=20160905    password=123456
    &{DICT_LIST}    Create Dictionary    auto=&{AMH}    loapl=&{AUTO}
    [Return]    &{DICT_LIST.${env}}

等待时间
    [Arguments]    ${time}=3s
    Sleep    ${time}
