*** Settings ***
Library           SeleniumLibrary
Library           RequestsLibrary
Library           Collections
Library           JSONLibrary
Library           OperatingSystem
Resource          ../../Locators/PageBuilder/TopbarMenu.robot
Resource          ../../Locators/PageBuilder/Mytemplate.robot
Resource          ../../Locators/PageBuilder/SidebarMenu.robot
Resource          ../../Actions/Share/Computation.robot
Resource          ../../Actions/Common.robot
Resource          ../../Actions/PageBuilder/TopbarMenu.robot

*** Variables ***
${count_element}  0
# ${count_template_A} 0
# ${count_template_B} 0
# ${count_unpublished_template} 0
${unpublished_template_element_name}
${template_name}


*** Keywords ***

# Người dùng nhập "B" thay cho template A và bấm vào nút "Save" trên modal "My Templates"
#     Sleep    3s
#     Click To Element    //*[@id='modal-my-template']//div[@class='mk-template-name' and contains(text(),'A')]
#     Sendkey To Element  ${modal_my_template_name_inp}   B
#     Người dùng bấm vào nút "Save" trên modal "My Templates"
#     Click To Element    ${modal_btn_accept}
#     Sleep    3s

Người dùng thay template B cho template A và lưu lại
    Sleep    3s
    Click To Element    //*[@id='modal-my-template']//div[@class='mk-template-name' and contains(text(),'A')]
    Sendkey To Element  ${modal_my_template_name_inp}   B
    Người dùng bấm vào nút "Save" trên modal "My Templates"
    Click To Element    ${modal_btn_accept}
    Sleep    3s


Giao diện "B" lưu đè lên giao diện "A" thành công
    Element Should Be Visible    ${modal_btn_accept_save_success}

Người dùng chọn giao diện "A" là giao diện "Đang phát hành" trong "My Templates"
    Gian hàng "Testautomykiot" đăng nhập thành công
    Người dùng truy cập màn hình "Page Builder"
    Người dùng bấm vào nút "Save As" trên thanh công cụ tại màn hình "Page Builder"
    Click To Element    ${modal_published_template_item}
    Sendkey To Element  ${modal_my_template_name_inp}   C

Người dùng bấm vào nút "Save" trên thanh công cụ "My Templates" và đồng ý ghi đè
    Click To Element    ${modal_my_template_save}
    Click To Element    ${modal_btn_accept}

Người dùng không thể lưu đè lên giao diện "Đang phát hành"
    Sleep    3s
    Element Should Be Visible    ${modal_confirm_notsaveas}

# Thay đổi tên template về mặc định
#     Gian hàng "Testautomykiot" đăng nhập thành công
#     Người dùng truy cập màn hình "Page Builder"
#     Người dùng bấm vào nút "Save As" trên thanh công cụ tại màn hình "Page Builder"
#     Run Keyword If    ${modal_template_name_AorBorC} >= 1    Click To Element    ${modal_template_name_AorBorC}
#     Người dùng nhập "Giao diện mặc định 12345" và bấm vào nút "Save" trên thanh công cụ "My Templates"

Người dùng bấm vào nút "Save" trên thanh công cụ "My Templates"
    Click To Element    ${btn_Save_Template}


Xóa giao diện đang tùy biến
    ${temp} =  Get Text    ${mytemplate_unpublished_template_name}
    Set Test Variable    ${template_name}    ${temp}
    Mouse Over    ${mytemplate_btn_delete_unpublished_tmpl}
    Click To Element    ${mytemplate_btn_delete_unpublished_tmpl}
    Click To Element    ${mytemplate_btn_cofirm_delete}

Không thể xóa giao diện này
    Log    Giá trị của template name là ${template_name}
    ${temp}   Get Text    ${mytemplate_unpublished_template_name}
    Should Be Equal As Strings    ${temp}    ${template_name}

Người dùng chọn xóa giao diện chưa phát hành và KHÔNG đang tùy biến
    # Đoạn này để đảm bảo Giao diện đang phát hành đang được tùy biến
    ${temp1}   Get Text    ${mytemplate_published_template_name}
    Mở giao diện Giao diện mặc định trong màn hình "My Templates"
    # ${temp2}  Get Text    ${txt_active_template}
    # Should Be Equal As Strings    ${temp1}    ${temp2}
    Click To Element    ${btn_toggle_template}

    # Đến đoạn này mới chọn được giao diện chưa phát hành và không đang tùy biến
    Xóa giao diện B
    Sleep    3s
    Xóa giao diện D
    Sleep    3s

Mở giao diện ${opened_template} trong màn hình "My Templates"
    ${sub_xpath1}=  Set Variable    //div[@class='mk-template-name' and contains(text(),'
    ${sub_xpath2}=  Set Variable    ')]//parent::div//parent::div//a[contains(@id,'open')]
    ${xpath}  Set Variable    ${sub_xpath1}${opened_template}${sub_xpath2}
    Mouse Over    ${xpath}
    Click To Element    ${xpath}
    Sleep    3s



Xóa giao diện ${deleted_template_name}
    ${sub_xpath1}  Set Variable    //div[@class='mk-template-name' and contains(text(),'
    ${sub_xpath2}   Set Variable    ')]//parent::div//parent::div//a[contains(@id,'delete')]
    ${xpath_deleted_template}    Set Variable    ${sub_xpath1}${deleted_template_name}${sub_xpath2}
    Log    xpath template dự định xóa là ${xpath_deleted_template}
    Mouse Over    ${xpath_deleted_template}
    Click To Element    ${xpath_deleted_template}
    Click To Element    ${mytemplate_btn_cofirm_delete}

Danh sách "My Template" không còn giao diện vừa xóa
    ${sub_xpath1}  Set Variable    //div[@class='mk-template-name' and contains(text(),'
    ${sub_xpath2}   Set Variable    ')]//parent::div//parent::div//a[contains(@id,'delete')]
    ${xpath1}    Set Variable    ${sub_xpath1}B${sub_xpath2}
    ${xpath2}   Set Variable    ${sub_xpath1}D${sub_xpath2}
    Log    xpath template vừa xóa là ${xpath1} và ${xpath2}
    Element Should Not Be Visible    ${xpath1}
    Element Should Not Be Visible    ${xpath2}
