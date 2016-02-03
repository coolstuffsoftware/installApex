prompt --application/pages/page_00040
begin
wwv_flow_api.create_page(
 p_id=>40
,p_user_interface_id=>wwv_flow_api.id(1519898999322209702)
,p_tab_set=>'TS1'
,p_name=>'Activity Calendar'
,p_page_mode=>'NORMAL'
,p_step_title=>'&APP_NAME. - Activity Calendar'
,p_step_sub_title=>'Activity Calendar'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'No help is available for this page.'
,p_last_upd_yyyymmddhh24miss=>'20150310144153'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(638210953169181370)
,p_plug_name=>'Activity Calendar'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1259796920908281940)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select lower(USERID)||'' - ''',
'    ||trim(to_char(count(*),''999G999G999G990'')) page_events,',
'    trunc(time_stamp) the_day',
'from apex_activity_log l',
'where flow_id = :APP_ID',
'    and userid is not null',
'    and userid != ''nobody''',
'group by trunc(time_stamp), lower(userid)'))
,p_plug_source_type=>'NATIVE_CSS_CALENDAR'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'THE_DAY'
,p_attribute_03=>'PAGE_EVENTS'
,p_attribute_07=>'N'
,p_attribute_09=>'month:list:navigation'
,p_attribute_13=>'date'
,p_attribute_17=>'Y'
,p_attribute_19=>'N'
,p_attribute_22=>'Y'
);
end;
/
