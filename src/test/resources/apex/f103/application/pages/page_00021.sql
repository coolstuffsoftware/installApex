prompt --application/pages/page_00021
begin
wwv_flow_api.create_page(
 p_id=>21
,p_user_interface_id=>wwv_flow_api.id(1519898999322209702)
,p_tab_set=>'TS1'
,p_name=>'Data Load Source'
,p_page_mode=>'NORMAL'
,p_step_title=>'&APP_NAME. - Data Load Source'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_javascript_code=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'function set_item()',
'{',
'$s(''P21_IMPORT_FROM'', ''PASTE'');',
'$s(''P21_SEPARATOR'','','');',
'$s(''P21_FIRST_ROW'', ''Y'');',
'$(''#P21_COPY_PASTE'').val($(''#P21_SAMPLE_DATA'').val());',
'}'))
,p_inline_css=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'pre#sampledata {',
'    font-size: 10px;',
'    color: #707070;',
'}'))
,p_step_template=>wwv_flow_api.id(1259767801430281840)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'No help is available for this page.'
,p_last_upd_yyyymmddhh24miss=>'20150323121602'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(934505172638659113)
,p_plug_name=>'Sample Data'
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1259800301689281954)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>Choose the <strong>Import From</strong> of "Copy and Paste", input <strong>Separator</strong> as "," and ensure the <strong>First Row has Column Names</strong> is checked.</p>',
'<p>Click the <strong>Insert Sample Data</strong> button to automatically load the sample data or select the text below and paste it into the <strong>Copy and Paste Delimited Data</strong> section. </p>',
'<pre id="sampledata">',
'First Name,Last Name,Street Address,City,State,Postal Code,Email,Phone Number,Alternate Number,Credit Limit,Tags',
'John,Dulles,5987 Whitehart Lane,Chicago,Illinois,60606,john.dulles@mailman.com,312-666-5987,720-666-1234,4000,New Address',
'Peter,Williams,1212 Technology Way,Denver,Colorado,80227,,303-555-6688,,1500,',
'Susan,Peters,9000 Reston Parkway,Reston,Virginia,20191,susan.peters@email.com,703-999-5467,703-123-9876,2500,',
'Albert,Lambert,2468 Longmire Place,St. Louis,Missouri,63149,,314-000-1000,,3300,New Address',
'Bob,Uncle,888 Mason St,San Francisco,California,94110,bob.uncle@mail.com,,,2200',
'</pre>'))
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(940344054281522459)
,p_plug_name=>'No Data'
,p_component_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--colorBG" id="t_Alert_Notification">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">Error Message</h2>',
'        </div>',
'        <div class="t-Alert-body">',
'          1 error has occurred<ul class="htmldbUlErr"><li>Copy and Paste Delimited Data must have some value. (<a href="javascript:apex.item(''P21_COPY_PASTE'').setFocus();void(0);">Go to error</a>)</li></ul>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noLabel t-Button--icon t-Button--iconOnly" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="Close"><span class="t-Icon fa-times"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_plug_display_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_plug_display_when_condition=>'BACK'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1685938219778210326)
,p_plug_name=>'Globalization'
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1259800301689281954)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1685962396933219756)
,p_plug_name=>'Upload Data'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1259806206185281965)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(1685932196802210309)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(1259815938281282002)
,p_plug_query_row_template=>1
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1685934312251210317)
,p_plug_name=>'Data Load Source'
,p_parent_plug_id=>wwv_flow_api.id(1685962396933219756)
,p_region_css_classes=>'t-Form--large'
,p_region_template_options=>'#DEFAULT#:t-Region--hideHeader:t-Region--noBorder:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1259803633802281962)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(1685934704694210319)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(1685962396933219756)
,p_button_name=>'NEXT'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(1259816830774282015)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Next'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_redirect_url=>'javascript:apex.widget.textareaClob.upload(''P21_COPY_PASTE'', ''NEXT'');'
,p_icon_css_classes=>'fa-chevron-right'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(934586257475910264)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(934505172638659113)
,p_button_name=>'PASTE_SAMPLE_DATA'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(1259816830774282015)
,p_button_image_alt=>'Insert Sample Data'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_css_classes=>'gear uAltButton iconLeft'
,p_icon_css_classes=>'fa-chevron-right'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(1685934606020210319)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(1685962396933219756)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--large'
,p_button_template_id=>wwv_flow_api.id(1259817292296282017)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_button_redirect_url=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(1685941425117210331)
,p_branch_action=>'f?p=&APP_ID.:22:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(1685934704694210319)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(934549173063703154)
,p_name=>'P21_SAMPLE_DATA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(934505172638659113)
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'First Name,Last Name,Street Address,City,State,Postal Code,Email,Phone Number,Alternate Number,Credit Limit,Tags',
'John,Dulles,5987 Whitehart Lane,Chicago,Illinois,60606,john.dulles@mailman.com,312-666-5987,720-666-1234,4000,New Address',
'Peter,Williams,1212 Technology Way,Denver,Colorado,80227,,303-555-6688,,1500,',
'Susan,Peters,9000 Reston Parkway,Reston,Virginia,20191,susan.peters@email.com,703-999-5467,703-123-9876,2500,',
'Albert,Lambert,2468 Longmire Place,St. Louis,Missouri,63149,,314-000-1000,,3300,New Address',
'Bob,Uncle,888 Mason St,San Francisco,California,94110,bob.uncle@mail.com,,,2200'))
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1685935016716210321)
,p_name=>'P21_IMPORT_FROM'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(1685934312251210317)
,p_item_default=>'PASTE'
,p_prompt=>'Import From'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_named_lov=>'DATA_LOAD_OPTION'
,p_lov=>'.'||wwv_flow_api.id(7655882488395731804)||'.'
,p_label_alignment=>'RIGHT-TOP'
,p_field_template=>wwv_flow_api.id(1259816688735282009)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_escape_on_http_input=>'Y'
,p_attribute_01=>'1'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1685935117275210322)
,p_name=>'P21_FILE_NAME'
,p_item_sequence=>65
,p_item_plug_id=>wwv_flow_api.id(1685934312251210317)
,p_prompt=>'File Name'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>64
,p_cMaxlength=>2000
,p_field_template=>wwv_flow_api.id(1259816688735282009)
,p_item_template_options=>'#DEFAULT#'
,p_escape_on_http_input=>'Y'
,p_help_text=>'Name of the file to upload'
,p_attribute_01=>'APEX_APPLICATION_TEMP_FILES'
,p_attribute_09=>'SESSION'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1685935903779210323)
,p_name=>'P21_SEPARATOR'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(1685934312251210317)
,p_item_default=>'\t'
,p_prompt=>'Separator'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>2
,p_cMaxlength=>2
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(1259816549476282009)
,p_item_template_options=>'#DEFAULT#'
,p_escape_on_http_input=>'Y'
,p_help_text=>'Identify a column separator character. Use <code>\t</code> for tab separators.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1685936395050210325)
,p_name=>'P21_ENCLOSED_BY'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(1685934312251210317)
,p_item_default=>'"'
,p_prompt=>'Optionally Enclosed By'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>2
,p_cMaxlength=>2
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(1259816549476282009)
,p_item_template_options=>'#DEFAULT#'
,p_escape_on_http_input=>'Y'
,p_help_text=>'Enter a delimiter character. You can use this character to delineate the starting and ending boundary of a data value. If you specify a delimiter character, Data Workshop ignores whitespace occurring before the starting and ending boundary of a data '
||'value. You can also use this option to enclose a data value with the specified delimiter character.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1685936914459210325)
,p_name=>'P21_FIRST_ROW'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(1685934312251210317)
,p_item_default=>'Y'
,p_prompt=>'First Row has Column Names'
,p_display_as=>'NATIVE_CHECKBOX'
,p_named_lov=>'FIRST_ROW_OPTION'
,p_lov=>'.'||wwv_flow_api.id(7655884994340731819)||'.'
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(1259816549476282009)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_escape_on_http_input=>'Y'
,p_attribute_01=>'1'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1685937409156210326)
,p_name=>'P21_CHAR_SET'
,p_is_required=>true
,p_item_sequence=>55
,p_item_plug_id=>wwv_flow_api.id(1685934312251210317)
,p_item_default=>'UTF-8'
,p_prompt=>'File Character Set'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'DATA_LOAD_CHARSET'
,p_lov=>'.'||wwv_flow_api.id(1671882016685532000)||'.'
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_tag_css_classes=>'mnw180'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(1259816549476282009)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_escape_on_http_input=>'Y'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1685938010792210326)
,p_name=>'P21_COPY_PASTE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(1685934312251210317)
,p_prompt=>'Copy and Paste'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>80
,p_cHeight=>10
,p_field_template=>wwv_flow_api.id(1259816688735282009)
,p_item_template_options=>'#DEFAULT#'
,p_escape_on_http_input=>'Y'
,p_help_text=>'Copy and paste delimited data here.'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1685938521568210327)
,p_name=>'P21_CURRENCY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(1685938219778210326)
,p_item_default=>'$'
,p_prompt=>'Currency Symbol'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select value',
'  from nls_session_parameters',
' where parameter = ''NLS_CURRENCY'''))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>2
,p_cMaxlength=>2
,p_field_template=>wwv_flow_api.id(1259816549476282009)
,p_item_template_options=>'#DEFAULT#'
,p_escape_on_http_input=>'Y'
,p_help_text=>'If your data contains international currency symbol, enter it here. For example, if your data has "&euro;1,234.56" or "&yen;1,234.56", enter "&euro;" or "&yen;".  Otherwise the data will not load correctly.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1685939015349210327)
,p_name=>'P21_GROUP_SEPARATOR'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(1685938219778210326)
,p_prompt=>'Group Separator'
,p_source=>'apex_application.get_nls_group_separator'
,p_source_type=>'FUNCTION'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>2
,p_cMaxlength=>2
,p_field_template=>wwv_flow_api.id(1259816549476282009)
,p_item_template_options=>'#DEFAULT#'
,p_escape_on_http_input=>'Y'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>A group separator is a character that separates integer groups, for example to show thousands and millions.</p>',
'<p>Any character can be the group separator. The character specified must be single-byte, and the group separator must be different from any other decimal character. The character can be a space, but cannot be a numeric character or any of the follow'
||'ing:</p>',
'<ul class="noIndent">',
'<li>plus (+)</li>',
'<li>hyphen (-)</li> ',
'<li>less than sign (<)</li>',
'<li>greater than sign (>)</li> ',
'</ul>'))
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1685939496774210328)
,p_name=>'P21_DECIMAL_CHARACTER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(1685938219778210326)
,p_prompt=>'Decimal Character'
,p_source=>'apex_application.get_nls_decimal_separator'
,p_source_type=>'FUNCTION'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>2
,p_cMaxlength=>2
,p_field_template=>wwv_flow_api.id(1259816549476282009)
,p_item_template_options=>'#DEFAULT#'
,p_escape_on_http_input=>'Y'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>The decimal character separates the integer and decimal parts of a number.</p>',
'<p> Any character can be the decimal character. The character specified must be single-byte, and the decimal character must be different from group separator. The character can be a space, but cannot be any numeric character or any of the following c'
||'haracters:</p>',
'<ul class="noIndent">',
'<li>plus (+)</li>',
'<li>hyphen (-)</li> ',
'<li>less than sign (<)</li>',
'<li>greater than sign (>)</li> ',
'</ul>'))
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(1685935696987210323)
,p_validation_name=>'Filename is not null'
,p_validation_sequence=>10
,p_validation=>'P21_FILE_NAME'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL# must have some value.'
,p_always_execute=>'N'
,p_validation_condition=>'P21_IMPORT_FROM'
,p_validation_condition2=>'UPLOAD'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_api.id(1685934704694210319)
,p_associated_item=>wwv_flow_api.id(1685935117275210322)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(663198668032027743)
,p_validation_name=>'Copy/Paste is not null'
,p_validation_sequence=>20
,p_validation=>'P21_COPY_PASTE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL# must have some value.'
,p_always_execute=>'N'
,p_validation_condition_type=>'NEVER'
,p_when_button_pressed=>wwv_flow_api.id(1685934704694210319)
,p_associated_item=>wwv_flow_api.id(1685938010792210326)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(1685939924434210328)
,p_name=>'Hide / Show Copy and Paste or Filename'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P21_IMPORT_FROM'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'PASTE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1685940196969210329)
,p_event_id=>wwv_flow_api.id(1685939924434210328)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P21_COPY_PASTE'
,p_attribute_01=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1307959981525795991)
,p_event_id=>wwv_flow_api.id(1685939924434210328)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P21_FILE_NAME'
,p_attribute_01=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1685940410850210329)
,p_event_id=>wwv_flow_api.id(1685939924434210328)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P21_COPY_PASTE'
,p_attribute_01=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1307960310196797951)
,p_event_id=>wwv_flow_api.id(1685939924434210328)
,p_event_result=>'FALSE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P21_FILE_NAME'
,p_attribute_01=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(934586677907916150)
,p_name=>'Paste Sample Data'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(934586257475910264)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(934586979369916152)
,p_event_id=>wwv_flow_api.id(934586677907916150)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'set_item();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(1685941213135210331)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PARSE_UPLOADED_DATA'
,p_process_name=>'Parse Uploaded Data'
,p_attribute_01=>wwv_flow_api.id(934437157345550625)
,p_attribute_02=>'P21_IMPORT_FROM'
,p_attribute_03=>'P21_SEPARATOR'
,p_attribute_04=>'P21_ENCLOSED_BY'
,p_attribute_05=>'P21_FIRST_ROW'
,p_attribute_06=>'P21_CURRENCY'
,p_attribute_07=>'P21_GROUP_SEPARATOR'
,p_attribute_08=>'P21_DECIMAL_CHARACTER'
,p_attribute_09=>'P21_FILE_NAME'
,p_attribute_10=>'P21_COPY_PASTE'
,p_attribute_11=>'P21_CHAR_SET'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(1685934704694210319)
);
end;
/
