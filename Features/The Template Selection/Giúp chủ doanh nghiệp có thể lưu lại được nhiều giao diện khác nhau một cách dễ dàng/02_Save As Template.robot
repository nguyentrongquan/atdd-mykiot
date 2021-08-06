*** Settings ***
Suite Setup        Before Test
Suite Teardown     After Test
Library           SeleniumLibrary
Library           RequestsLibrary
Library           Collections
Library           JSONLibrary
Library           OperatingSystem
Resource          ../../../Actions/Common.robot
Resource          ../../../Actions/Share/utils.robot
Resource          ../../../Actions/PageBuilder/TopbarMenu.robot

*** Test cases ***
Kiểm tra tồn tại nút "Save As"
    Given Gian hàng "Testautomykiot" đăng nhập thành công
    When Người dùng truy cập màn hình "Page Builder"
    Then Người dùng thấy được nút "Save As" trên thanh công cụ tại màn hình "Page Builder"

Kiểm tra trạng thái hiển thị "My Templates"
    Given Gian hàng "Testautomykiot" đăng nhập thành công
        And Người dùng truy cập màn hình "Page Builder"
    When Người dùng bấm vào nút "Save As" trên thanh công cụ tại màn hình "Page Builder"
    Then Giao diện "My Templates" được hiển thị dưới dạng Modal

Kiểm tra thao tác "Save As New" giao diện trong "My Templates"
    Given Gian hàng "Testautomykiot" đăng nhập thành công
        And Người dùng truy cập màn hình "Page Builder"
        And Người dùng bấm vào nút "Save As" trên thanh công cụ tại màn hình "Page Builder"
        And Giao diện "My Templates" được hiển thị dưới dạng Modal
    When Người dùng nhập A bấm vào nút "Save" trên modal "My Templates"
    Then Giao diện "A" mới được lưu vào danh sách "My Templates"

Kiểm tra trạng thái nút "Save" khi đã có 3 giao diện trong "My Templates"
    Given Người dùng bấm vào nút "Save As" trên thanh công cụ tại màn hình "Page Builder"
    When Danh sách giao diện trong "My Templates" đã có 3 giao diện được lưu
    Then Người dùng thấy nút "Save" ở trạng thái không hoạt động
