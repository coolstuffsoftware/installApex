prompt --application/pages/page_00206
begin
wwv_flow_api.create_page(
 p_id=>206
,p_user_interface_id=>wwv_flow_api.id(1671917025726579211)
,p_name=>'Maintain Order'
,p_page_mode=>'NORMAL'
,p_step_title=>'&APP_NAME. - Maintain Order'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_group_id=>wwv_flow_api.id(1679080918635229175)
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'No help is available for this page.'
,p_last_upd_yyyymmddhh24miss=>'20150309170328'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1309816691151725439)
,p_plug_name=>'Order #&P206_ORDER_ID.'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1609472452642416181)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY_3'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1679654001950207239)
,p_plug_name=>'Order Items'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1609472452642416181)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY_3'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select oi.order_item_id,',
'       pi.product_name,',
'       oi.unit_price,',
'       oi.quantity,',
'       to_char((oi.unit_price * oi.quantity), ''FML999G999G999G999G990D00'') extended_price,   ',
'       pi.product_id,',
'       pi.product_image product_image',
'from DEMO_ORDER_ITEMS oi, DEMO_PRODUCT_INFO pi ',
'where oi.ORDER_ID = :P206_ORDER_ID ',
'and oi.product_id = pi.product_id'))
,p_plug_source_type=>'NATIVE_JQM_LIST_VIEW'
,p_ajax_items_to_submit=>'P206_ORDER_ID'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_attribute_01=>'IMAGE:ADVANCED_FORMATTING'
,p_attribute_05=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<h3>&PRODUCT_NAME.</h3>',
'<p>Unit Price $&UNIT_PRICE.</p>'))
,p_attribute_07=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<strong>Total<br/>',
'&EXTENDED_PRICE.</strong>'))
,p_attribute_08=>'QUANTITY'
,p_attribute_09=>'IMAGE_BLOB'
,p_attribute_10=>'PRODUCT_IMAGE'
,p_attribute_11=>'PRODUCT_ID'
,p_attribute_16=>'f?p=&APP_ID.:207:&APP_SESSION.::&DEBUG.:RP,207:P207_ORDER_ITEM_ID:&ORDER_ITEM_ID.'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(1309817108674725441)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(1309816691151725439)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1609474636193416198)
,p_button_image_alt=>'Delete'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P206_ORDER_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(1674127719969340904)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(1309816691151725439)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1609474636193416198)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'LEFT'
,p_button_condition=>'P206_ORDER_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(1674127606090340904)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(1309816691151725439)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1609474636193416198)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'LEFT'
,p_button_condition=>'P206_ORDER_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(1680913706483867179)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(1679654001950207239)
,p_button_name=>'ADD_ITEM'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1609474636193416198)
,p_button_image_alt=>'Add Item'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=&APP_ID.:207:&SESSION.::&DEBUG.:207:P207_ORDER_ID:&P206_ORDER_ID.'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(1309817892190725442)
,p_branch_action=>'f?p=&APP_ID.:205:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1309818111230725442)
,p_name=>'P206_ROWID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(1309816691151725439)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Rowid'
,p_source=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(1609474189129416193)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1309818283086725447)
,p_name=>'P206_ORDER_ID'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(1309816691151725439)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Order Id'
,p_source=>'ORDER_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>64
,p_cMaxlength=>255
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(1609474272253416194)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1309818493119725448)
,p_name=>'P206_CUSTOMER_ID'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(1309816691151725439)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Customer Id'
,p_source=>'CUSTOMER_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>64
,p_cMaxlength=>255
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(1609474272253416194)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1309818684199725448)
,p_name=>'P206_ORDER_TOTAL'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(1309816691151725439)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Order Total - '
,p_source=>'ORDER_TOTAL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cSize=>64
,p_cMaxlength=>255
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(1609474189129416193)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1309818880585725448)
,p_name=>'P206_ORDER_TIMESTAMP'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(1309816691151725439)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Order Date - '
,p_format_mask=>'YYYY-MM-DD'
,p_source=>'ORDER_TIMESTAMP'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cSize=>64
,p_cMaxlength=>255
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(1609474189129416193)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1309819305680725449)
,p_name=>'P206_USER_NAME'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(1309816691151725439)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Sales Rep'
,p_source=>'USER_NAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select distinct user_name d, user_name r from demo_orders ',
'union',
'select upper(:APP_USER) d, upper(:APP_USER) r from dual',
'order by 1'))
,p_cSize=>64
,p_cMaxlength=>100
,p_cHeight=>1
,p_tag_css_classes=>'mnw180'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(1609474189129416193)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1309819505923725449)
,p_name=>'P206_TAGS'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(1309816691151725439)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tags'
,p_source=>'TAGS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>64
,p_cMaxlength=>4000
,p_cHeight=>4
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(1609474189129416193)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1309824883366776786)
,p_name=>'P206_CUSTOMER_INFO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(1309816691151725439)
,p_prompt=>'Customer - '
,p_source=>'select apex_escape.html(cust_first_name) || '' '' || apex_escape.html(cust_last_name) || '' : '' || apex_escape.html(cust_street_address1) || decode(cust_street_address2, null, null, '' '' || apex_escape.html(cust_street_address2)) || '', '' || apex_escape.h'
||'tml(cust_city) || '', '' || apex_escape.html(cust_state) || ''  '' || apex_escape.html(cust_postal_code) from demo_customers where customer_id = :P206_CUSTOMER_ID'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cSize=>64
,p_cMaxlength=>4000
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(1609474189129416193)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(1674129898528340906)
,p_validation_name=>'P206_ORDER_TIMESTAMP must be timestamp'
,p_validation_sequence=>10
,p_validation=>'P206_ORDER_TIMESTAMP'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# must be a valid timestamp.'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(1674129624984340906)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(1309819196458725448)
,p_validation_name=>'P206_ORDER_TIMESTAMP must be timestamp'
,p_validation_sequence=>20
,p_validation=>'P206_ORDER_TIMESTAMP'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# must be a valid timestamp.'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(1309818880585725448)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(1674131211032340908)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from DEMO_ORDERS'
,p_attribute_02=>'DEMO_ORDERS'
,p_attribute_03=>'P206_ROWID'
,p_attribute_04=>'ROWID'
,p_attribute_11=>'I:U:D'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(1309822985311752092)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of DEMO_ORDERS'
,p_attribute_02=>'DEMO_ORDERS'
,p_attribute_03=>'P206_ROWID'
,p_attribute_04=>'ROWID'
,p_attribute_11=>'I:U:D'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Action Processed.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(1309823203665757381)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(1309817108674725441)
);
end;
/
