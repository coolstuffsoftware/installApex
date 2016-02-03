prompt --application/pages/page_00200
begin
wwv_flow_api.create_page(
 p_id=>200
,p_user_interface_id=>wwv_flow_api.id(1671917025726579211)
,p_name=>'Mobile Home Page'
,p_alias=>'HOME_JQM_SMARTPHONE'
,p_page_mode=>'NORMAL'
,p_step_title=>'&APP_NAME.'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_group_id=>wwv_flow_api.id(1679080918635229175)
,p_inline_css=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#navgroup {text-align:center;}',
'#navgroup div {display:inline-block;}'))
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
,p_last_upd_yyyymmddhh24miss=>'20150309170328'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1664967766326399688)
,p_plug_name=>'Dashboard'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1609472224655416180)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select',
'    ''Monthly Sales'' as label,',
'    nvl(sum(o.order_total),0) as value,',
'    ''f?p=''||:APP_ID||'':255:''||:APP_SESSION||'':::255'' as url',
'from demo_orders o',
'where order_timestamp >= to_date(to_char(sysdate,''YYYYMM'')||''01'',''YYYYMMDD'')',
'union all',
'select ',
'    ''Monthly Orders'' as label,',
'    count(distinct o.order_id) as value,',
'    ''f?p=''||:APP_ID||'':255:''||:APP_SESSION||'':::255'' as url',
'from demo_orders o',
'where order_timestamp >= to_date(to_char(sysdate,''YYYYMM'')||''01'',''YYYYMMDD'')',
'union all',
'select ''Total Products'' as label,',
'        count(distinct p.product_name) as value,',
'        ''f?p=''||:APP_ID||'':3:''||:APP_SESSION||'':::'' as url',
'from demo_product_info p',
'union all',
'select ''Total Customers'' as label,',
'        count(*) as value,',
'        ''f?p=''||:APP_ID||'':2:''||:APP_SESSION||'':::'' as url',
'from DEMO_CUSTOMERS'))
,p_plug_source_type=>'NATIVE_JQM_LIST_VIEW'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_attribute_01=>'INSET'
,p_attribute_02=>'LABEL'
,p_attribute_08=>'VALUE'
,p_attribute_16=>'&URL.'
);
end;
/
