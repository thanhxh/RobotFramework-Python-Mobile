*** Settings ***
Library     AppiumLibrary
Variables   CommonUI.py

*** Keywords ***
Open My Applications
    [Arguments]         ${appPackage}       ${appActivity}
    Open Application    ${localHost}                            platformName=${platformName}
...                     platformVersion=${platformVersion}      deviceName=${deviceName}
...                     appPackage=${appPackage}                appActivity=${appActivity}

Close My Applications
    Close All Applications

Click For Element
    [Arguments]     ${locator}
    Click Element   ${locator}
    Sleep  2s