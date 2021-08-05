*** Settings ***
Test Setup        Before Test
Test Teardown     After Test
Resource          ../../../Actions/Common.robot
Resource          ../../../Actions/PageBuilder/SidebarMenu.robot
Resource          ../../../Actions/PageBuilder/Mytemplate.robot
Resource          ../../../Actions/PageBuilder/TopbarMenu.robot
Resource          ../../../Actions/Share/Dictionary.robot
Resource          ../../../Actions/Share/utils.robot
Resource          ../../../Config/envi.robot
Library           SeleniumLibrary
Library           RequestsLibrary
Library           Collections
Library           JSONLibrary
Library           OperatingSystem
Resource          ../../../Locators/PageBuilder/Mytemplate.robot

*** Test Cases ***
Kiểm tra áp dụng giao diện mới thành công khi đang chỉnh sửa giao diện có sẵn
    Given Gian hàng "Testautomykiot" đăng nhập thành công
    And Người dùng truy cập màn hình "Page Builder"
    And Người dùng đang chỉnh sửa giao diện “A” trên màn hình “Page Builder”
    And Người dùng lưu giao diện “A” vào màn hình “My Templates” thành công
    #When Người dùng truy cập màn hình “My Templates”
    #And Hệ thống hiển thị danh sách giao diện có sẵn trong trang “Store Templates”
    #And Người dùng bấm vào nút “Áp dụng” trong giao diện “B”
    #Then Người dùng thay giao diện “B” hiển thị thành công trên màn hình “Page Builder”

Kiểm tra áp dụng giao diện mới thành công khi không chỉnh sửa giao diện có sẵn
    Given Gian hàng "Testautomykiot" đăng nhập thành công
    And Người dùng truy cập màn hình "Page Builder"
    #And \ Người dùng không chỉnh sửa giao diện “A” trên màn hình “Page Builder”
    When Người dùng truy cập màn hình "My Template"
    And Hệ thống hiển thị danh sách giao diện có sẵn trong trang "Store Templates"
    And Người dùng bấm vào nút "Áp dụng" trong giao diện "B"
    Then Người dùng thay giao diện "B" hiển thị thành công trên màn hình "Page Builder"

Kiểm tra áp dụng giao diện mới thành công khi đang chỉnh sửa giao diện có sẵn nhưng không lưu
    Given Gian hàng "Testautomykiot" đăng nhập thành công
    And Người dùng truy cập màn hình "Page Builder"
    And \ Người dùng đang chỉnh sửa giao diện "A" trên màn hình "Page Builder"
    And Người dùng không lưu giao diện "A" vào màn hình "My Templates" thành công
    When Người dùng bấm vào nút "Templates"
    And Hệ thống hiển thị danh sách giao diện có sẵn trong trang "Store Templates"
    And Người dùng bấm vào nút "Áp dụng" trong giao diện "B"
    Then Hệ thống hiển thị yêu cầu xác nhận có lưu những thay đổi của giao diện "A" trước khi áp dụng giao diện "B" hay không
    And Người dùng thay giao diện "B" hiển thị thành công trên màn hình "Page Builder"
