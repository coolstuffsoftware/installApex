prompt --application/pages/page_00211
begin
wwv_flow_api.create_page(
 p_id=>211
,p_user_interface_id=>wwv_flow_api.id(1671917025726579211)
,p_name=>'Sales by Product'
,p_page_mode=>'NORMAL'
,p_step_title=>'&APP_NAME. - Sales by Product'
,p_step_sub_title=>'Sales by Product'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_group_id=>wwv_flow_api.id(1679080918635229175)
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
 p_id=>wwv_flow_api.id(1680944998226442041)
,p_plug_name=>'Sales by Product'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1609472224655416180)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY_3'
,p_plug_source_type=>'NATIVE_FLASH_CHART5'
,p_plug_query_row_template=>1
);
wwv_flow_api.create_flash_chart5(
 p_id=>wwv_flow_api.id(1680945210810442043)
,p_default_chart_type=>'Horizontal2DColumn'
,p_chart_rendering=>'SVG_ONLY'
,p_chart_name=>'chart_373254816810278614'
,p_chart_animation=>'Appear'
,p_display_attr=>':H:N::Y:N:N:N:::None:N:N:N:N:N:Default:N:N::N'
,p_dial_tick_attr=>':::::::::::'
,p_gantt_attr=>':::::::::::::::::::'
,p_pie_attr=>':::'
,p_map_attr=>'Orthographic:RegionBounds:REGION_NAME:N:N:Series:::::'
,p_margins=>':::'
, p_omit_label_interval=> null
,p_bgtype=>'Trans'
,p_grid_gradient_rotation=>0
,p_color_scheme=>'7'
,p_x_axis_title=>'Product'
,p_x_axis_label_font=>'Tahoma:10:#000000'
,p_y_axis_title=>'Total Sales'
,p_y_axis_label_font=>'Tahoma:10:#000000'
,p_async_update=>'N'
, p_names_font=> null
, p_names_rotation=> null
,p_values_font=>'Tahoma:10:#000000'
,p_hints_font=>'Tahoma:10:#000000'
,p_legend_font=>'::'
,p_grid_labels_font=>'Tahoma:10:'
,p_chart_title_font=>'::'
,p_x_axis_title_font=>'Tahoma:14:#000000'
,p_y_axis_title_font=>'Tahoma:14:#000000'
,p_gauge_labels_font=>'::'
,p_use_chart_xml=>'N'
);
wwv_flow_api.create_flash_chart5_series(
 p_id=>wwv_flow_api.id(1680945311969442043)
,p_chart_id=>wwv_flow_api.id(1680945210810442043)
,p_series_seq=>10
,p_series_name=>'Series 1'
,p_series_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select p.rowid link, ',
'       p.product_name||'' [$''||p.list_price||'']'' product,',
'       SUM(oi.quantity * oi.unit_price) sales',
'from demo_order_items oi',
',    demo_product_info p',
'where oi.product_id = p.product_id',
'group by p.rowid, p.product_id, p.product_name, p.list_price',
'order by p.product_name'))
,p_series_type=>'Bar'
,p_series_query_type=>'SQL_QUERY'
,p_series_query_parse_opt=>'PARSE_CHART_QUERY'
,p_series_query_no_data_found=>'no data found'
,p_series_query_row_count_max=>15
,p_action_link=>'f?p=&APP_ID.:204:&SESSION.::&DEBUG.:204:P204_ROWID:#LINK#'
,p_show_action_link=>'C'
);
end;
/
