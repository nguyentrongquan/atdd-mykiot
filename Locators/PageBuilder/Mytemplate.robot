*** Variables ***
#Màn hình Template
${mytemplate_btn_delete_unpublished_tmpl}    //div[@class='mk-template-group group-list']//div[@class='mk-template-content' and not(strong)]/parent::div//a[contains(@id,'delete')]
${mytemplate_unpublished_template}  //div[@class='mk-template-group group-list']//div[@class='mk-template-content' and not(strong)]/parent::div
${mytemplate_btn_cofirm_delete}  (//*[@id='modal-confirm-delete___BV_modal_content_']//button)[2]
${mytemplate_btn_open_unpublished_tmpl}    //div[@class='mk-template-group group-list']//div[@class='mk-template-content' and not(strong)]/parent::div//a[contains(@id,'open')]
${mytemplate_unpublished_template_name}   //div[@class='mk-template-group group-list']//div[@class='mk-template-content' and not(strong)]/parent::div//div[@class='mk-template-name']
${mytemplate_btn_open_published_tmpl}   //div[@class='mk-template-group group-list']//div[@class='mk-template-content' and strong]/parent::div//a[contains(@id,'open')]
${mytemplate_published_template_name}    //div[@class='mk-template-group group-list']//div[@class='mk-template-content' and strong]/parent::div//div[@class='mk-template-name']
