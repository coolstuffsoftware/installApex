prompt --application/pages/page_00016
begin
wwv_flow_api.create_page(
 p_id=>16
,p_user_interface_id=>wwv_flow_api.id(1519898999322209702)
,p_tab_set=>'TS1'
,p_name=>'Sales by Category'
,p_page_mode=>'NORMAL'
,p_step_title=>'&APP_NAME. - Sales by Category'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_group_id=>wwv_flow_api.id(1679080816211228466)
,p_step_template=>wwv_flow_api.id(1259767801430281840)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_last_upd_yyyymmddhh24miss=>'20150320151539'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(676165140249899640)
,p_plug_name=>'Sales by Category'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1259796920908281940)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select null, p.category label, sum(o.order_total) total_sales',
'from demo_orders o, demo_order_items oi, demo_product_info p',
'where o.order_id = oi.order_id',
'    and oi.product_id = p.product_id',
'group by category order by 3 desc'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.FLOT.PIE'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'LABEL'
,p_attribute_02=>'TOTAL_SALES'
,p_attribute_05=>'DONUT'
,p_attribute_08=>'LABEL:VALUE'
,p_attribute_09=>'N'
,p_attribute_10=>'10'
,p_attribute_11=>'Other'
,p_attribute_14=>'50'
,p_attribute_15=>'MODERN2'
,p_attribute_17=>'240'
);
end;
/
