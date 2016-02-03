prompt --application/pages/page_00020
begin
wwv_flow_api.create_page(
 p_id=>20
,p_user_interface_id=>wwv_flow_api.id(1519898999322209702)
,p_name=>'Product Info'
,p_page_mode=>'NON_MODAL'
,p_step_title=>'&APP_NAME. - Product Info'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_group_id=>wwv_flow_api.id(1679080816211228466)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_last_upd_yyyymmddhh24miss=>'20150316115942'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(7671247624530432335)
,p_name=>'Product Information'
,p_template=>wwv_flow_api.id(1259796920908281940)
,p_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_display_point=>'BODY'
,p_item_display_point=>'BELOW'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select product_name,',
'product_description,',
'category,',
'list_price',
'from demo_product_info where product_id = :P20_PRODUCT_ID',
'order by 1'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_ajax_enabled=>'N'
,p_fixed_header=>'NONE'
,p_query_row_template=>2
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_break_cols=>'0'
,p_query_no_data_found=>'no data found'
,p_query_num_rows_type=>'0'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_sort_null=>'F'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(7671247927465432360)
,p_query_column_id=>1
,p_column_alias=>'PRODUCT_NAME'
,p_column_display_sequence=>1
,p_column_heading=>'Product Name'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(7671248003976432360)
,p_query_column_id=>2
,p_column_alias=>'PRODUCT_DESCRIPTION'
,p_column_display_sequence=>2
,p_column_heading=>'Description'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(7671248102676432360)
,p_query_column_id=>3
,p_column_alias=>'CATEGORY'
,p_column_display_sequence=>3
,p_column_heading=>'Category'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(7671248299746432360)
,p_query_column_id=>4
,p_column_alias=>'LIST_PRICE'
,p_column_display_sequence=>4
,p_column_heading=>'List Price'
,p_column_format=>'FML999G999G999G999G990D00'
,p_heading_alignment=>'LEFT'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(7681740901516933026)
,p_name=>'Product Image'
,p_template=>wwv_flow_api.id(1259796920908281940)
,p_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_display_point=>'BODY'
,p_item_display_point=>'BELOW'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select decode(nvl(dbms_lob.getlength(product_image),0),0,null,''<img src="''||apex_util.get_blob_file_src(''P6_PRODUCT_IMAGE'',product_id)||''" />'') image',
'from demo_product_info',
'where product_id = :P20_PRODUCT_ID',
'order by 1'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_ajax_enabled=>'N'
,p_fixed_header=>'NONE'
,p_query_row_template=>1
,p_query_headings_type=>'NO_HEADINGS'
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_break_cols=>'0'
,p_query_no_data_found=>'no data found'
,p_query_num_rows_type=>'0'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'N'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(7347554104478968402)
,p_query_column_id=>1
,p_column_alias=>'IMAGE'
,p_column_display_sequence=>1
,p_display_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(7671261720169516212)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(7671247624530432335)
,p_button_name=>'CLOSE'
,p_button_static_id=>'CLOSE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1259817292296282017)
,p_button_image_alt=>'Close this Window'
,p_button_position=>'BOTTOM'
,p_button_redirect_url=>'javascript:window.close();'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7671249231803434410)
,p_name=>'P20_PRODUCT_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(7671247624530432335)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
end;
/
