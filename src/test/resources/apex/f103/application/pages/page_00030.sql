prompt --application/pages/page_00030
begin
wwv_flow_api.create_page(
 p_id=>30
,p_user_interface_id=>wwv_flow_api.id(1519898999322209702)
,p_tab_set=>'TS1'
,p_name=>'Search Results'
,p_page_mode=>'NORMAL'
,p_step_title=>'&APP_NAME. - Search Results'
,p_step_sub_title=>'Search Results'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_group_id=>wwv_flow_api.id(1679080816211228466)
,p_html_page_header=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<style>',
'ul.sSearchResultsReport span.title span.highlight {',
'  background-color: #FFEA87;',
'  text-decoration: underline',
'  }',
'ul.sSearchResultsReport span.highlight {',
'  background-color: #FFEA87;',
'  }',
'</style>'))
,p_step_template=>wwv_flow_api.id(1259770363268281884)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_last_upd_yyyymmddhh24miss=>'20150316120113'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(638212196758181382)
,p_name=>'Search Results'
,p_template=>wwv_flow_api.id(1259803633802281962)
,p_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#:t-Region--hideHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_display_point=>'BODY'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select',
'    search_title,',
'    apex_util.prepare_url(search_link) search_link,',
'    search_desc,',
'    ''Type'' as label_01,',
'    type as value_01,',
'    null search_date',
'from (',
'    select  1 display_seq,',
'        customer_id id,',
'        ''Customer'' type,',
'        cust_last_name||'', ''||cust_first_name search_title,',
'        cust_street_address1||'' ''||cust_street_address2||'', ''||cust_city||'' ''||cust_state||'' ''||cust_postal_code search_desc,',
'        ''f?p=''||:APP_ID||'':7:''||:APP_SESSION||'':::7:P7_CUSTOMER_ID,P7_BRANCH:''||apex_escape.html(customer_id)||'',30'' search_link',
'    from demo_customers',
'    where ( instr(upper(cust_first_name),upper(:P30_SEARCH)) > 0 ',
'            or instr(upper(cust_last_name),upper(:P30_SEARCH)) > 0 ',
'            or instr(upper(cust_email),upper(:P30_SEARCH)) > 0 ',
'            or instr(upper(cust_street_address1),upper(:P30_SEARCH)) > 0 ',
'            or instr(upper(cust_street_address2),upper(:P30_SEARCH)) > 0 ',
'            or instr(upper(cust_city),upper(:P30_SEARCH)) > 0 ',
'            or instr(upper(cust_state),upper(:P30_SEARCH)) > 0 ',
'            or instr(upper(cust_postal_code),upper(:P30_SEARCH)) > 0 ',
'            or instr(upper(phone_number1),upper(:P30_SEARCH)) > 0 ',
'            or instr(upper(phone_number2),upper(:P30_SEARCH)) > 0 ',
'            or :P30_SEARCH is null )',
'        and instr(:P30_OPTIONS,''C'') > 0',
'    union all',
'    select 2 display_seq,',
'        product_id id,',
'        ''Product'' type,',
'        product_name title,',
'        category||'' $''||list_price||'' ''',
'            ||( case when length(product_description) > 50 then',
'                    substr(product_description,1,50)||''...''',
'                else',
'                    product_description',
'                end ) detail,',
'        ''f?p=''||:APP_ID||'':6:''||:APP_SESSION||'':::6:P6_PRODUCT_ID,P6_BRANCH:''||apex_escape.html(product_id)||'',30'' search_link',
'    from demo_product_info',
'    where ( instr(upper(product_name),upper(:P30_SEARCH)) > 0 ',
'            or instr(upper(product_description),upper(:P30_SEARCH)) > 0 ',
'            or instr(upper(category),upper(:P30_SEARCH)) > 0 ',
'            or instr(upper(list_price),upper(:P30_SEARCH)) > 0 ',
'            or :P30_SEARCH is null )',
'        and instr(:P30_OPTIONS,''P'') > 0',
'    union all',
'    select distinct 3 display_seq,',
'        o.order_id id,',
'        ''Order'' type,',
'        o.order_timestamp||'' $''||o.order_total title,',
'        c.cust_last_name||'', ''||c.cust_first_name detail,',
'        ''f?p=''||:APP_ID||'':29:''||:APP_SESSION||'':SEARCH::29:P29_ORDER_ID,P29_LAST_PAGE:''||apex_escape.html(o.order_id)||'',30'' search_link',
'    from demo_orders o,',
'        demo_customers c,',
'        demo_order_items oi,',
'        demo_product_info p',
'    where o.customer_id = c.customer_id',
'        and o.order_id = oi.order_id',
'        and oi.product_id = p.product_id',
'        and ( instr(upper(o.order_total),upper(:P30_SEARCH)) > 0 ',
'            or instr(upper(o.order_timestamp),upper(:P30_SEARCH)) > 0 ',
'            or instr(upper(o.order_total),upper(:P30_SEARCH)) > 0 ',
'            or instr(upper(c.cust_first_name),upper(:P30_SEARCH)) > 0 ',
'            or instr(upper(c.cust_last_name),upper(:P30_SEARCH)) > 0 ',
'            or instr(upper(p.product_name),upper(:P30_SEARCH)) > 0 ',
'            or instr(upper(p.product_description),upper(:P30_SEARCH)) > 0 ',
'            or instr(upper(p.category),upper(:P30_SEARCH)) > 0 ',
'            or :P30_SEARCH is null )',
'        and instr(:P30_OPTIONS,''O'') > 0',
'    union all',
'    select 4 display_seq,',
'        customer_id id,',
'        ''Customer'' type,',
'        cust_last_name||'', ''||cust_first_name title,',
'        cust_street_address1||'' ''||cust_street_address2||'', ''||cust_city||'' ''||cust_state||'' ''||cust_postal_code detail,',
'        ''f?p=''||:APP_ID||'':7:''||:APP_SESSION||'':::7:P7_CUSTOMER_ID,P7_BRANCH:''||apex_escape.html(customer_id)||'',30'' search_link',
'    from demo_customers',
'    where instr(upper(tags),upper(:P30_SEARCH)) > 0 ',
'        and instr(:P30_OPTIONS,''T'') > 0',
'    union all',
'    select 4 display_seq,',
'        product_id id,',
'        ''Product'' type,',
'        product_name title,',
'        category||'' $''||list_price||'' ''',
'            ||( case when length(product_description) > 50 then',
'                    substr(product_description,1,50)||''...''',
'                else',
'                    product_description',
'                end ) detail,',
'        ''f?p=''||:APP_ID||'':6:''||:APP_SESSION||'':::6:P6_PRODUCT_ID,P6_BRANCH:''||apex_escape.html(product_id)||'',30'' search_link',
'    from demo_product_info',
'    where instr(upper(tags),upper(:P30_SEARCH)) > 0 ',
'        and instr(:P30_OPTIONS,''T'') > 0',
'    union all',
'    select distinct 4 display_seq,',
'        o.order_id id,',
'        ''Order'' type,',
'        o.order_timestamp||'' $''||o.order_total title,',
'        c.cust_last_name||'', ''||c.cust_first_name detail,',
'        ''f?p=''||:APP_ID||'':29:''||:APP_SESSION||'':SEARCH::29:P29_ORDER_ID:''||apex_escape.html(o.order_id) search_link',
'    from demo_orders o,',
'        demo_customers c,',
'        demo_order_items oi,',
'        demo_product_info p',
'    where o.customer_id = c.customer_id',
'        and o.order_id = oi.order_id',
'        and oi.product_id = p.product_id',
'        and instr(upper(o.tags),upper(:P30_SEARCH)) > 0 ',
'        and instr(:P30_OPTIONS,''T'') > 0',
') order by display_seq, search_title'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_ajax_enabled=>'Y'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(1259808739322281974)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_break_cols=>'0'
,p_query_no_data_found=>'No results found.'
,p_query_num_rows_type=>'ROW_RANGES_IN_SELECT_LIST'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(663198282755027739)
,p_query_column_id=>1
,p_column_alias=>'SEARCH_TITLE'
,p_column_display_sequence=>1
,p_column_heading=>'Search title'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(663198476117027741)
,p_query_column_id=>2
,p_column_alias=>'SEARCH_LINK'
,p_column_display_sequence=>2
,p_column_heading=>'Search link'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(663198409008027740)
,p_query_column_id=>3
,p_column_alias=>'SEARCH_DESC'
,p_column_display_sequence=>3
,p_column_heading=>'Search desc'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1453508406097181339)
,p_query_column_id=>4
,p_column_alias=>'LABEL_01'
,p_column_display_sequence=>5
,p_column_heading=>'Label 01'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1453508448309181340)
,p_query_column_id=>5
,p_column_alias=>'VALUE_01'
,p_column_display_sequence=>6
,p_column_heading=>'Value 01'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(663198571301027742)
,p_query_column_id=>6
,p_column_alias=>'SEARCH_DATE'
,p_column_display_sequence=>4
,p_column_heading=>'Search date'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4116640236917341311)
,p_plug_name=>'Search Filters'
,p_region_css_classes=>'t-Form--labelsAbove t-Form--stretchInputs'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1259803633802281962)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4116640447983341311)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(7471144805461572136)
,p_button_name=>'SEARCH'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1259817292296282017)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Search'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4116640633007341311)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(7471144805461572136)
,p_button_name=>'RESET_REPORT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(1259816830774282015)
,p_button_image_alt=>'Reset'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:30:&SESSION.::&DEBUG.:1,30::'
,p_icon_css_classes=>'fa-undo'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(4116642322086341323)
,p_branch_action=>'f?p=&APP_ID.:30:&SESSION.::&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_comment=>'Created 14-DEC-2011 09:16 by SHAKEEB'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4116640838814341311)
,p_name=>'P30_ROWS'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(4116640236917341311)
,p_item_default=>'10'
,p_prompt=>'Rows'
,p_source=>'10'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'ROWS'
,p_lov=>'.'||wwv_flow_api.id(4116642432860341325)||'.'
,p_cSize=>64
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_tag_css_classes=>'mnw180'
,p_label_alignment=>'ABOVE'
,p_field_alignment=>'LEFT-CENTER'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(1259816549476282009)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'REDIRECT_SET_VALUE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4116641032274341312)
,p_name=>'P30_OPTIONS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(4116640236917341311)
,p_item_default=>'C:P:O:T'
,p_prompt=>'Options'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>'STATIC2:Customers;C,Products;P,Orders;O,Tags;T'
,p_cSize=>64
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'ABOVE'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(1259816549476282009)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'1'
,p_attribute_02=>'VERTICAL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4116641245125341312)
,p_name=>'P30_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(4116640236917341311)
,p_prompt=>'Search'
,p_placeholder=>'Search'
,p_source=>'&P1_SEARCH.'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>64
,p_cMaxlength=>4000
,p_tag_css_classes=>'t-Form-searchField'
,p_field_template=>wwv_flow_api.id(1259816475318282004)
,p_item_template_options=>'#DEFAULT#'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(842649114914539644)
,p_name=>'Refresh Search Results after modifying an order'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(638212196758181382)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(842649350399539662)
,p_event_id=>wwv_flow_api.id(842649114914539644)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
end;
/
