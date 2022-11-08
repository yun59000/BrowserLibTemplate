*** Settings ***
Library           WatchUI    outputs_folder=${IMAGES_STORAGE}/outputs
Library           Browser    auto_closing_level=SUITE    run_on_failure=None
Library           OperatingSystem

#Suite Setup        Remove Directory    ${IMAGES_STORAGE}   recursive=${True}   

*** Variables ***
${IMAGES_STORAGE}    /home/pwuser/images

*** Test Cases ***
firefox - open a Firefox at that URL
    New Browser    firefox
    New Page    https://www.monext.fr

firefox - take screenshots to compare
    Take Screenshot    filename=${IMAGES_STORAGE}/originalff.png
    Reload
    Take Screenshot    filename=${IMAGES_STORAGE}/comparedff.png
    Compare Images    ${IMAGES_STORAGE}/originalff.png    ${IMAGES_STORAGE}/comparedff.png


firefox - check if the web site is up
    Wait For Elements State    id=header-logo    visible
    click    id=burger-menu
    click    "À propos"
    click    "CGA"

firefox - Close browser
    close browser

chrome - open a Chrome at that URL
    New Browser    chromium
    New Page    https://www.monext.fr

chrome - take screenshots to compare
    Take Screenshot    filename=${IMAGES_STORAGE}/originalchrome.png
    Reload
    Take Screenshot    filename=${IMAGES_STORAGE}/comparedchrome.png
    Compare Images    ${IMAGES_STORAGE}/originalchrome.png    ${IMAGES_STORAGE}/comparedchrome.png

chrome - check if the web site is up
    Wait For Elements State    id=header-logo    visible
    click    id=burger-menu
    click    "À propos"
    click    "CGA"

chrome - Close browser
    close browser
