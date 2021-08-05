*** Settings ***
Library           SeleniumLibrary
Library           RequestsLibrary
Library           Collections
Library           JSONLibrary
Library           OperatingSystem
Resource          ../../Locators/PageBuilder/TopbarMenu.robot
Resource          ../../Locators/PageBuilder/SidebarMenu.robot
Resource          ../../Actions/Share/Computation.robot
Resource          ../../Actions/Common.robot
Resource          ../../Actions/PageBuilder/Mytemplate.robot

*** Variables ***
${count_element}    0
${count_template_A} 0    ${EMPTY}
${count_template_B} 0    ${EMPTY}
${count_unpublished_template} 0    ${EMPTY}
${unpublished_template_element_name}    ${EMPTY}
${template_name}    ${EMPTY}

*** Keywords ***
Người dùng thấy được "Save" Button trên thanh công cụ tại màn hình PageBuilder
    Element Should Be Visible    ${btn_Save_Template}

Người dùng thấy được nút "Save As" trên thanh công cụ tại màn hình "Page Builder"
    Element Should Be Visible    ${btn_Save_As_Template}

Người dùng bấm vào nút "Save As" trên thanh công cụ tại màn hình "Page Builder"
    Sleep    3s
    Click To Element    ${btn_Save_As_Template}

Given Người dùng bấm vào nút "Save As" trên thanh công cụ tại màn hình "Page Builder"
    Gian hàng "Testautomykiot" đăng nhập thành công
    Người dùng truy cập màn hình "Page Builder"
    Người dùng bấm vào nút "Save As" trên thanh công cụ tại màn hình "Page Builder"

Giao diện "My Templates" được hiển thị dưới dạng Modal
    Element Should Be Visible    ${modal_my_template}

Người dùng bấm vào nút "Save" trên modal "My Templates"
    Sleep    3s
    Click To Element    ${modal_my_template_save}
    Sleep    3s

Giao diện "A" mới được lưu vào danh sách "My Templates"
    Click To Element    ${btn_toggle_template}
    Element Should Be Visible    ${modal_template_name_A}

Danh sách giao diện trong "My Templates" đã có 3 giao diện được lưu
    ${count_element}    Get Element Count    ${modal_list_template_items}
    Người dùng nhập D bấm vào nút "Save" trên modal "My Templates"
    # Sleep    3s
    # Click To Element    //*[@id='modal-save-success']//*[@id='modal-save-success___BV_modal_header_']//button[@class='close']
    # Sleep    3s
    Click To Element    ${btn_Save_As_Template}
    [Return]    ${count_element}

Người dùng thấy nút "Save" ở trạng thái không hoạt động
    Run Keyword If    ${count_element} == 3    Element Should Be Disabled    ${btn_Save_Template}

Người dùng chọn giao diện "A" là giao diện chưa phát hành trong danh sách "My Templates"
    Gian hàng "Testautomykiot" đăng nhập thành công
    Người dùng truy cập màn hình "My Template"
    Mouse Over    ${mytemplate_btn_open_unpublished_tmpl}
    Click To Element    ${mytemplate_btn_open_unpublished_tmpl}
    Element Should Be Disabled    ${btn_Save_Template}

Người dùng nhập ${input_template_name} bấm vào nút "Save" trên modal "My Templates"
    Sendkey To Element    ${modal_my_template_name_inp}    ${input_template_name}
    Người dùng bấm vào nút "Save" trên modal "My Templates"
    Click To Element    ${modal_btn_accept_save_success}
    Sleep    3s

Nút "Save" ở trạng thái không hoạt động trên TopbarMenu
    Element Should Be Disabled    ${btn_Save_Template}

Nút "Save" ở trạng thái hoạt động trên TopbarMenu
    Element Should Be Enabled    ${btn_Save_Template}

Người dùng đang chỉnh sửa giao diện “A” trên màn hình “Page Builder”
    Click to element    //*[@id='logo']
    click element    //*[@class='fa fa-upload']
    Choose file    //*[@class='fa fa-upload']    logo.png
