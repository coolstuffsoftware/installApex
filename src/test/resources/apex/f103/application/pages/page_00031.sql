prompt --application/pages/page_00031
begin
wwv_flow_api.create_page(
 p_id=>31
,p_user_interface_id=>wwv_flow_api.id(1519898999322209702)
,p_tab_set=>'TS1'
,p_name=>'Sales by State'
,p_page_mode=>'NORMAL'
,p_step_title=>'&APP_NAME. - Sales by State'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
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
,p_last_upd_yyyymmddhh24miss=>'20150320151639'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(638211218196181372)
,p_plug_name=>'Sales by State'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1259803633802281962)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select initcap(s.state_name) label, ',
'    SUM(oi.quantity * oi.unit_price) sales,',
'    null the_link',
'from demo_orders o, demo_order_items oi, demo_customers p, demo_states s',
'where o.order_id = oi.order_id',
'    and o.customer_id = p.customer_id',
'    and p.cust_state = s.st',
'    and (nvl(:P31_PRODUCT_ID,''0'') = ''0'' or :P31_PRODUCT_ID = oi.product_id)',
'group by state_name ',
'order by 3 desc'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.HTML5_BAR_CHART'
,p_ajax_items_to_submit=>'P31_PRODUCT_ID'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'INITIALS'
,p_attribute_02=>'LABEL'
,p_attribute_04=>'SALES'
,p_attribute_11=>'VALUE'
,p_attribute_12=>'$ '
,p_attribute_14=>'15'
,p_attribute_15=>'TEXT'
,p_attribute_16=>'ABSOLUTE'
,p_attribute_17=>'MODERN_2'
,p_attribute_18=>'AROUND'
,p_attribute_20=>'No data found.'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1923902643914293263)
,p_plug_name=>'Filters'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noUI:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_api.id(1259797707782281943)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4117031648128135815)
,p_name=>'P31_PRODUCT_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(1923902643914293263)
,p_prompt=>'Product'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'PRODUCTS'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select product_name d, product_id r from demo_product_info',
'order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Select -'
,p_cHeight=>1
,p_tag_css_classes=>'mnw180'
,p_field_template=>wwv_flow_api.id(1259816549476282009)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SUBMIT'
,p_attribute_03=>'Y'
);
end;
/
