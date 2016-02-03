prompt --application/pages/page_00213
begin
wwv_flow_api.create_page(
 p_id=>213
,p_user_interface_id=>wwv_flow_api.id(1671917025726579211)
,p_name=>'Sales by State'
,p_page_mode=>'NORMAL'
,p_step_title=>'&APP_NAME. - Sales by State'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_group_id=>wwv_flow_api.id(1679080918635229175)
,p_step_template=>wwv_flow_api.id(1609467824370416158)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'No help is available for this page.'
,p_last_upd_yyyymmddhh24miss=>'20150320151639'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1597924319992780844)
,p_plug_name=>'Sales by State HTML5'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1609472224655416180)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY_3'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select initcap(s.state_name) label, ',
'       SUM(oi.quantity * oi.unit_price) sales,',
'       null the_link',
'from demo_orders o, demo_order_items oi, demo_customers p, demo_states s',
'where o.order_id = oi.order_id',
'and o.customer_id = p.customer_id',
'and p.cust_state = s.st',
'and (nvl(:P31_PRODUCT_ID,''0'') = ''0'' or :P31_PRODUCT_ID = oi.product_id)',
'group by state_name ',
'order by 3 desc'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.HTML5_BAR_CHART'
,p_plug_query_row_template=>1
,p_attribute_01=>'INITIALS'
,p_attribute_02=>'LABEL'
,p_attribute_03=>'&THE_LINK.'
,p_attribute_04=>'SALES'
,p_attribute_11=>'VALUE'
,p_attribute_14=>'5'
,p_attribute_15=>'TEXT'
,p_attribute_16=>'ABSOLUTE'
,p_attribute_17=>'MODERN'
,p_attribute_18=>'AROUND'
,p_attribute_20=>'No data found.'
);
end;
/
