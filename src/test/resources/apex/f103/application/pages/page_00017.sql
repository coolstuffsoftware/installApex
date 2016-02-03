prompt --application/pages/page_00017
begin
wwv_flow_api.create_page(
 p_id=>17
,p_user_interface_id=>wwv_flow_api.id(1519898999322209702)
,p_tab_set=>'TS1'
,p_name=>'Customer Orders'
,p_page_mode=>'NORMAL'
,p_step_title=>'&APP_NAME. - Customer Orders'
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
,p_last_upd_yyyymmddhh24miss=>'20150617123918'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2103687124208608747)
,p_plug_name=>'Customer Orders'
,p_region_template_options=>'#DEFAULT#:t-Region--hideHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(1259803633802281962)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select apex_util.prepare_url(''f?p=&APP_ID.:7:''||:app_session||'':::7:P7_CUSTOMER_ID,P7_BRANCH:''||c.customer_id||'',17:'') as link,',
'       c.cust_last_name||'', ''||c.cust_first_name as Customer_Name,',
'       p.category,',
'       sum(oi.quantity * oi.unit_price) as sales',
'       --sum (decode(p.category,''Accessories'',oi.quantity * oi.unit_price,0))  as Accessories,',
'       --sum (decode(p.category,''Mens'',oi.quantity * oi.unit_price,0)) as Mens,',
'       --sum (decode(p.category,''Womens'',oi.quantity * oi.unit_price,0)) as Womens',
'from demo_customers c',
',    demo_orders o',
',    demo_order_items oi',
',    demo_product_info p',
'where c.customer_id = o.customer_id',
'and   o.order_id = oi.order_id',
'and   oi.product_id = p.product_id',
'group by c.customer_id, c.cust_last_name, c.cust_first_name, p.category',
'order by c.cust_last_name'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.D3.BARCHART'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'CUSTOMER_NAME'
,p_attribute_02=>'SALES'
,p_attribute_03=>'Y'
,p_attribute_04=>'CATEGORY'
,p_attribute_06=>'VERTICAL,SIDE-BY-SIDE'
,p_attribute_10=>'SERIES:X:Y'
,p_attribute_12=>'BOTTOM'
,p_attribute_15=>'FRIENDLY'
,p_attribute_16=>'10'
,p_attribute_17=>'10'
,p_attribute_21=>'BARS'
,p_attribute_22=>'Y'
,p_attribute_24=>'N'
,p_attribute_25=>'$,.0f'
);
end;
/
