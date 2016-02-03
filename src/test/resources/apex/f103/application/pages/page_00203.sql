prompt --application/pages/page_00203
begin
wwv_flow_api.create_page(
 p_id=>203
,p_user_interface_id=>wwv_flow_api.id(1671917025726579211)
,p_name=>'Products'
,p_page_mode=>'NORMAL'
,p_step_title=>'&APP_NAME. - Products'
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
 p_id=>wwv_flow_api.id(1671968898240180883)
,p_plug_name=>'Products'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1609472224655416180)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY_3'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select a.ROWID as "PK_ROWID",',
'       a.*',
'  from "#OWNER#"."DEMO_PRODUCT_INFO" a',
'where (   :P203_TAGS is null',
'       or a.tags = :P203_TAGS)',
'order by a.product_name'))
,p_plug_source_type=>'NATIVE_JQM_LIST_VIEW'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>20
,p_attribute_01=>'SEARCH:INSET:IMAGE'
,p_attribute_02=>'PRODUCT_NAME'
,p_attribute_09=>'IMAGE_BLOB'
,p_attribute_10=>'PRODUCT_IMAGE'
,p_attribute_11=>'ROWID'
,p_attribute_16=>'f?p=&APP_ID.:204:&APP_SESSION.::&DEBUG.:RP,204:P204_ROWID:&PK_ROWID.'
,p_attribute_18=>'SERVER_LIKE_IGNORE'
,p_attribute_19=>'PRODUCT_DESCRIPTION'
,p_attribute_20=>'Search Product Description'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(1671969204064180883)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(1671968898240180883)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1609474636193416198)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=&APP_ID.:204:&SESSION.::&DEBUG.:RP,204::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1311516800255483107)
,p_name=>'P203_TAGS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(1671968898240180883)
,p_display_as=>'NATIVE_HIDDEN'
,p_cMaxlength=>4000
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1312549281812628402)
,p_name=>'P203_DISPLAY_TAGS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(1671968898240180883)
,p_prompt=>'Tag - '
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cSize=>64
,p_cMaxlength=>4000
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(1609474189129416193)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(1312549398189635762)
,p_name=>'Hide / Show Dispaly Tags'
,p_event_sequence=>10
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'!$v( "P203_TAGS" )'
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1312549683999635766)
,p_event_id=>wwv_flow_api.id(1312549398189635762)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P203_DISPLAY_TAGS'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1312549906417635767)
,p_event_id=>wwv_flow_api.id(1312549398189635762)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P203_DISPLAY_TAGS'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
end;
/
