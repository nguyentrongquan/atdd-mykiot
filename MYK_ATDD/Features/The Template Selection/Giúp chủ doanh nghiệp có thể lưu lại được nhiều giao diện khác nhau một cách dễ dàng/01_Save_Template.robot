*** Settings ***
Test Setup        Before Test
Test Teardown     After Test
Library           SeleniumLibrary
Library           RequestsLibrary
Library           Collections
Library           JSONLibrary
Library           OperatingSystem
Resource          ../../../Config/envi.robot
Resource          ../../../Actions/Common.robot
Resource          ../../../Actions/PageBuilder/TopbarMenu.robot
Resource          ../../../Actions/Share/utils.robot

*** Test cases ***
Kiểm tra tồn tại nút "Save"
    Given Gian hàng "Testautomykiot" đăng nhập thành công
    When Người dùng truy cập màn hình "Page Builder"
    Then Người dùng thấy được "Save" Button trên thanh công cụ tại màn hình PageBuilder
