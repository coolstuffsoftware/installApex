prompt --application/pages/page_00008
begin
wwv_flow_api.create_page(
 p_id=>8
,p_user_interface_id=>wwv_flow_api.id(1519898999322209702)
,p_name=>'Order Confirmation'
,p_page_mode=>'MODAL'
,p_step_title=>'&APP_NAME. - Order Confirmation'
,p_step_sub_title=>'Order Confirmation'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_group_id=>wwv_flow_api.id(1679080816211228466)
,p_step_template=>wwv_flow_api.id(1259793923434281919)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_last_upd_yyyymmddhh24miss=>'20150309170328'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(688605257093571792)
,p_plug_name=>'Order Progress'
,p_component_template_options=>'#DEFAULT#:t-WizardSteps--displayCurrentLabelOnly'
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_01'
,p_list_id=>wwv_flow_api.id(7488115622509571106)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(1259815938281282002)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(688605696857571796)
,p_plug_name=>'Order Header'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="margin: 10px 10px 0;"'
,p_plug_template=>wwv_flow_api.id(1259796920908281940)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'begin',
'for x in (select c.cust_first_name,',
'                 c.cust_last_name, ',
'                 cust_street_address1, ',
'                 cust_street_address2, ',
'                 cust_city, ',
'                 cust_state, ',
'                 cust_postal_code ',
'           from demo_customers c, demo_orders o',
'          where c.customer_id = o.customer_id ',
'            and o.order_id = :P8_ORDER_ID)',
'loop',
'  htp.p(''<span style="font-size:16px;font-weight:bold;">ORDER #'' || apex_escape.html(:P8_ORDER_ID) || ''</span><br />'');',
'  htp.p(apex_escape.html(x.cust_first_name) || '' '' || apex_escape.html(x.cust_last_name) || ''<br />'');',
'  htp.p(apex_escape.html(x.cust_street_address1) || ''<br />'');',
'  if x.cust_street_address2 is not null then',
'      htp.p(apex_escape.html(x.cust_street_address2) || ''<br />'');',
'  end if;',
'  htp.p(apex_escape.html(x.cust_city) || '', '' || apex_escape.html(x.cust_state) || ''  '' || apex_escape.html(x.cust_postal_code) || ''<br /><br />'');',
'end loop;',
'end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(688605829241571796)
,p_name=>'Order Lines'
,p_template=>wwv_flow_api.id(1259803633802281962)
,p_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_display_point=>'BODY'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select p.product_name, ',
'       oi.unit_price, ',
'       oi.quantity, ',
'      (oi.unit_price * oi.quantity) total_cost   ',
'from demo_order_items oi, demo_product_info p',
'where oi.product_id = p.product_id ',
'and oi.order_id = :P8_ORDER_ID',
'and oi.quantity <> 0'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_ajax_enabled=>'N'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(1259808956189281975)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_no_data_found=>'no data found'
,p_query_row_count_max=>500
,p_report_total_text_format=>'Report Total'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(688606168694571803)
,p_query_column_id=>1
,p_column_alias=>'PRODUCT_NAME'
,p_column_display_sequence=>1
,p_column_heading=>'Product'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(688606315921571803)
,p_query_column_id=>2
,p_column_alias=>'UNIT_PRICE'
,p_column_display_sequence=>2
,p_column_heading=>'Unit Price'
,p_use_as_row_header=>'N'
,p_column_format=>'FML999G999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'LEFT'
,p_lov_show_nulls=>'NO'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(688606384884571803)
,p_query_column_id=>3
,p_column_alias=>'QUANTITY'
,p_column_display_sequence=>3
,p_column_heading=>'Quantity'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(688606116586571800)
,p_query_column_id=>4
,p_column_alias=>'TOTAL_COST'
,p_column_display_sequence=>4
,p_column_heading=>'Total Cost'
,p_use_as_row_header=>'N'
,p_column_format=>'FML999G999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(688606683799571806)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1259797707782281943)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(688606871163571806)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(688606683799571806)
,p_button_name=>'CLOSE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1259817292296282017)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Close'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(688606500082571804)
,p_name=>'P8_ORDER_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(688605829241571796)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(688607107921571808)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(688606871163571806)
);
end;
/
