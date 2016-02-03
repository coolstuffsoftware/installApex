prompt --application/pages/page_00010
begin
wwv_flow_api.create_page(
 p_id=>10
,p_user_interface_id=>wwv_flow_api.id(1519898999322209702)
,p_tab_set=>'TS1'
,p_name=>'Order Calendar'
,p_page_mode=>'NORMAL'
,p_step_title=>'&APP_NAME. - Order Calendar'
,p_step_sub_title=>'Order Calendar'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_group_id=>wwv_flow_api.id(1679080816211228466)
,p_step_template=>wwv_flow_api.id(1259767801430281840)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_navigation_list_position=>'SIDE'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'No help is available for this page.'
,p_last_upd_yyyymmddhh24miss=>'20150310144152'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(638210839393181369)
,p_plug_name=>'Order Calendar'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1259796920908281940)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select order_id,',
'    (   select cust_first_name||'' ''||cust_last_name ',
'        from demo_customers c',
'        where c.customer_id = o.customer_id )',
'        ||'' [''||to_char(order_total,''FML999G999G999G999G990D00'')||'']'' customer,',
'    order_timestamp',
'from demo_orders o'))
,p_plug_source_type=>'NATIVE_CSS_CALENDAR'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'ORDER_TIMESTAMP'
,p_attribute_03=>'CUSTOMER'
,p_attribute_07=>'N'
,p_attribute_09=>'list:navigation'
,p_attribute_13=>'N'
,p_attribute_17=>'Y'
,p_attribute_19=>'Y'
,p_attribute_21=>'10'
,p_attribute_22=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(7776752891163598395)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Apex.Calendar.Drag_Drop.Process.f8950.p10'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'    l_date_value         varchar2(32767) := apex_application.g_x01;',
'    l_primary_key_value  varchar2(32767) := apex_application.g_x02;',
'begin',
'    update "DEMO_ORDERS" set "ORDER_TIMESTAMP" = to_date(l_date_value,''RRRRMMDDHH24MISS'') where "ORDER_ID"= l_primary_key_value;',
'end;'))
);
end;
/
