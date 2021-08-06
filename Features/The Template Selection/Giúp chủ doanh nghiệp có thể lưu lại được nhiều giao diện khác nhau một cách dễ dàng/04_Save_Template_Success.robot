# *** Settings ***
# Test Setup        Before Test
# Test Teardown     After Test
# Library           SeleniumLibrary
# Library           RequestsLibrary
# Library           Collections
# Library           JSONLibrary
# Library           OperatingSystem
# Resource          ../../../Config/envi.robot
# Resource          ../../../Actions/Common.robot
# Resource          ../../../Actions/PageBuilder/TopbarMenu.robot
# Resource          ../../../Actions/PageBuilder/SidebarMenu.robot
# Resource          ../../../Actions/Share/utils.robot
#
# *** Test cases ***
# Kiểm tra Save template được tùy biến thành công
#     Given Gian hàng "Testautomykiot" đăng nhập thành công
#     When Người dùng truy cập màn hình "Page Builder"
#     Then Người dùng kiểm tra phông chữ hiện tại của giao diện
#     #   AND Nút "Save" ở trạng thái không hoạt động trên TopbarMenu
#     #   AND Người dùng thay đổi phông chữ của giao diện thành Montserrat
#     # Then Nút "Save" ở trạng thái hoạt động trên TopbarMenu
#     #   AND Người dùng bấm nút Save và phông chữ mới được lưu vào giao diện
#
#
#
# *** Keywords ***
# Người dùng bấm nút Save và phông chữ mới được lưu vào giao diện
#     Click To Element    ${btn_Save_Template}
#     Nút "Save" ở trạng thái không hoạt động trên TopbarMenu
#     Click To Element    ${btn_toggle_template}
#     Mở giao diện Giao diện mặc định
#     Bấm vào "Thiết lập chung"
