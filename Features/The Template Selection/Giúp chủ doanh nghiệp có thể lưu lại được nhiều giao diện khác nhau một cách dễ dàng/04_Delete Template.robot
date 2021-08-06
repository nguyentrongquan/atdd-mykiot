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
Resource          ../../../Actions/Share/utils.robot
Resource          ../../../Actions/PageBuilder/TopbarMenu.robot
Resource          ../../../Actions/PageBuilder/SidebarMenu.robot
Resource          ../../Locators/PageBuilder/Mytemplate.robot
Resource          ../../Actions/PageBuilder/Mytemplate.robot

*** Test cases ***
Kiểm tra thao tác xoá giao diện đang tùy biến
    Given Gian hàng "Testautomykiot" đăng nhập thành công
    When Người dùng truy cập màn hình Templates
      AND Xóa giao diện đang tùy biến
    Then Không thể xóa giao diện này

Kiểm tra thao tác xóa giao diện chưa phát hành và KHÔNG đang tùy biến
    Given Gian hàng "Testautomykiot" đăng nhập thành công
      AND Người dùng truy cập màn hình Templates
    When Người dùng chọn xóa giao diện chưa phát hành và KHÔNG đang tùy biến
    Then Danh sách "My Template" không còn giao diện vừa xóa
