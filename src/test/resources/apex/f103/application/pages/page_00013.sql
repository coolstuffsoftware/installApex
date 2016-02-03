prompt --application/pages/page_00013
begin
wwv_flow_api.create_page(
 p_id=>13
,p_user_interface_id=>wwv_flow_api.id(1519898999322209702)
,p_name=>'Customer Map'
,p_page_mode=>'NORMAL'
,p_step_title=>'&APP_NAME. - Customer Map'
,p_step_sub_title=>'Customer Map'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_group_id=>wwv_flow_api.id(1679080816211228466)
,p_step_template=>wwv_flow_api.id(1259767801430281840)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_upd_yyyymmddhh24miss=>'20150326113900'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(7514222785417497079)
,p_plug_name=>'Customer Map'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1259796920908281940)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_FLASH_MAP'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_flash_chart5(
 p_id=>wwv_flow_api.id(7514222983587497082)
,p_default_chart_type=>'Map'
,p_chart_title=>'Count of Customers by State'
,p_chart_rendering=>'FLASH_PREFERRED'
,p_chart_name=>'chart_829383609554689260'
,p_chart_width=>700
,p_chart_height=>500
,p_chart_animation=>'N'
,p_display_attr=>':H:N:V:X::N::::None:N:N:N:N:N:Default:N:N::'
,p_dial_tick_attr=>':::::::::::N'
,p_gantt_attr=>'Y:Rhomb:Rhomb:Full:Rhomb:Rhomb:Full:Rhomb:Rhomb:Full:30:15:5:Y:I:N:S:E::'
,p_pie_attr=>'Outside:::'
,p_map_attr=>'Orthographic:RegionBounds:REGION_ID:Y:Y:::::Y:'
,p_map_source=>'usa/country/states.amap'
,p_margins=>':::'
, p_omit_label_interval=> null
,p_bgtype=>'Trans'
,p_grid_bgtype=>'Solid'
,p_grid_bgcolor1=>'#FFFFFF'
,p_color_scheme=>'7'
,p_map_undef_color_scheme=>'1'
,p_x_axis_label_font=>'::'
,p_y_axis_label_font=>'::'
,p_async_update=>'N'
, p_names_font=> null
, p_names_rotation=> null
,p_values_font=>'Arial:10:#000000'
,p_hints_font=>'Tahoma:10:#000000'
,p_legend_font=>'::'
,p_chart_title_font=>'Tahoma:14:#000000'
,p_x_axis_title_font=>'Tahoma:14:'
,p_y_axis_title_font=>'Tahoma:14:'
,p_gauge_labels_font=>'Tahoma:10:'
,p_use_chart_xml=>'N'
);
wwv_flow_api.create_flash_chart5_series(
 p_id=>wwv_flow_api.id(7514223086423497084)
,p_chart_id=>wwv_flow_api.id(7514222983587497082)
,p_series_seq=>10
,p_series_name=>'Series 1'
,p_series_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select apex_util.prepare_url(''f?p=''||:APP_ID||'':2:''||:app_session||'':::2,RIR:IR_CUST_STATE:''||',
'             cust_state) click_link,',
'       cust_state region_id,',
'       count(*) count_of_customers',
'  from demo_customers',
'group by cust_state'))
,p_series_type=>'Bubble'
,p_series_query_type=>'SQL_QUERY'
,p_series_query_parse_opt=>'PARSE_CHART_QUERY'
,p_series_query_no_data_found=>'No customers found.'
,p_series_query_row_count_max=>50
,p_show_action_link=>'N'
);
end;
/
