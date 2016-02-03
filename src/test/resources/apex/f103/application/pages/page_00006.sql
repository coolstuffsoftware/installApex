prompt --application/pages/page_00006
begin
wwv_flow_api.create_page(
 p_id=>6
,p_user_interface_id=>wwv_flow_api.id(1519898999322209702)
,p_name=>'Product Details'
,p_page_mode=>'MODAL'
,p_step_title=>'Sample Database Application - Product Details'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_group_id=>wwv_flow_api.id(1679080816211228466)
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_step_template=>wwv_flow_api.id(1259793923434281919)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'530'
,p_dialog_width=>'660'
,p_dialog_max_width=>'1000'
,p_dialog_css_classes=>'position:fixed'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_last_upd_yyyymmddhh24miss=>'20150317155251'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(663199786099027754)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1259797707782281943)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(7646653207997814838)
,p_plug_name=>'Product Details'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1259796920908281940)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(7347499129021246994)
,p_plug_name=>'Product Image'
,p_parent_plug_id=>wwv_flow_api.id(7646653207997814838)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1259803633802281962)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'FUNCTION_BODY'
,p_plug_display_when_condition=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'begin',
'  if :P6_PRODUCT_ID is not null then',
'    for c1 in (select nvl(dbms_lob.getlength(product_image),0) l',
'               from demo_product_info',
'               where product_id = :P6_PRODUCT_ID)',
'    loop',
'      if c1.l > 0 then',
'        return true;',
'      end if;',
'    end loop;',
'  end if;',
'  return false;',
'end;'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(7347547725791738036)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(7347499129021246994)
,p_button_name=>'DELETE_IMAGE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(1259816830774282015)
,p_button_image_alt=>'Remove Image'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'javascript:apex.confirm(''Are you sure you want to delete this image? It will no longer be available for others to see if you continue.'',''DELETE_IMAGE'');'
,p_button_css_classes=>'close iconLeft'
,p_icon_css_classes=>'fa-chevron-right'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(7646653411904814841)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(663199786099027754)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--padRight'
,p_button_template_id=>wwv_flow_api.id(1259817292296282017)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Product'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P6_PRODUCT_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(7646653505208814842)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(663199786099027754)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--padRight'
,p_button_template_id=>wwv_flow_api.id(1259817292296282017)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P6_PRODUCT_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(1452163730925868582)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(663199786099027754)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1259817292296282017)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(7646653605741814842)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(663199786099027754)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1259817292296282017)
,p_button_image_alt=>'Delete'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_condition=>'P6_PRODUCT_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4115792517712849335)
,p_name=>'P6_TAGS'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(7646653207997814838)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tags'
,p_source=>'TAGS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>64
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(1259816549476282009)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4117007723035541872)
,p_name=>'P6_BRANCH'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(7646653207997814838)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7347498606249221532)
,p_name=>'P6_PRODUCT_IMAGE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(7646653207997814838)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Product Image'
,p_source=>'PRODUCT_IMAGE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>64
,p_cMaxlength=>2000
,p_tag_css_classes=>'fullWidth'
,p_field_template=>wwv_flow_api.id(1259816549476282009)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'DB_COLUMN'
,p_attribute_02=>'MIMETYPE'
,p_attribute_03=>'FILENAME'
,p_attribute_05=>'IMAGE_LAST_UPDATE'
,p_attribute_06=>'Y'
,p_attribute_08=>'attachment'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7347498927159237021)
,p_name=>'P6_IMAGE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(7347499129021246994)
,p_source=>'return ''<img src="''||apex_util.get_blob_file_src(''P6_PRODUCT_IMAGE'',:P6_PRODUCT_ID)||''" />'';'
,p_source_type=>'FUNCTION_BODY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_display_when=>'SELECT mimetype from demo_product_info where product_id = :P6_PRODUCT_ID and mimetype like ''image%'''
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(7346983221070358358)
,p_item_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7646653916538814850)
,p_name=>'P6_PRODUCT_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(7646653207997814838)
,p_use_cache_before_default=>'NO'
,p_source=>'PRODUCT_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7646654020054814861)
,p_name=>'P6_PRODUCT_NAME'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(7646653207997814838)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Product Name'
,p_source=>'PRODUCT_NAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>64
,p_cMaxlength=>255
,p_field_template=>wwv_flow_api.id(1259816688735282009)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7646654231960814864)
,p_name=>'P6_PRODUCT_DESCRIPTION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(7646653207997814838)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Product Description'
,p_source=>'PRODUCT_DESCRIPTION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>48
,p_cMaxlength=>2000
,p_cHeight=>4
,p_field_template=>wwv_flow_api.id(1259816549476282009)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7646654303844814864)
,p_name=>'P6_CATEGORY'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(7646653207997814838)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Category'
,p_source=>'CATEGORY'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'CATEGORIES'
,p_lov=>'.'||wwv_flow_api.id(7471808604026344181)||'.'
,p_cHeight=>1
,p_tag_css_classes=>'mnw180'
,p_field_template=>wwv_flow_api.id(1259816688735282009)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7646654523537814864)
,p_name=>'P6_PRODUCT_AVAIL'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(7646653207997814838)
,p_use_cache_before_default=>'NO'
,p_item_default=>'Y'
,p_prompt=>'Product Available'
,p_source=>'PRODUCT_AVAIL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_named_lov=>'Y OR N'
,p_lov=>'.'||wwv_flow_api.id(7471461721988570519)||'.'
,p_field_template=>wwv_flow_api.id(1259816688735282009)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_escape_on_http_output=>'N'
,p_help_text=>'Identify whether or not this product is currently available for orders.'
,p_attribute_01=>'2'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7646654602347814865)
,p_name=>'P6_LIST_PRICE'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(7646653207997814838)
,p_use_cache_before_default=>'NO'
,p_prompt=>'List Price'
,p_source=>'LIST_PRICE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>64
,p_cMaxlength=>255
,p_field_template=>wwv_flow_api.id(1259816688735282009)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'This is the suggested retail price for the item, however, the price can be altered on each order.'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(1903720115533925331)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(1452163730925868582)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1903720517076925331)
,p_event_id=>wwv_flow_api.id(1903720115533925331)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(7646654708962814868)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from DEMO_PRODUCT_INFO'
,p_attribute_02=>'DEMO_PRODUCT_INFO'
,p_attribute_03=>'P6_PRODUCT_ID'
,p_attribute_04=>'PRODUCT_ID'
,p_attribute_11=>'I:U:D'
,p_process_error_message=>'Unable to fetch row.'
,p_process_when=>'DELETE_IMAGE'
,p_process_when_type=>'REQUEST_NOT_EQUAL_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(7347547908045751828)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Delete Image'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'-- empty the image',
'update demo_product_info ',
'set product_image = null,',
'mimetype = null,',
'filename=null,',
'image_last_update=null',
'where product_id = :P6_PRODUCT_ID;'))
,p_process_when_button_id=>wwv_flow_api.id(7347547725791738036)
,p_process_success_message=>'Product image deleted.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(7646654829039814869)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of DEMO_PRODUCT_INFO'
,p_attribute_02=>'DEMO_PRODUCT_INFO'
,p_attribute_03=>'P6_PRODUCT_ID'
,p_attribute_04=>'PRODUCT_ID'
,p_attribute_09=>'P6_PRODUCT_ID'
,p_attribute_11=>'I:U:D'
,p_process_error_message=>'Unable to process row of table DEMO_PRODUCT_INFO.'
,p_process_when=>'DELETE_IMAGE'
,p_process_when_type=>'REQUEST_NOT_EQUAL_CONDITION'
,p_process_success_message=>'Action Processed.  '
,p_return_key_into_item1=>'P6_PRODUCT_ID'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(394890633216446615)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(1452163881057868583)
,p_process_sequence=>50
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog on Cancel'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(1452163730925868582)
);
end;
/
