*** Settings ***
Library           SeleniumLibrary
Library           RequestsLibrary
Library           Collections
Library           JSONLibrary
Library           OperatingSystems
Resource          ../../Locators/PageBuilder/TopbarMenu.robot
Resource          ../../Locators/PageBuilder/SidebarMenu.robot
Resource          ../../Actions/Share/Computation.robot
Resource          ../../Actions/Common.robot

*** Keywords  ***
Bấm vào "Thiết lập chung"
    Click To Element    ${general_settings}

Người dùng thay đổi phông chữ của giao diện thành ${font_type}
    Bấm vào "Thiết lập chung"
    Select From List By Value    //select[@class='custom-select']    ${font_type}

Người dùng kiểm tra phông chữ hiện tại của giao diện
    Bấm vào "Thiết lập chung"
    ${current_font}=  Get Value    //*[@id='mk-sidebar']//select[@class='custom-select']
    # ${current_font} =   Get CSS Property Value    //style[@id='global-setting']   font-family
    [return]  ${current_font}
