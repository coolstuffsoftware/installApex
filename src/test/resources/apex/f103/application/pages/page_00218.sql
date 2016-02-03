prompt --application/pages/page_00218
begin
wwv_flow_api.create_page(
 p_id=>218
,p_user_interface_id=>wwv_flow_api.id(1671917025726579211)
,p_name=>'Order Summary'
,p_page_mode=>'NORMAL'
,p_step_title=>'&APP_NAME. - Create Order'
,p_step_sub_title=>'Order Summary'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_group_id=>wwv_flow_api.id(1679080816211228466)
,p_step_template=>wwv_flow_api.id(1609467824370416158)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_last_upd_yyyymmddhh24miss=>'20150327091606'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1318829497082320825)
,p_plug_name=>'Order Summary'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1609472717867416182)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY_3'
,p_list_template_id=>wwv_flow_api.id(1609473500002416188)
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_prn_template_id=>wwv_flow_api.id(1671917120563579211)
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1318829689502320825)
,p_plug_name=>'Order Header'
,p_parent_plug_id=>wwv_flow_api.id(1318829497082320825)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'begin',
'for x in (select c.cust_first_name, c.cust_last_name, cust_street_address1, cust_street_address2, cust_city, cust_state, cust_postal_code from demo_customers c, demo_orders o',
'where c.customer_id = o.customer_id and o.order_id = :P218_ORDER_ID)',
'loop',
'  htp.p(''<span style="font-size:16px;font-weight:bold;">ORDER #'' || apex_escape.html(:P218_ORDER_ID) || ''</span><br />'');',
'  htp.p(apex_escape.html(x.cust_first_name) || '' '' || apex_escape.html(x.cust_last_name) || ''<br />'');',
'  htp.p(apex_escape.html(x.cust_street_address1) || ''<br />'');',
'  if x.cust_street_address2 is not null then',
'      htp.p(apex_escape.html(x.cust_street_address2) || ''<br />'');',
'  end if;',
'  htp.p(apex_escape.html(x.cust_city) || '', '' || apex_escape.html(x.cust_state) || ''  '' || apex_escape.html(x.cust_postal_code) || ''<br /><br />'');',
'end loop;',
'end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_list_template_id=>wwv_flow_api.id(1609473500002416188)
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_prn_template_id=>wwv_flow_api.id(1671917120563579211)
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(1318829909411320826)
,p_name=>'Order Lines'
,p_parent_plug_id=>wwv_flow_api.id(1318829497082320825)
,p_template=>wwv_flow_api.id(920846780379664192)
,p_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_display_point=>'BODY'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select p.product_name, oi.unit_price, oi.quantity, (oi.unit_price * oi.quantity) exteneded_price   ',
'from demo_order_items oi, demo_product_info p',
'where oi.product_id = p.product_id and oi.order_id = :P218_ORDER_ID'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_ajax_enabled=>'N'
,p_fixed_header=>'NONE'
,p_query_row_template=>1
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_break_cols=>'0'
,p_query_no_data_found=>'no data found'
,p_query_num_rows_type=>'0'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_report_total_text_format=>'Report Total'
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'N'
,p_prn_template_id=>wwv_flow_api.id(1671917120563579211)
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1318830101051320827)
,p_query_column_id=>1
,p_column_alias=>'PRODUCT_NAME'
,p_column_display_sequence=>1
,p_column_heading=>'Product Name'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1318830200317320827)
,p_query_column_id=>2
,p_column_alias=>'UNIT_PRICE'
,p_column_display_sequence=>2
,p_column_heading=>'Unit Price'
,p_column_format=>'FML999G999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_lov_show_nulls=>'NO'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1318830299898320827)
,p_query_column_id=>3
,p_column_alias=>'QUANTITY'
,p_column_display_sequence=>3
,p_column_heading=>'Quantity'
,p_column_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_sum_column=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1318830409863320827)
,p_query_column_id=>4
,p_column_alias=>'EXTENEDED_PRICE'
,p_column_display_sequence=>4
,p_column_heading=>'Subtotal'
,p_column_format=>'FML999G999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_sum_column=>'Y'
,p_lov_show_nulls=>'NO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1318946811899236055)
,p_plug_name=>'Butons'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(1318947206499236056)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(1318946811899236055)
,p_button_name=>'Orders'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1609474636193416198)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'View Orders'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=&APP_ID.:255:&SESSION.::&DEBUG.:::'
,p_button_cattributes=>'label="NEXT"'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1318830493158320827)
,p_name=>'P218_ORDER_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(1318829497082320825)
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>64
,p_cMaxlength=>2000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
);
end;
/
