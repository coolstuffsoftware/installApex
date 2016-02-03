prompt --application/pages/page_00219
begin
wwv_flow_api.create_page(
 p_id=>219
,p_user_interface_id=>wwv_flow_api.id(1671917025726579211)
,p_name=>'Order Calendar'
,p_page_mode=>'NORMAL'
,p_step_title=>'&APP_NAME. - Order Calendar'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'No help is available for this page.'
,p_last_upd_yyyymmddhh24miss=>'20150310144153'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(374135351673124734)
,p_plug_name=>'Order Calendar'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1609472224655416180)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY_3'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select o.rowid,',
'       order_id,',
'       (select cust_first_name||'' ''||cust_last_name ',
'        from demo_customers c',
'        where c.customer_id = o.customer_id)',
'        ||'' [''||to_char(order_total,''FML999G999G999G999G990D00'')||'']'' customer,',
'       order_timestamp',
'from demo_orders o'))
,p_plug_source_type=>'NATIVE_CSS_CALENDAR'
,p_plug_query_row_template=>1
,p_attribute_01=>'ORDER_TIMESTAMP'
,p_attribute_03=>'CUSTOMER'
,p_attribute_04=>'ROWID'
,p_attribute_05=>'f?p=&APP_ID.:206:&APP_SESSION.::NO:206:P206_ROWID:&ROWID.'
,p_attribute_07=>'N'
,p_attribute_09=>'FULL_WIDTH'
,p_attribute_11=>'month:list:navigation:week:day'
,p_attribute_13=>'date'
,p_attribute_22=>'Y'
);
end;
/
