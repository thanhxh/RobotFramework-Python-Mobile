*** Settings ***
Library     AppiumLibrary
Library     String

*** Keywords ***
Get Content Of Video
#    Number Of Index Stand For
#    0 : Name Of Video  "Cúc ơi - Em ở đâu? | Quốc Phòng hát chèo [Official MV]"
#    1 : Time  "6 minutes, 59 seconds"
#    2 : Go To Channel (ignore)
#    3 : Name of channel  "QUỐC PHÒNG CHÈO"
#    4 : Number of views  "1M"
#    5 : Day upload  "11 months ago"
#    6 : play video (ignore)
    [Arguments]     ${locator}      ${attribute}    ${index}
    ${fullContentName}=         Get Element Attribute       ${locator}      ${attribute}
    ${listOfContent}=           Split String From Right     ${fullContentName}  -  6
    ${contentNameWithSpace}=    Set Variable                ${listOfContent}[${index}]
    [Return]        ${contentNameWithSpace.strip()}

Scroll Down To Element
    [Arguments]  ${index}
    ${i}=   Evaluate  1
    WHILE  ${i} < ${index}     limit=10
        Swipe   50  1300  50  500  500
        ${i}=  Evaluate  ${i}+1
    END

Scroll Up To Element
    [Arguments]  ${index}
    ${i}=   Evaluate  1
    WHILE  ${i} < ${index}     limit=10
        Swipe   50  500  50  1300  500
        ${i}=  Evaluate  ${i}+1
    END



