prompt --application/pages/page_00255
begin
wwv_flow_api.create_page(
 p_id=>255
,p_user_interface_id=>wwv_flow_api.id(1671917025726579211)
,p_name=>'Orders'
,p_page_mode=>'NORMAL'
,p_step_title=>'&APP_NAME. - Orders'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'No help is available for this page.'
,p_last_upd_yyyymmddhh24miss=>'20150309170328'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1665003726425559706)
,p_plug_name=>'Orders'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1609472224655416180)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select o.rowid',
',      o.order_id',
',      to_date(to_char(o.order_timestamp,''mm yyyy''), ''mm yyyy'') order_month',
',      o.order_timestamp order_date',
',      o.user_name sales_rep ',
',      o.order_total',
',      c.cust_last_name || '', '' || c.cust_first_name customer_name',
',      (select count(*) from demo_order_items  oi where oi.order_id = o.order_id) order_items',
',      o.tags tags',
'from  demo_orders o',
',     demo_customers c',
'where o.customer_id = c.customer_id ',
'and   (   :P205_TAGS is null',
'       or o.tags = :P205_TAGS)',
''))
,p_plug_source_type=>'NATIVE_JQM_COLUMN_TOGGLE'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_attribute_01=>'STRIPE:STROKE'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(1665004201067559707)
,p_name=>'ROWID'
,p_data_type=>'ROWID'
,p_is_visible=>false
,p_display_sequence=>10
,p_attribute_01=>'PLAIN'
,p_attribute_25=>'1'
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(1665004715300559707)
,p_name=>'ORDER_ID'
,p_data_type=>'ORDER_ID'
,p_is_visible=>true
,p_display_sequence=>20
,p_heading=>'Order #'
,p_heading_alignment=>'CENTER'
,p_value_alignment=>'RIGHT'
,p_attribute_01=>'PLAIN'
,p_attribute_25=>'1'
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(1665005150617559707)
,p_name=>'ORDER_MONTH'
,p_data_type=>'ORDER_MONTH'
,p_is_visible=>true
,p_display_sequence=>70
,p_heading=>'Order Month'
,p_heading_alignment=>'CENTER'
,p_value_alignment=>'CENTER'
,p_format_mask=>'MON YYYY'
,p_attribute_01=>'PLAIN'
,p_attribute_25=>'3'
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(1665005658259559708)
,p_name=>'ORDER_DATE'
,p_data_type=>'ORDER_DATE'
,p_is_visible=>true
,p_display_sequence=>80
,p_heading=>'Order Date'
,p_heading_alignment=>'CENTER'
,p_value_alignment=>'CENTER'
,p_attribute_01=>'PLAIN'
,p_attribute_25=>'4'
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(1665006215383559708)
,p_name=>'SALES_REP'
,p_data_type=>'SALES_REP'
,p_is_visible=>true
,p_display_sequence=>40
,p_heading=>'Sales Rep'
,p_heading_alignment=>'CENTER'
,p_value_alignment=>'LEFT'
,p_attribute_01=>'PLAIN'
,p_attribute_25=>'3'
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(1665006623615559708)
,p_name=>'ORDER_TOTAL'
,p_data_type=>'ORDER_TOTAL'
,p_is_visible=>true
,p_display_sequence=>60
,p_heading=>'Order Total'
,p_heading_alignment=>'CENTER'
,p_value_alignment=>'RIGHT'
,p_format_mask=>'FML999G999G999G999G990D00'
,p_attribute_01=>'PLAIN'
,p_attribute_25=>'1'
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(1665007131675559708)
,p_name=>'CUSTOMER_NAME'
,p_data_type=>'CUSTOMER_NAME'
,p_is_visible=>true
,p_display_sequence=>30
,p_heading=>'Customer Name'
,p_heading_alignment=>'CENTER'
,p_value_alignment=>'LEFT'
,p_attribute_01=>'PLAIN'
,p_attribute_25=>'1'
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(1665007632660559709)
,p_name=>'ORDER_ITEMS'
,p_data_type=>'ORDER_ITEMS'
,p_is_visible=>true
,p_display_sequence=>50
,p_heading=>'Items ordered'
,p_heading_alignment=>'CENTER'
,p_value_alignment=>'RIGHT'
,p_attribute_01=>'PLAIN'
,p_attribute_25=>'2'
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(1665008158453559709)
,p_name=>'TAGS'
,p_data_type=>'TAGS'
,p_is_visible=>false
,p_display_sequence=>90
,p_attribute_01=>'PLAIN'
,p_attribute_25=>'1'
,p_escape_on_http_output=>true
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(1455654072909941151)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(1665003726425559706)
,p_button_name=>'Create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1609474636193416198)
,p_button_image_alt=>'Create'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:216:&SESSION.::&DEBUG.:RP::'
,p_grid_new_grid=>false
);
end;
/
