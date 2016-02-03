prompt --application/pages/page_00033
begin
wwv_flow_api.create_page(
 p_id=>33
,p_user_interface_id=>wwv_flow_api.id(1519898999322209702)
,p_name=>'Administration'
,p_alias=>'SETTINGS'
,p_page_mode=>'NORMAL'
,p_step_title=>'&APP_NAME. - Administration'
,p_step_sub_title=>'Administration'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_group_id=>wwv_flow_api.id(1679080816211228466)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_last_upd_yyyymmddhh24miss=>'20150309170327'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(940355979481715662)
,p_plug_name=>'Administration'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1259803633802281962)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(7471335118078086749)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(1259813477982281991)
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(941045854038199470)
,p_plug_name=>'Reports'
,p_region_name=>'adminReports'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1259803633802281962)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(941044772588199469)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(1259813477982281991)
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(662963430633286971)
,p_name=>'P33_STATE_COUNT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(940355979481715662)
,p_use_cache_before_default=>'NO'
,p_format_mask=>'999G990'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select count(*)',
'from demo_states'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(662966546424313480)
,p_name=>'P33_FEEDBACK_STATUS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(940355979481715662)
,p_use_cache_before_default=>'NO'
,p_source=>'case when :ENABLE_FEEDBACK = ''YES'' then ''Enabled'' else ''Disabled'' end'
,p_source_type=>'FUNCTION'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(662967293480323972)
,p_name=>'P33_USER_COUNT'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(941045854038199470)
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select count(distinct userid)',
'from apex_activity_log l',
'where flow_id = :app_id'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(662967472851323972)
,p_name=>'P33_PAGE_VIEWS'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(941045854038199470)
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select count(*)',
'from apex_activity_log l',
'where flow_id = :app_id'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
end;
/
