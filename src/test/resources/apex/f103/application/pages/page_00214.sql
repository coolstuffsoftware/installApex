prompt --application/pages/page_00214
begin
wwv_flow_api.create_page(
 p_id=>214
,p_user_interface_id=>wwv_flow_api.id(1671917025726579211)
,p_name=>'Tags'
,p_page_mode=>'NORMAL'
,p_step_title=>'&APP_NAME. - Tags'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_group_id=>wwv_flow_api.id(1679080918635229175)
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
 p_id=>wwv_flow_api.id(1681153521743440859)
,p_plug_name=>'Customer Tags'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1609472452642416181)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY_3'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select tag, tag_count',
'  from demo_tags_type_sum',
' where content_type = ''CUSTOMER''',
'   and tag_count > 0'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.TAG_CLOUD'
,p_plug_query_row_template=>1
,p_plug_query_no_data_found=>'No tags found.'
,p_attribute_01=>'f?p=&APP_ID.:201:&APP_SESSION.:::201:P201_TAGS,P201_DISPLAY_TAGS:#TAG#,#TAG#'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1681153825462443294)
,p_plug_name=>'Product Tags'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1609472452642416181)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY_3'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select tag, tag_count',
'  from demo_tags_type_sum',
' where content_type = ''PRODUCT''',
'   and tag_count > 0'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.TAG_CLOUD'
,p_plug_query_row_template=>1
,p_plug_query_no_data_found=>'No tags found.'
,p_attribute_01=>'f?p=&APP_ID.:203:&APP_SESSION.:::203:P203_TAGS,P203_DISPLAY_TAGS:#TAG#,#TAG#'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1681154411048448598)
,p_plug_name=>'Order Tags'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1609472452642416181)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY_3'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select tag, tag_count',
'  from demo_tags_type_sum',
' where content_type = ''ORDER''',
'   and tag_count > 0'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.TAG_CLOUD'
,p_plug_query_row_template=>1
,p_plug_query_no_data_found=>'No tags found.'
,p_attribute_01=>'f?p=&APP_ID.:205:&APP_SESSION.:::205:P205_TAGS:#TAG#'
,p_attribute_03=>'Y'
);
end;
/
