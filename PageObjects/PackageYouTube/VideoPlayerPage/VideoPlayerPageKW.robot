*** Settings ***
Library  AppiumLibrary
Resource  ../../../Common/CommonKW.robot

*** Keywords ***
Verify Quantity
    [Arguments]     ${locatorFather}    ${locatorSon}       ${number}
    ${quantityBefore}=      Get Text    ${locatorSon}
    ${quantityBeforePlus}=  Evaluate    int(${quantityBefore}) + int(${number})
    Click Element                       ${locatorFather}
    ${quantityAfter}=       Get Text    ${locatorSon}
    Should Be Equal As Integers         ${quantityBefore}   ${quantityAfter}

Click "v" Button
    [Arguments]  ${minimizeLocator}
    TRY
        Click For Element   ${minimizeLocator}
    EXCEPT
        Click Element At Coordinates   100  100
        Sleep  1s
        Click For Element   ${minimizeLocator}
    END

Handle Ads Popup
    [Arguments]  ${xButton}
    TRY
        Wait Until Page Contains Element    ${xButton}   10s
        Click For Element                   ${xButton}
    EXCEPT
        Log To Console  "There are not advertisements so keep going..."
    END