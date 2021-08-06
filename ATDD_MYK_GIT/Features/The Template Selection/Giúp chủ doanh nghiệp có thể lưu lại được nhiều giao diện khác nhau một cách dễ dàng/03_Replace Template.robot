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
Kiểm tra thao tác "Replace Template" giao diện trong "My Templates"
    Given Người dùng chọn giao diện "A" là giao diện chưa phát hành trong danh sách "My Templates"
    When Người dùng bấm vào nút "Save As" trên thanh công cụ tại màn hình "Page Builder"
    AND Người dùng thay template B cho template A và lưu lại
    Then Giao diện "B" lưu đè lên giao diện "A" thành công

Kiểm tra thao tác "Replace Template" lên giao diện "Đang phát hành" trong "My Templates"
    Given Người dùng chọn giao diện "A" là giao diện "Đang phát hành" trong "My Templates"
    When Người dùng bấm vào nút "Save" trên thanh công cụ "My Templates" và đồng ý ghi đè
    Then Người dùng không thể lưu đè lên giao diện "Đang phát hành"
