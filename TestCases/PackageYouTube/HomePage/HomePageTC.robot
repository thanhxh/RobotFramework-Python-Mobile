*** Settings ***
Library     AppiumLibrary
Resource    ../../../PageObjects/PackageYouTube/HomePage/HomePageKW.robot
Resource    ../../../Common/CommonKW.robot
Resource    ../../../PageObjects/PackageYouTube/VideoPlayerPage/VideoPlayerPageKW.robot

Variables   ../../../PageObjects/PackageYouTube/LibraryPage/LibraryMainPage/LibraryMainPageUI.py
Variables   ../../../PageObjects/PackageYouTube/LibraryPage/LibraryHistoryPage/LibraryHistoryPageUI.py
Variables   ../../../PageObjects/PackageYouTube/VideoPlayerPage/VideoPlayerPageUI.py
Variables   ../../../PageObjects/PackageYouTube/HomePage/HomePageUI.py
Variables   ../../../PageObjects/PackageYouTube/CommonYouTube/CommonYouTubeUI.py
Variables   ../../../PageObjects/PackageYouTube/SubscriptionsPage/SubscriptionsMainPage/SubscriptionsMainPageUI.py
Variables   ../../../PageObjects/PackageYouTube/SubscriptionsPage/SubscriptionsAllChannelPage/SubscriptionsAllChannelPageUI.py
Variables   ../../../PageObjects/PackageYouTube/AccountPage/AccountMainPage/AccountMainPageUI.py
Variables   ../../../PageObjects/PackageYouTube/AccountPage/AccountSettingsPage/AccountSettingsGeneralPage/AccountSettingsGeneralPageUI.py
Variables   ../../../PageObjects/PackageYouTube/AccountPage/AccountSettingsPage/AccountSettingsMainPage/AccountSettingsMainPageUI.py

#Step 1
Suite Setup         commonKW.Open My Applications    ${appPackageYouTube}   ${appActivityYouTubeHome}
Suite Teardown      commonKW.Close My Applications

*** Test Cases ***
#TC1 - View and verify the Like video feature
#    [Documentation]  View and verify the Like video feature
##Step 2
##    Wait Until Page Is Fully Loaded
#    Wait Until Page Contains Element    ${youtubeLogo}   30s
##    Check Top Menu
#    Page Should Contain Element     ${youtubeLogo}
#    Page Should Contain Element     ${notificationsLogo}
#    Page Should Contain Element     ${searchLogo}
#    Page Should Contain Element     ${accountLogo}
##    Check Bottom Menu
#    Page Should Contain Element     ${homeLogo}
#    Page Should Contain Element     ${shortsLogo}
#    Page Should Contain Element     ${createLogo}
#    Page Should Contain Element     ${subscriptionsLogo}
#    Page Should Contain Element     ${libraryLogo}
##Step 3
##    Get Name Of First Video For Verifying
#    ${nameOfFirstVideo}=            Get Content Of Video   ${firstVideo}     content-desc  0
#    Set Suite Variable              ${nameOfFirstVideo}
##    Get Channel Name Of First Video For Verifying
#    ${channelNameOfFirstVideo}=     Get Content Of Video   ${firstVideo}     content-desc  3
#    Set Suite Variable     ${channelNameOfFirstVideo}
##    Go To First Video
#    Click For Element      ${firstVideo}
##    Handle Ads Popup (1 Ads Only)
#    Handle Ads Popup       ${turnOffAds}
##    Verify Video Name
#    Page Should Contain Element         ${titleOfVideo}
#    Page Should Contain Text            ${nameOfFirstVideo}
##    Verify Button
#    Page Should Contain Element         ${likeButton}
#    Page Should Contain Element         ${dislikeButton}
#    Page Should Contain Element         ${shareButton}
    #There Are Some Video Can't Be Downloaded
    TRY
        Page Should Contain Element     ${createButton}
        Page Should Contain Element     ${downloadButton}
    EXCEPT
        Page Should Contain Element     ${cantDownloadButton}
    END
#    Page Should Contain Element         ${clipButton}
##     Must swipe because this element is not visiable yet
#    Swipe  800  1100  400  1100  50
#    Page Should Contain Element     ${saveButton}
##    Verify Author And Subscribe Button
#    TRY
#        Page Should Contain Element     ${avatar}
#        Page Should Contain Element     ${nameAndSub}
#    EXCEPT
#        Page Should Contain Element     ${subscribedNotifications}
#    END
##Step 4
##   Can't calculate number higher than 998.
#    TRY
#        Verify Quantity     ${likeButton}   ${numberOfLike}     1
#        Verify Quantity     ${likeButton}   ${numberOfLike}     -1
#    EXCEPT
#        Log To Console      Can't calculate number of Likes
#    END
#
#TC2 - View and verify the Subscriptions feature
#    [Documentation]  View and verify the Subscriptions feature
##Step 4
##    Verify Subscribe Button Is Grayed Out.
#    TRY
#        Click For Element               ${nameAndSub}
#        Page Should Contain Element     ${subscribedNotifications}
#    EXCEPT
#        Log To Console  This Channel is subscribed!
#    END
##Step 5
##    Verify UnSubscribe Popup
#    Click For Element               ${unsubscribedLogo}
#    Page Should Contain Element     ${contentNamePopup}
#    Page Should Contain Element     ${cancelButton}
#    Page Should Contain Element     ${unSubscribeButton}
#    Click For Element               ${unSubscribeButton}
##Step 6
##    Verify Subscribe Button Is Red Color
#    Page Should Not Contain Element     ${subscribedNotifications}
##Step 7
##    Click Subscribe Again
#    Click For Element                   ${nameAndSub}
##Step 8
#    Click "v" Button    ${minimizeVideoPlayer}
##Step 9
##    Click Subscriptions From Bottom Menu
#    Click For Element   ${subscriptionsLogo}
##    Check Top Menu
#    Page Should Contain Element     ${youtubeLogo}
#    Page Should Contain Element     ${notificationsLogo}
#    Page Should Contain Element     ${searchLogo}
#    Page Should Contain Element     ${accountLogo}
##    Check Bottom Menu
#    Page Should Contain Element     ${homeLogo}
#    Page Should Contain Element     ${shortsLogo}
#    Page Should Contain Element     ${createLogo}
#    Page Should Contain Element     ${subscriptionsLogo}
#    Page Should Contain Element     ${libraryLogo}
##Step 10
##    Click "All" Button
#    Click For Element               ${allChannelButton}
#    Page Should Contain Element     ${dropdownListChannel}
#    Page Should Contain Element     ${manageButton}
##    Verify the above subscribed Channel is in the list
#    Page Should Contain Text        ${channelNameOfFirstVideo}
#
#TC3 - View and verify feature History and Watch later
#    [Documentation]  View and verify feature History and Watch later
##    Get Back To HomePage
#    Start Activity   com.google.android.youtube     com.google.android.apps.youtube.app.watchwhile.WatchWhileActivity
#    Wait Until Page Contains Element                ${firstVideo}     10s
##Step 3
##    Get Name Of First Video For Verifying
#    ${nameOfFirstVideo}=    Get Content Of Video    ${firstVideo}     content-desc  0
#    Set Suite Variable      ${nameOfFirstVideo}
#    Click For Element       ${firstVideo}
##    Handle Ads Popup (1 Ads Only)
#    Handle Ads Popup    ${turnOffAds}
##Step 4
#    TRY
#        Swipe  800  1100  400  1100  50
#        Click For Element       ${saveButton}
#        Element Text Should Be  ${savedTextButton}    Saved
#    EXCEPT
#        Log To Console  This video has been saved already.
#    END
##Step 5
#    Click "v" Button        ${minimizeVideoPlayer}
##Step 6
##    Verify Button
#    Click For Element               ${libraryLogo}
#    Page Should Contain Element     ${historyButton}
#    Page Should Contain Element     ${watchLaterButton}
#    Page Should Contain Element     ${playlistsButton}
#    Page Should Contain Element     ${likedVideoButton}
##Step 7
#    Click For Element               ${historyButton}
#    TRY
#        Page Should Contain Text        ${nameOfFirstVideo}
#    EXCEPT
#        Log To Console  Maybe go Fail because Ads didn't get closed, and video wouldnt go to History
#    END
##Step 8
#    Click For Element  ${backButton}
#    Page Should Contain Element     ${historyButton}
#    Page Should Contain Element     ${watchLaterButton}
#    Page Should Contain Element     ${playlistsButton}
#    Page Should Contain Element     ${likedVideoButton}
##Step 9
#    Click For Element  ${watchLaterButton}
#    TRY
#        Page Should Contain Text        ${nameOfFirstVideo}
#    EXCEPT
#        Log To Console  Maybe go Fail because Ads didn't get closed, and video wouldnt go to History
#    END
#
#TC4 - Verify the video scrolling feature
#    [Documentation]  Verify the video scrolling feature
##Step 3
#    Start Activity   com.google.android.youtube     com.google.android.apps.youtube.app.watchwhile.WatchWhileActivity
#    Wait Until Page Contains Element                ${firstVideo}     10s
##Step 4
#    Scroll Down To Element  5
#    Click For Element       ${firstVideo}
#    Handle Ads Popup        ${turnOffAds}
#    Click "v" Button        ${minimizeVideoPlayer}
##Step 5
#    Scroll Up To Element  5
#    Click For Element       ${firstVideo}
#    Handle Ads Popup        ${turnOffAds}
#    Click "v" Button        ${minimizeVideoPlayer}

TC5 - View and verify Theme change feature
    [Documentation]  View and verify Theme change feature
    Start Activity   com.google.android.youtube     com.google.android.apps.youtube.app.watchwhile.WatchWhileActivity
    Wait Until Page Contains Element    ${youtubeLogo}   30s
#Step 2
    Click For Element                   ${accountLogo}
#    Verify Account Page's Button
    Page Should Contain Element         ${incognitoModeButton}
    Page Should Contain Element         ${addAccountButton}
    Page Should Contain Element         ${purchasesMembership}
    Page Should Contain Element         ${watchDurationButton}
    Page Should Contain Element         ${yourDataInYouTube}
    Page Should Contain Element         ${settingsButton}
    Page Should Contain Element         ${helpAndFeedback}
    Page Should Contain Element         ${youTubeStudio}
#Step 3
#    Verify Account Settings Page's Button
    Click For Element                   ${settingsButton}
    Page Should Contain Element         ${purchasesMemberPackage}
    Page Should Contain Element         ${generalButton}
    Page Should Contain Element         ${autoplayButton}
    Page Should Contain Element         ${tryNewFeatures}
    Page Should Contain Element         ${videoQualitySelection}
    Page Should Contain Element         ${notifyButton}
    Page Should Contain Element         ${connectedAppsButton}
    Page Should Contain Element         ${watchedVideosAndPrivacy}
    Swipe  800  1100  400  1100  50
    Page Should Contain Element         ${introduceButton}
    Swipe  400  1100  800  1100  50
#Step 4
    Click For Element                   ${generalButton}
    Page Should Contain Element         ${appearanceButton}
    Click For Element                   ${appearanceButton}
#Step 5
    Page Should Contain Element         ${useDeviceTheme}
    Page Should Contain Element         ${lightTheme}
    Page Should Contain Element         ${darkTheme}