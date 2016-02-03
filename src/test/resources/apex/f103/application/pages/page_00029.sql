prompt --application/pages/page_00029
begin
wwv_flow_api.create_page(
 p_id=>29
,p_user_interface_id=>wwv_flow_api.id(1519898999322209702)
,p_tab_set=>'TS1'
,p_name=>'Order Details'
,p_page_mode=>'MODAL'
,p_step_title=>'&APP_NAME. - Order Details'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_group_id=>wwv_flow_api.id(1679080816211228466)
,p_javascript_code=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
'var htmldb_ch_message=''"OK_TO_GET_NEXT_PREV_PK_VALUE"'';'))
,p_inline_css=>'table.uReport tr td {vertical-align: middle !important; }'
,p_step_template=>wwv_flow_api.id(1259793923434281919)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'820'
,p_dialog_max_width=>'1200'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'No help is available for this page.'
,p_last_upd_yyyymmddhh24miss=>'20150323124542'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(663199891645027755)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1259797707782281943)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(7494609416515135926)
,p_plug_name=>'Order #&P29_ORDER_ID.'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1259803633802281962)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(7494611597851135964)
,p_name=>'Items for Order #&P29_ORDER_ID.'
,p_template=>wwv_flow_api.id(1259803633802281962)
,p_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_display_point=>'BODY'
,p_item_display_point=>'BELOW'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select oi.order_item_id, ',
'       oi.order_id, ',
'       oi.product_id, ',
'       oi.unit_price, ',
'       oi.quantity, ',
'       (oi.unit_price * oi.quantity) extended_price,   ',
'       dbms_lob.getlength(product_image) product_image ,',
'decode(nvl(dbms_lob.getlength(pi.product_image),0),0,null,',
'    ''<img style="border: 4px solid #CCC; -moz-border-radius: 4px; -webkit-border-radius: 4px;" ''||',
'    ''src="''||',
'    apex_util.get_blob_file_src(''P6_PRODUCT_IMAGE'',pi.product_id)||',
'    ''" height="75" width="75" alt="Product Image" title="Product Image" />'')',
'    detail_img',
'from DEMO_ORDER_ITEMS oi, DEMO_PRODUCT_INFO pi ',
'where oi.ORDER_ID = :P29_ORDER_ID ',
'and oi.product_id = pi.product_id (+)',
''))
,p_source_type=>'NATIVE_TABFORM'
,p_ajax_enabled=>'N'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(1259808956189281975)
,p_query_num_rows=>10
,p_query_show_nulls_as=>'(null)'
,p_query_no_data_found=>'There are no items associated with this Order.'
,p_query_num_rows_type=>'ROW_RANGES_IN_SELECT_LIST'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_report_total_text_format=>'&nbsp;'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(7494612812135135983)
,p_query_column_id=>1
,p_column_alias=>'CHECK$01'
,p_column_display_sequence=>1
,p_column_heading=>'&nbsp;'
,p_column_alignment=>'CENTER'
,p_display_as=>'CHECKBOX'
,p_derived_column=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(7494611716194135972)
,p_query_column_id=>2
,p_column_alias=>'ORDER_ITEM_ID'
,p_column_display_sequence=>2
,p_column_heading=>'Item Id'
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_display_as=>'HIDDEN'
,p_lov_show_nulls=>'NO'
,p_column_width=>5
,p_pk_col_source_type=>'T'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
,p_ref_table_name=>'DEMO_ORDER_ITEMS'
,p_ref_column_name=>'ORDER_ITEM_ID'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(7494611814747135972)
,p_query_column_id=>3
,p_column_alias=>'ORDER_ID'
,p_column_display_sequence=>3
,p_column_heading=>'Order Id'
,p_hidden_column=>'Y'
,p_display_as=>'HIDDEN'
,p_column_width=>16
,p_column_default=>'P29_ORDER_ID'
,p_column_default_type=>'ITEM'
,p_ref_schema=>'SAMPLE'
,p_ref_table_name=>'DEMO_ORDER_ITEMS'
,p_ref_column_name=>'ORDER_ID'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(7494611910593135973)
,p_query_column_id=>4
,p_column_alias=>'PRODUCT_ID'
,p_column_display_sequence=>5
,p_column_heading=>'Product Name'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_display_as=>'SELECT_LIST_FROM_LOV'
,p_named_lov=>wwv_flow_api.id(7495957125813916424)
,p_lov_show_nulls=>'NO'
,p_column_width=>16
,p_lov_display_extra=>'YES'
,p_ref_schema=>'SAMPLE'
,p_ref_table_name=>'DEMO_ORDER_ITEMS'
,p_ref_column_name=>'PRODUCT_ID'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(7494612018724135973)
,p_query_column_id=>5
,p_column_alias=>'UNIT_PRICE'
,p_column_display_sequence=>7
,p_column_heading=>'Unit Price'
,p_column_format=>'FML999G999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_lov_show_nulls=>'NO'
,p_column_width=>16
,p_lov_display_extra=>'YES'
,p_ref_schema=>'SAMPLE'
,p_ref_table_name=>'DEMO_ORDER_ITEMS'
,p_ref_column_name=>'UNIT_PRICE'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(7494612102371135973)
,p_query_column_id=>6
,p_column_alias=>'QUANTITY'
,p_column_display_sequence=>6
,p_column_heading=>'Quantity'
,p_disable_sort_column=>'N'
,p_display_as=>'TEXT'
,p_lov_show_nulls=>'NO'
,p_column_width=>5
,p_column_default=>'1'
,p_column_default_type=>'FUNCTION'
,p_lov_display_extra=>'YES'
,p_ref_schema=>'SAMPLE'
,p_ref_table_name=>'DEMO_ORDER_ITEMS'
,p_ref_column_name=>'QUANTITY'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(7496003520567425946)
,p_query_column_id=>7
,p_column_alias=>'EXTENDED_PRICE'
,p_column_display_sequence=>8
,p_column_heading=>'Subtotal'
,p_column_format=>'FML999G999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(7349693027487873443)
,p_query_column_id=>8
,p_column_alias=>'PRODUCT_IMAGE'
,p_column_display_sequence=>9
,p_column_heading=>'Product Image'
,p_column_format=>'IMAGE:DEMO_PRODUCT_INFO:PRODUCT_IMAGE:PRODUCT_ID::MIMETYPE:FILENAME:IMAGE_LAST_UPDATE::attachment:Download'
,p_hidden_column=>'Y'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_lov_show_nulls=>'NO'
,p_pk_col_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select oi.order_item_id, ',
'       oi.order_id, ',
'       oi.product_id, ',
'       oi.unit_price, ',
'       oi.quantity, ',
'       (oi.unit_price * oi.quantity) extended_price,   ',
'       dbms_lob.getlength(product_image) product_image ',
'from DEMO_ORDER_ITEMS oi, DEMO_PRODUCT_INFO pi ',
'where oi.ORDER_ID = :P29_ORDER_ID ',
'and oi.product_id = pi.product_id (+)'))
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(7513984088913751659)
,p_query_column_id=>9
,p_column_alias=>'DETAIL_IMG'
,p_column_display_sequence=>4
,p_display_as=>'WITHOUT_MODIFICATION'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_region_rpt_cols(
 p_id=>wwv_flow_api.id(7494620309980150287)
,p_column_sequence=>1
,p_query_column_name=>'ORDER_ITEM_ID'
,p_display_as=>'TEXT'
);
wwv_flow_api.create_region_rpt_cols(
 p_id=>wwv_flow_api.id(7494620426435150289)
,p_column_sequence=>2
,p_query_column_name=>'ORDER_ID'
,p_display_as=>'TEXT'
);
wwv_flow_api.create_region_rpt_cols(
 p_id=>wwv_flow_api.id(7494620500307150289)
,p_column_sequence=>3
,p_query_column_name=>'PRODUCT_ID'
,p_display_as=>'TEXT'
);
wwv_flow_api.create_region_rpt_cols(
 p_id=>wwv_flow_api.id(7494620600026150289)
,p_column_sequence=>4
,p_query_column_name=>'UNIT_PRICE'
,p_display_as=>'TEXT'
);
wwv_flow_api.create_region_rpt_cols(
 p_id=>wwv_flow_api.id(7494620722601150289)
,p_column_sequence=>5
,p_query_column_name=>'QUANTITY'
,p_display_as=>'TEXT'
);
wwv_flow_api.create_region_rpt_cols(
 p_id=>wwv_flow_api.id(7496003414349425936)
,p_column_sequence=>6
,p_query_column_name=>'EXTENDED_PRICE'
,p_display_as=>'TEXT'
);
wwv_flow_api.create_region_rpt_cols(
 p_id=>wwv_flow_api.id(7349692926645873442)
,p_column_sequence=>7
,p_query_column_name=>'PRODUCT_IMAGE'
,p_display_as=>'TEXT'
);
wwv_flow_api.create_region_rpt_cols(
 p_id=>wwv_flow_api.id(7513984003921751655)
,p_column_sequence=>8
,p_query_column_name=>'DETAIL_IMG'
,p_display_as=>'TEXT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(7626449630330587457)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(7494611597851135964)
,p_button_name=>'APPLY_CHANGES_MRD'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1259817292296282017)
,p_button_image_alt=>'Delete Checked Items'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''APPLY_CHANGES_MRD'');'
,p_button_condition=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select 1',
'from "#OWNER#"."DEMO_ORDER_ITEMS" oi',
'where "ORDER_ID" = :P29_ORDER_ID'))
,p_button_condition_type=>'EXISTS'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(7626449716731587457)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(7494611597851135964)
,p_button_name=>'ADD_CHANGES_ADD'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1259817292296282017)
,p_button_image_alt=>'Add Item to Order'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(7626446839596587405)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(663199891645027755)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1259817292296282017)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P29_ORDER_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(7626446715930587405)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(663199891645027755)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1259817292296282017)
,p_button_image_alt=>'Create'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P29_ORDER_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(1452164305895868587)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(663199891645027755)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1259817292296282017)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(7626446935554587405)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(663199891645027755)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1259817292296282017)
,p_button_image_alt=>'Delete'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_condition=>'P29_ORDER_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(7628099516395821383)
,p_branch_name=>'Go To Page &P11_BRANCH.'
,p_branch_action=>'f?p=&APP_ID.:&P11_BRANCH.:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>30
,p_branch_condition_type=>'NEVER'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(1506519571732645887)
,p_branch_name=>'Go To Page &P29_LAST_PAGE.'
,p_branch_action=>'f?p=&APP_ID.:&P29_LAST_PAGE.:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>40
,p_branch_condition_type=>'REQUEST_IN_CONDITION'
,p_branch_condition=>'SAVE,DELETE,CREATE'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(7626450337688587462)
,p_branch_name=>'Go To Page 29'
,p_branch_action=>'f?p=&APP_ID.:29:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>50
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(967458563807545272)
,p_branch_name=>'Calendar Redirect'
,p_branch_action=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.:RP,11:P11_BRANCH:10'
,p_branch_point=>'BEFORE_HEADER'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>50
,p_branch_condition_type=>'ITEM_IS_NULL'
,p_branch_condition=>'P29_ORDER_ID'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4115792838490855359)
,p_name=>'P29_TAGS'
,p_item_sequence=>45
,p_item_plug_id=>wwv_flow_api.id(7494609416515135926)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tags'
,p_source=>'TAGS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>64
,p_cMaxlength=>4000
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(1259816549476282009)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7333602079034136266)
,p_name=>'P29_LAST_PAGE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(7494609416515135926)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7494609901338135931)
,p_name=>'P29_ORDER_ID'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(7494609416515135926)
,p_use_cache_before_default=>'NO'
,p_source=>'ORDER_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7494610018067135939)
,p_name=>'P29_CUSTOMER_ID'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(7494609416515135926)
,p_use_cache_before_default=>'NO'
,p_source=>'CUSTOMER_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7494610216999135942)
,p_name=>'P29_ORDER_TOTAL'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(7494609416515135926)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Order Total'
,p_format_mask=>'FML999G999G999G999G990D00'
,p_source=>'ORDER_TOTAL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_attributes=>'onchange="htmldb_item_change(this)"'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(1259816549476282009)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7494610305704135942)
,p_name=>'P29_ORDER_TIMESTAMP'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(7494609416515135926)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Order Date'
,p_format_mask=>'DD-MON-YYYY HH:MIPM'
,p_source=>'ORDER_TIMESTAMP'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'fullWidth'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(1259816549476282009)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7494610413781135943)
,p_name=>'P29_USER_NAME'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(7494609416515135926)
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
,p_cHeight=>1
,p_tag_css_classes=>'mnw180'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(1259816549476282009)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'Use to change the Sales Rep associated with this order.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7495992901889382543)
,p_name=>'P29_CUSTOMER_INFO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(7494609416515135926)
,p_prompt=>'Customer Info'
,p_source=>'select apex_escape.html(cust_first_name) || '' '' || apex_escape.html(cust_last_name) || ''<br />'' || apex_escape.html(cust_street_address1) || decode(cust_street_address2, null, null, ''<br />'' || apex_escape.html(cust_street_address2)) || ''</br>'' || ap'
||'ex_escape.html(cust_city) || '', '' || apex_escape.html(cust_state) || ''  '' || apex_escape.html(cust_postal_code) from demo_customers where customer_id = :P29_CUSTOMER_ID'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'RIGHT-TOP'
,p_field_template=>wwv_flow_api.id(1259816549476282009)
,p_item_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(1506519682438645888)
,p_computation_sequence=>10
,p_computation_item=>'P29_LAST_PAGE'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'4'
,p_compute_when=>'P29_LAST_PAGE'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(7736221689142848519)
,p_tabular_form_region_id=>wwv_flow_api.id(7494611597851135964)
,p_validation_name=>'PRODUCT_ID Not Null'
,p_validation_sequence=>10
,p_validation=>'PRODUCT_ID'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#COLUMN_HEADER# must have a value.'
,p_always_execute=>'N'
,p_associated_column=>'PRODUCT_ID'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(7736598991800991248)
,p_tabular_form_region_id=>wwv_flow_api.id(7494611597851135964)
,p_validation_name=>'PRODUCT_ID not already entered'
,p_validation_sequence=>20
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select ''x'' from demo_order_items',
'where order_id = :P29_ORDER_ID',
'and   order_item_id <> NVL(:ORDER_ITEM_ID, -1)',
'and   product_id = :PRODUCT_ID'))
,p_validation_type=>'NOT_EXISTS'
,p_error_message=>'#COLUMN_HEADER# can only be entered once for each order.'
,p_always_execute=>'N'
,p_exec_cond_for_each_row=>'Y'
,p_only_for_changed_rows=>'Y'
,p_associated_column=>'PRODUCT_ID'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(7736194677714845245)
,p_tabular_form_region_id=>wwv_flow_api.id(7494611597851135964)
,p_validation_name=>'QUANTITY Is Not Null (or Zero)'
,p_validation_sequence=>50
,p_validation=>'QUANTITY'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#COLUMN_HEADER# must have a value.'
,p_always_execute=>'N'
,p_exec_cond_for_each_row=>'Y'
,p_only_for_changed_rows=>'Y'
,p_associated_column=>'QUANTITY'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(7736355062092888100)
,p_tabular_form_region_id=>wwv_flow_api.id(7494611597851135964)
,p_validation_name=>'QUANTITY is Numeric'
,p_validation_sequence=>60
,p_validation=>'QUANTITY'
,p_validation_type=>'ITEM_IS_NUMERIC'
,p_error_message=>'#COLUMN_HEADER# must be numeric.'
,p_always_execute=>'N'
,p_associated_column=>'QUANTITY'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(7736252671957853072)
,p_tabular_form_region_id=>wwv_flow_api.id(7494611597851135964)
,p_validation_name=>'QUANTITY is Betwwen 1 and 10'
,p_validation_sequence=>70
,p_validation=>':QUANTITY > 0 and :QUANTITY <= 10'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'#COLUMN_HEADER# must be between 1 and 10.'
,p_always_execute=>'N'
,p_exec_cond_for_each_row=>'Y'
,p_only_for_changed_rows=>'Y'
,p_associated_column=>'QUANTITY'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(1903717012142910285)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(1452164305895868587)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1903717380828910289)
,p_event_id=>wwv_flow_api.id(1903717012142910285)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(7626447722827587422)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from DEMO_ORDERS'
,p_attribute_02=>'DEMO_ORDERS'
,p_attribute_03=>'P29_ORDER_ID'
,p_attribute_04=>'ORDER_ID'
,p_attribute_11=>'I:U:D'
,p_process_error_message=>'Unable to fetch row.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(7626447829621587425)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of DEMO_ORDERS'
,p_attribute_02=>'DEMO_ORDERS'
,p_attribute_03=>'P29_ORDER_ID'
,p_attribute_04=>'ORDER_ID'
,p_attribute_11=>'I:U:D'
,p_process_error_message=>'Unable to process row of table DEMO_ORDERS.'
,p_process_when=>'ADD_CHANGES_ADD'
,p_process_when_type=>'REQUEST_NOT_EQUAL_CONDITION'
,p_process_success_message=>'Action Processed.  '
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(7626449825804587459)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(7494611597851135964)
,p_process_type=>'NATIVE_TABFORM_UPDATE'
,p_process_name=>'ApplyMRU'
,p_attribute_02=>'DEMO_ORDER_ITEMS'
,p_attribute_03=>'ORDER_ITEM_ID'
,p_process_error_message=>'Unable to process update'
,p_process_when_button_id=>wwv_flow_api.id(7626446839596587405)
,p_process_success_message=>'#MRU_COUNT# row(s) updated, #MRI_COUNT# row(s) inserted.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(7626449918342587459)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(7494611597851135964)
,p_process_type=>'NATIVE_TABFORM_DELETE'
,p_process_name=>'ApplyMRD'
,p_attribute_02=>'DEMO_ORDER_ITEMS'
,p_attribute_03=>'ORDER_ITEM_ID'
,p_process_error_message=>'Unable to process delete'
,p_process_when=>'APPLY_CHANGES_MRD,SAVE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_process_success_message=>'#MRD_COUNT# row(s) deleted.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(7626447933796587425)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_process_when_button_id=>wwv_flow_api.id(7626446935554587405)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(7626450224459587462)
,p_process_sequence=>80
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(7494611597851135964)
,p_process_type=>'NATIVE_TABFORM_ADD_ROWS'
,p_process_name=>'AddRows'
,p_attribute_01=>'1'
,p_process_error_message=>'Unable to add rows'
,p_process_when_button_id=>wwv_flow_api.id(7626449716731587457)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(1452164371106868588)
,p_process_sequence=>100
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog on Cancel'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(1452164305895868587)
);
end;
/
