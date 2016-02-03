prompt --application/pages/page_00005
begin
wwv_flow_api.create_page(
 p_id=>5
,p_user_interface_id=>wwv_flow_api.id(1519898999322209702)
,p_tab_set=>'TS1'
,p_name=>'Sales by Month'
,p_page_mode=>'NORMAL'
,p_step_title=>'&APP_NAME. - Sales by Month'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_group_id=>wwv_flow_api.id(1679080816211228466)
,p_step_template=>wwv_flow_api.id(1259767801430281840)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_navigation_list_position=>'SIDE'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'No help is available for this page.'
,p_last_upd_yyyymmddhh24miss=>'20150617131526'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(676165282736899641)
,p_plug_name=>'Sales by Month (Bar)'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1259803633802281962)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select to_char(o.order_timestamp, ''MON RRRR'') month,',
'    sum (oi.quantity * oi.unit_price) sales,',
'    p.category type',
'from demo_product_info p, demo_order_items oi, demo_orders o',
'where oi.product_id = p.product_id',
'    and o.order_id = oi.order_id',
'group by p.category,',
'    to_char(o.order_timestamp, ''MON RRRR''),',
'    to_char(o.order_timestamp, ''YYYYMM'')',
'order by to_char(o.order_timestamp, ''YYYYMM'')'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.D3.BARCHART'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'MONTH'
,p_attribute_02=>'SALES'
,p_attribute_03=>'Y'
,p_attribute_04=>'TYPE'
,p_attribute_06=>'VERTICAL,STACKED'
,p_attribute_10=>'SERIES:Y'
,p_attribute_12=>'TOP'
,p_attribute_13=>'MODERN2'
,p_attribute_15=>'FRIENDLY'
,p_attribute_16=>'10'
,p_attribute_17=>'10'
,p_attribute_21=>'BARS'
,p_attribute_22=>'Y'
,p_attribute_24=>'N'
,p_attribute_25=>'$,.0f'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1405206661754834100)
,p_plug_name=>'Region Display Selector'
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'Y'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2175139771942135471)
,p_plug_name=>'Sales by Month (Line)'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1259803633802281962)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select trunc(o.order_timestamp) when,',
'    sum (oi.quantity * oi.unit_price) sales,',
'    p.category type',
'from demo_product_info p, demo_order_items oi, demo_orders o',
'where oi.product_id = p.product_id',
'    and o.order_id = oi.order_id',
'group by p.category,',
'    trunc(o.order_timestamp),',
'    to_char(o.order_timestamp, ''YYYYMM'')',
'order by to_char(o.order_timestamp, ''YYYYMM'') '))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.D3.LINE'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'WHEN'
,p_attribute_02=>'SALES'
,p_attribute_03=>'Date'
,p_attribute_04=>'Sales'
,p_attribute_05=>'DATE'
,p_attribute_06=>'%e %b %Y'
,p_attribute_08=>'linear'
,p_attribute_09=>'LINES'
,p_attribute_10=>'$,.0f'
,p_attribute_12=>'WEEK'
,p_attribute_13=>'MODERN2'
,p_attribute_16=>'SERIES:X:Y'
,p_attribute_20=>'OVERLAP'
,p_attribute_21=>'Y'
,p_attribute_23=>'TYPE'
,p_attribute_25=>'TOP'
);
end;
/
