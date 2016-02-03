prompt --application/pages/page_00025
begin
wwv_flow_api.create_page(
 p_id=>25
,p_user_interface_id=>wwv_flow_api.id(1519898999322209702)
,p_name=>'Manage Sample Data'
,p_page_mode=>'NORMAL'
,p_step_title=>'&APP_NAME. - Manage Sample Data'
,p_step_sub_title=>'Manage Sample Data'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(1259767801430281840)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_last_upd_yyyymmddhh24miss=>'20150309170328'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1999325113160753919)
,p_plug_name=>'Manage Sample Data'
,p_region_css_classes=>'t-Alert--accessibleHeading'
,p_region_template_options=>'#DEFAULT#:t-Alert--wizard:t-Alert--defaultIcons:t-Alert--info'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1259795435088281924)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>'<p>This application ships with sample data.  You can remove and recreate sample data using this page.  If the sample data is old recreating the data makes the dates more current.  Removing or adding sample data will not affect any decisions you creat'
||'ed.</p>'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1999325441282753920)
,p_plug_name=>'Button Region'
,p_parent_plug_id=>wwv_flow_api.id(1999325113160753919)
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noUI'
,p_plug_template=>wwv_flow_api.id(1259797707782281943)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(1999326308022753921)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(1999325441282753920)
,p_button_name=>'remove_sample_data'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--primary'
,p_button_template_id=>wwv_flow_api.id(1259817292296282017)
,p_button_image_alt=>'Remove Sample Data'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select null from demo_product_info where product_id <= 10',
'union all',
'select null from demo_customers where customer_id <= 10',
'union all',
'select null from demo_states',
'union all',
'select null from demo_constraint_lookup where constraint_name in (''DEMO_CUST_CREDIT_LIMIT_MAX'',''DEMO_CUSTOMERS_UK'',''DEMO_PRODUCT_INFO_UK'',''DEMO_ORDER_ITEMS_UK'');'))
,p_button_condition_type=>'EXISTS'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(1999325848700753921)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(1999325441282753920)
,p_button_name=>'load_sample_data'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--primary'
,p_button_template_id=>wwv_flow_api.id(1259817292296282017)
,p_button_image_alt=>'Load Sample Data'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select null from demo_product_info where product_id <= 10',
'union all',
'select null from demo_customers where customer_id <= 10',
'union all',
'select null from demo_states',
'union all',
'select null from demo_constraint_lookup where constraint_name in (''DEMO_CUST_CREDIT_LIMIT_MAX'',''DEMO_CUSTOMERS_UK'',''DEMO_PRODUCT_INFO_UK'',''DEMO_ORDER_ITEMS_UK'');'))
,p_button_condition_type=>'NOT_EXISTS'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(1999326719723753921)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(1999325441282753920)
,p_button_name=>'reset_data'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large'
,p_button_template_id=>wwv_flow_api.id(1259817292296282017)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Reset Data'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(1999327107341753922)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(1999325441282753920)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--large'
,p_button_template_id=>wwv_flow_api.id(1259817292296282017)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_button_redirect_url=>'f?p=&APP_ID.:SETTINGS:&SESSION.::&DEBUG.:RP,SETTINGS::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(1999329048972753925)
,p_branch_name=>'Go To Administration'
,p_branch_action=>'f?p=&APP_ID.:SETTINGS:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_comment=>'Created 06-JAN-2012 15:08 by MIKE'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(1999327779683753923)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'reset data'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'sample_data_pkg.delete_data();',
'sample_data_pkg.insert_data();'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(1999326719723753921)
,p_process_success_message=>'Sample data reset.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(1999328189986753924)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'remove sample data'
,p_process_sql_clob=>'sample_data_pkg.delete_data();'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(1999326308022753921)
,p_process_success_message=>'Sample Data Removed'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(1999328528258753924)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Load Sample Data'
,p_process_sql_clob=>'sample_data_pkg.insert_data();'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(1999325848700753921)
,p_process_success_message=>'Sample Data Loaded.'
);
end;
/
