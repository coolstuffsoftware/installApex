prompt --application/pages/page_00027
begin
wwv_flow_api.create_page(
 p_id=>27
,p_user_interface_id=>wwv_flow_api.id(1519898999322209702)
,p_tab_set=>'TS1'
,p_name=>'Sales by Product'
,p_page_mode=>'NORMAL'
,p_step_title=>'&APP_NAME. - Sales by Product'
,p_step_sub_title=>'Sales by Product'
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
,p_last_upd_yyyymmddhh24miss=>'20150325120138'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(638211108355181371)
,p_plug_name=>'Sales by Product'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1259803633802281962)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select ''f?p=&APP_ID.:6:''||:app_session||'':::6:P6_PRODUCT_ID,P6_BRANCH:''||p.product_id||'',27:'' link, ',
'    p.product_name||'' [$''||p.list_price||'']'' product,',
'    SUM(oi.quantity * oi.unit_price) sales,',
'    decode(nvl(dbms_lob.getlength(p.product_image),0),0,null,',
'        apex_util.get_blob_file_src(''P6_PRODUCT_IMAGE'',p.product_id)) product_image',
'from demo_order_items oi,',
'    demo_product_info p',
'where oi.product_id = p.product_id',
'group by p.product_id, p.product_name, p.list_price,',
'    decode(nvl(dbms_lob.getlength(p.product_image),0),0,null,',
'        apex_util.get_blob_file_src(''P6_PRODUCT_IMAGE'',p.product_id))',
'order by 3 desc, 1'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.HTML5_BAR_CHART'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'IMAGE'
,p_attribute_02=>'PRODUCT'
,p_attribute_03=>'&LINK.'
,p_attribute_04=>'SALES'
,p_attribute_05=>'&LINK.'
,p_attribute_07=>'&PRODUCT_IMAGE.'
,p_attribute_11=>'VALUE'
,p_attribute_14=>'15'
,p_attribute_15=>'ICON'
,p_attribute_16=>'ABSOLUTE'
,p_attribute_17=>'MODERN_2'
,p_attribute_18=>'AROUND'
,p_attribute_20=>'No data found.'
);
end;
/
