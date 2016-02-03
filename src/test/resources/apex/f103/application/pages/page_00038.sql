prompt --application/pages/page_00038
begin
wwv_flow_api.create_page(
 p_id=>38
,p_user_interface_id=>wwv_flow_api.id(1519898999322209702)
,p_tab_set=>'TS1'
,p_name=>'Top Users'
,p_page_mode=>'NORMAL'
,p_step_title=>'&APP_NAME. - Top Users'
,p_step_sub_title=>'Top Users'
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
,p_last_upd_yyyymmddhh24miss=>'20150327093551'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(941070052344417829)
,p_plug_name=>'Top Users'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1259803140431281961)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select',
'lower(USERID)                   as THE_USER,',
'count(*)                        as PAGE_EVENTS,',
'median(ELAP)                    as MEDIAN_ELAPSED,',
'sum(NUM_ROWS)                   as ROWS_FETCHED,',
'sum(decode(IR_SEARCH,null,0,1)) as IR_SEARCHES,',
'sum(decode(SQLERRM,null,0,1))   as ERRORS,',
'sum(CONTENT_LENGTH)             as CONTENT_SERVED,',
'max(time_stamp)                 as MOST_RECENT',
'from apex_activity_log l',
'where flow_id = :app_id',
'and time_stamp > sysdate - to_number(:P38_TIMEFRAME,''9999999990.99999999999'',''NLS_NUMERIC_CHARACTERS=''''.,'''''')',
'group by lower(userid)',
'order by most_recent desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(941070175165417829)
,p_name=>'Top Users'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_allow_save_rpt_public=>'Y'
,p_allow_report_categories=>'N'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_rows_per_page=>'N'
,p_show_notify=>'Y'
,p_show_calendar=>'N'
,p_download_formats=>'CSV:HTML:EMAIL'
,p_allow_exclude_null_values=>'N'
,p_allow_hide_extra_columns=>'N'
,p_icon_view_columns_per_row=>1
,p_owner=>'DPEAKE'
,p_internal_uid=>420163926361892399
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(941071062908417832)
,p_db_column_name=>'MOST_RECENT'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Most Recent'
,p_column_type=>'DATE'
,p_format_mask=>'since'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(605065848995961374)
,p_db_column_name=>'THE_USER'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'The User'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(605065940790961376)
,p_db_column_name=>'PAGE_EVENTS'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Page Events'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(605066024975961377)
,p_db_column_name=>'MEDIAN_ELAPSED'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Median Elapsed'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(605066137075961377)
,p_db_column_name=>'ROWS_FETCHED'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Rows Fetched'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(605066251327961377)
,p_db_column_name=>'IR_SEARCHES'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Ir Searches'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(605066349213961377)
,p_db_column_name=>'ERRORS'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Errors'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(605066428367961377)
,p_db_column_name=>'CONTENT_SERVED'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Content Served'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(941071876902437306)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'4201657'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>15
,p_report_columns=>'THE_USER:PAGE_EVENTS:MEDIAN_ELAPSED:ROWS_FETCHED:IR_SEARCHES:ERRORS:CONTENT_SERVED:MOST_RECENT:'
,p_sort_column_1=>'Page Events'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'0'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'0'
,p_sort_direction_3=>'ASC'
,p_sort_column_4=>'0'
,p_sort_direction_4=>'ASC'
,p_sort_column_5=>'0'
,p_sort_direction_5=>'ASC'
,p_sort_column_6=>'0'
,p_sort_direction_6=>'ASC'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(941081754317525418)
,p_plug_name=>'Button Bar'
,p_region_css_classes=>'t-Form t-Form--floatLeft'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1259796920908281940)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(942189970445549664)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(941070052344417829)
,p_button_name=>'RESET_REPORT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(1259816830774282015)
,p_button_image_alt=>'Reset'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:38:&SESSION.::&DEBUG.:38,RIR::'
,p_icon_css_classes=>'fa-undo'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(941071471805435529)
,p_name=>'P38_TIMEFRAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(941081754317525418)
,p_item_default=>'00001.0000000000'
,p_prompt=>'Timeframe'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'TIMEFRAME'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select ''15 ''||wwv_flow_lang.system_message(initcap(''MINUTES'')) d, ',
'trim(to_char(15/(24*60),''00000.99999999999'',''NLS_NUMERIC_CHARACTERS=''''.,'''''')) t from dual union all ',
'select ''30 ''||wwv_flow_lang.system_message(initcap(''MINUTES'')) d, ',
'trim(to_char(30/(24*60),''00000.99999999999'',''NLS_NUMERIC_CHARACTERS=''''.,'''''')) t from dual union all ',
'select ''1 ''||wwv_flow_lang.system_message(initcap(''HOUR'')) d, ',
'trim(to_char(1/24,''00000.99999999999'',''NLS_NUMERIC_CHARACTERS=''''.,'''''')) t from dual union all ',
'select ''90 ''||wwv_flow_lang.system_message(initcap(''MINUTES'')) d, ',
'trim(to_char(90/(24*60),''00000.99999999999'',''NLS_NUMERIC_CHARACTERS=''''.,'''''')) t from dual union all ',
'select ''2 ''||wwv_flow_lang.system_message(initcap(''HOURS'')) d, ',
'trim(to_char(1/12,''00000.99999999999'',''NLS_NUMERIC_CHARACTERS=''''.,''''''))  t from dual union all ',
'select ''3 ''||wwv_flow_lang.system_message(initcap(''HOURS'')) d, ',
'trim(to_char(3/24,''00000.99999999999'',''NLS_NUMERIC_CHARACTERS=''''.,''''''))  t from dual union all ',
'select ''4 ''||wwv_flow_lang.system_message(initcap(''HOURS'')) d, ',
'trim(to_char(4/24,''00000.99999999999'',''NLS_NUMERIC_CHARACTERS=''''.,''''''))  t from dual union all ',
'select ''5 ''||wwv_flow_lang.system_message(initcap(''HOURS'')) d, ',
'trim(to_char(5/24,''00000.99999999999'',''NLS_NUMERIC_CHARACTERS=''''.,''''''))  t from dual union all ',
'select ''6 ''||wwv_flow_lang.system_message(initcap(''HOURS'')) d, ',
'trim(to_char(6/24,''00000.99999999999'',''NLS_NUMERIC_CHARACTERS=''''.,'''''')) t from dual union all ',
'select ''8 ''||wwv_flow_lang.system_message(initcap(''HOURS'')) d, ',
'trim(to_char(8/24,''00000.99999999999'',''NLS_NUMERIC_CHARACTERS=''''.,'''''')) t from dual union all ',
'select ''10 ''||wwv_flow_lang.system_message(initcap(''HOURS'')) d, ',
'trim(to_char(10/24,''00000.99999999999'',''NLS_NUMERIC_CHARACTERS=''''.,'''''')) t from dual union all ',
'select ''12 ''||wwv_flow_lang.system_message(initcap(''HOURS'')) d, ',
'trim(to_char(12/24,''00000.99999999999'',''NLS_NUMERIC_CHARACTERS=''''.,'''''')) t from dual union all ',
'select ''16 ''||wwv_flow_lang.system_message(initcap(''HOURS'')) d, ',
'trim(to_char(16/24,''00000.9999999999'',''NLS_NUMERIC_CHARACTERS=''''.,'''''')) t from dual union all ',
'select ''1 ''||wwv_flow_lang.system_message(initcap(''DAY'')) d, trim(to_char(1,''00000.9999999999'')) t ',
'from dual union all ',
'select ''2 ''||wwv_flow_lang.system_message(initcap(''DAYS'')) d, trim(to_char(2,''00000.9999999999'')) t ',
'from dual union all ',
'select ''3 ''||wwv_flow_lang.system_message(initcap(''DAYS'')) d, trim(to_char(3,''00000.9999999999'')) t ',
'from dual union all ',
'select ''4 ''||wwv_flow_lang.system_message(initcap(''DAYS'')) d, trim(to_char(4,''00000.9999999999'')) t ',
'from dual union all ',
'select ''5 ''||wwv_flow_lang.system_message(initcap(''DAYS'')) d, trim(to_char(5,''00000.9999999999'')) t ',
'from dual union all ',
'select ''1 ''||wwv_flow_lang.system_message(initcap(''WEEK'')) d, trim(to_char(7,''00000.9999999999'')) t   ',
'from dual union all ',
'select ''2 ''||wwv_flow_lang.system_message(initcap(''WEEKS'')) d, trim(to_char(14,''00000.9999999999'')) t   ',
'from dual order by 2'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Select -'
,p_cHeight=>1
,p_tag_css_classes=>'mnw180'
,p_field_template=>wwv_flow_api.id(1259816549476282009)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'REDIRECT_SET_VALUE'
);
end;
/
