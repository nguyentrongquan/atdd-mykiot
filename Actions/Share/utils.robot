*** Settings ***
Library           SeleniumLibrary
Library           OperatingSystem


*** Keywords ***
Before Test
    init test env     prelivenew

After Test
    Close All Browsers
