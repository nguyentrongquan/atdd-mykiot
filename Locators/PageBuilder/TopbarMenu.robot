*** Variables ***
${btn_Save_Template}      //*[@id="theme-save-btn"]
${btn_Save_As_Template}      //*[@id="theme-save-as-btn"]
${btn_publish}      //*[@id="theme-publish-btn"]
${btn_toggle_template}  //*[@id="template-btn"]
${txt_active_template}  //*[@id='mk-topbar']//*[@class='mk-topbar-published']//strong

#Màn hình saveas
${modal_my_template}    //*[@id="modal-my-template"]
${modal_my_template_save}   //*[@id='modal-my-template___BV_modal_content_']//*[@id='my-template-save']
${modal_my_template_name_inp}   //*[@id='modal-my-template___BV_modal_content_']//*[@id='template-name']
${modal_save_success}   //*[@id="modal-save-success"]

# modal my list template
${modal_list_template_items}    //*[@id='modal-my-template___BV_modal_content_']//div[@class='mk-template-item']
${modal_unpublished_template_item}  //*[@id='modal-my-template___BV_modal_body_']//div[@class='mk-template-content' and not(strong)]/parent::div
# ${name_unpublished_template_item} //div[@id='modal-my-template___BV_modal_body_']//div[@class='mk-template-content' and not(strong)]//*[@class='mk-template-name']
${modal_published_template_item}  //*[@id='modal-my-template___BV_modal_body_']//strong[@class='mk-template-status']/parent::*/parent::*

${modal_btn_accept}   (//*[@id='modal-confirm-saveas___BV_modal_content_']//button)[2]
${modal_btn_accept_save_success}  //*[@id='modal-save-success']//*[@id='modal-save-success___BV_modal_content_']//*[@id='modal-save-success___BV_modal_footer_']
${modal_template_name_A}   //*[@class='mk-template-name' and contains(text(),'A')]
${modal_confirm_notsaveas}  //*[@id='modal-confirm-notsaveas']
${modal_msg_unable_save_template}   //*[@id='modal-confirm-notsaveas___BV_modal_content_']
