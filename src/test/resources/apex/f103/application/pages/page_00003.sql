prompt --application/pages/page_00003
begin
wwv_flow_api.create_page(
 p_id=>3
,p_user_interface_id=>wwv_flow_api.id(1519898999322209702)
,p_name=>'Products'
,p_page_mode=>'NORMAL'
,p_step_title=>'&APP_NAME. - Products'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_group_id=>wwv_flow_api.id(1679080816211228466)
,p_inline_css=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'table.apexir_WORKSHEET_CUSTOM td {',
'border-right: none !important;',
'}',
'table.a-IRR-detailViewTable {width:100%;}',
'table.reportDetail {width:100%;}'))
,p_step_template=>wwv_flow_api.id(1259767801430281840)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'No help is available for this page.'
,p_last_upd_yyyymmddhh24miss=>'20150630072339'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(7347294718082050746)
,p_plug_name=>'Products'
,p_region_name=>'productsIRR'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1259803140431281961)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select p.product_id,',
'       p.product_name, ',
'       p.product_description, ',
'       p.category, ',
'       decode(p.product_avail, ''Y'',''Yes'',''N'',''No'') product_avail,',
'       p.list_price,',
'       (select sum(quantity) from demo_order_items where product_id = p.product_id) units,',
'       (select sum(quantity * p.list_price) from demo_order_items where product_id = p.product_id) sales,       ',
'       (select count(o.customer_id) from demo_orders o, demo_order_items t where o.order_id = t.order_id and t.product_id = p.product_id group by p.product_id) customers,',
'       (select max(o.order_timestamp) od from demo_orders o, demo_order_items i where o.order_id = i.order_id and i.product_id = p.product_id) last_date_sold,',
'       p.product_id img,',
'       apex_util.prepare_url(p_url=>''f?p=''||:app_id||'':6:''||:app_session||''::::P6_PRODUCT_ID,P6_BRANCH:''||p.product_id||'',''||3,p_dialog=> ''null'') icon_link,',
'       decode(nvl(dbms_lob.getlength(p.product_image),0),0,null,',
'       ''<img alt="''||apex_escape.html_attribute(p.product_name)||''" title="''||apex_escape.html_attribute(p.product_name)',
'              ||''" style="border: 4px solid #CCC; -moz-border-radius: 4px; -webkit-border-radius: 4px;" ''',
'              ||''src="''||apex_util.get_blob_file_src(''P6_PRODUCT_IMAGE'',p.product_id)||''" height="75" width="75" />'') detail_img,',
'       decode(nvl(dbms_lob.getlength(p.product_image),0),0,null,',
'       apex_util.get_blob_file_src(''P6_PRODUCT_IMAGE'',p.product_id))',
'       detail_img_no_style,',
'       tags',
'from demo_product_info p'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(7347294802871050746)
,p_name=>'Products'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows. Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_allow_save_rpt_public=>'Y'
,p_allow_report_categories=>'N'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_rows_per_page=>'N'
,p_show_notify=>'Y'
,p_show_calendar=>'N'
,p_download_formats=>'CSV'
,p_icon_view_enabled_yn=>'Y'
,p_icon_view_link_column=>'ICON_LINK'
,p_icon_view_img_src_column=>'DETAIL_IMG_NO_STYLE'
,p_icon_view_label_column=>'PRODUCT_NAME'
,p_icon_view_img_attr_text=>'width="75" height="75"'
,p_icon_view_columns_per_row=>5
,p_detail_view_enabled_yn=>'Y'
,p_detail_view_before_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<style>',
'table.apexir_WORKSHEET_CUSTOM { border: none !important; -moz-box-shadow: none; box-shadow: none; -webkit-box-shadow: none; }',
'.apexir_WORKSHEET_DATA td {border-bottom: none !important;}',
'table.reportDetail td {',
'        padding: 2px 4px !important;',
'	border: none !important;',
'	font: 11px/16px Arial, sans-serif;',
'	}',
'	table.reportDetail td.separator {',
'		background: #F0F0F0 !important;',
'		padding: 0 !important;',
'		height: 1px !important;',
'padding: 0;',
'		line-height: 2px !important;',
'overflow: hidden;',
'		}',
'table.reportDetail td h1 {margin: 0 !important}',
'table.reportDetail td img {margin-top: 8px; border: 4px solid #CCC; -moz-border-radius: 4px; -webkit-border-radius: 4px;}',
'</style>',
'<table class="reportDetail">'))
,p_detail_view_for_each_row=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<tr>',
'<td rowspan="5" valign="top"><img width="75" height="75" src="#DETAIL_IMG_NO_STYLE#" alt="#PRODUCT_NAME#"></td>',
'<td colspan="6"><h1><a href="#ICON_LINK#"><strong>#PRODUCT_NAME#</strong></a></h1></td>',
'</tr>',
'<tr>',
'<td><strong>#CATEGORY_LABEL#:</strong></td><td>#CATEGORY#</td>',
'<td><strong>#PRODUCT_AVAIL_LABEL#:</strong></td><td>#PRODUCT_AVAIL#</td>',
'<td><strong>#LAST_DATE_SOLD_LABEL#:</strong></td><td>#LAST_DATE_SOLD#</td>',
'</tr>',
'<tr>',
'<td align="left"><strong>#PRODUCT_DESCRIPTION_LABEL#:</strong></td><td colspan="5" >#PRODUCT_DESCRIPTION#</td>',
'</tr>',
'<tr>',
'<td style="padding-bottom: 0px;"><strong>#LIST_PRICE_LABEL#</strong></td>',
'<td style="padding-bottom: 0px;"><strong>#UNITS_LABEL#</strong></td>',
'<td style="padding-bottom: 0px;"><strong>#SALES_LABEL#</strong></td>',
'<td style="padding-bottom: 0px;"><strong>#CUSTOMERS_LABEL#</strong></td>',
'</tr>',
'<tr>',
'<td style="padding-top: 0px;">#LIST_PRICE#</td>',
'<td style="padding-top: 0px;">#UNITS#</td>',
'<td style="padding-top: 0px;">#SALES#</td>',
'<td style="padding-top: 0px;">#CUSTOMERS#</td>',
'</tr>',
'<tr><td colspan="7" class="separator">&nbsp;</td></tr>'))
,p_detail_view_after_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<tr><td colspan="7" class="separator"></td></tr>',
'</table>'))
,p_owner=>'DPEAKE'
,p_internal_uid=>1
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(7347295025903050747)
,p_db_column_name=>'PRODUCT_ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Product_Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(7347295108293050747)
,p_db_column_name=>'PRODUCT_NAME'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Name'
,p_column_link=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.::P6_PRODUCT_ID,P6_BRANCH:#PRODUCT_ID#,3'
,p_column_linktext=>'#PRODUCT_NAME#'
,p_column_type=>'STRING'
,p_help_text=>'This column contains the name of a product.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(7347295200883050747)
,p_db_column_name=>'PRODUCT_DESCRIPTION'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Description'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(7347295326141050747)
,p_db_column_name=>'CATEGORY'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Category'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(7347295427969050748)
,p_db_column_name=>'PRODUCT_AVAIL'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Available'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(7347295505409050748)
,p_db_column_name=>'LIST_PRICE'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Price'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FML999G999G999G999G990D00'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(7347295620996050748)
,p_db_column_name=>'UNITS'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Units'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(7347295706966050748)
,p_db_column_name=>'SALES'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Sales'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FML999G999G999G999G990D00'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(7347295804602050748)
,p_db_column_name=>'CUSTOMERS'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Customers'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(7377637089753967784)
,p_db_column_name=>'IMG'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Image'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'IMAGE:DEMO_PRODUCT_INFO:PRODUCT_IMAGE:PRODUCT_ID::MIMETYPE:FILENAME:IMAGE_LAST_UPDATE::inline:'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(7505240489230806201)
,p_db_column_name=>'ICON_LINK'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Icon Link'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(7505240583711806208)
,p_db_column_name=>'DETAIL_IMG'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Image'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(7513855794007683182)
,p_db_column_name=>'DETAIL_IMG_NO_STYLE'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Detail Img No Style'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4115782038931212036)
,p_db_column_name=>'LAST_DATE_SOLD'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Last Date Sold'
,p_column_type=>'DATE'
,p_tz_dependent=>'Y'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4115782126107212037)
,p_db_column_name=>'TAGS'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'Tags'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(7347296107354051501)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_type=>'REPORT'
,p_report_alias=>'4870199'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>15
,p_view_mode=>'REPORT'
,p_report_columns=>'DETAIL_IMG:PRODUCT_NAME:CATEGORY:PRODUCT_AVAIL:LIST_PRICE:UNITS:SALES:CUSTOMERS:'
,p_sort_column_1=>'PRODUCT_NAME'
,p_sort_direction_1=>'ASC'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(7646855500059739805)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(7471144805461572136)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(1259816830774282015)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create Product'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.:6:P6_BRANCH:3'
,p_icon_css_classes=>'fa-chevron-right'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(1398418358373879128)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(7347294718082050746)
,p_button_name=>'RESET'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(1259816830774282015)
,p_button_image_alt=>'Reset'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:&APP_PAGE_ID.:&SESSION.::&DEBUG.:&APP_PAGE_ID.,RIR::'
,p_icon_css_classes=>'fa-undo'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(7646855715894739807)
,p_branch_name=>'Go To Page 6'
,p_branch_action=>'f?p=&FLOW_ID.:6:&SESSION.::&DEBUG.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(7646855500059739805)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(4115638633840925121)
,p_computation_sequence=>10
,p_computation_item=>'LAST_VIEW'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'3'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(394892219736667540)
,p_name=>'Create Product - Dialog Closed actions'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(7646855500059739805)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(394892522294667543)
,p_event_id=>wwv_flow_api.id(394892219736667540)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(7347294718082050746)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(394900737755811019)
,p_name=>'Product Report - Dialog Closed actions'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(7347294718082050746)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(394901034257811020)
,p_event_id=>wwv_flow_api.id(394900737755811019)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(7347294718082050746)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(679393462064601105)
,p_name=>'Fix icon view of Products IRR'
,p_event_sequence=>30
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(679393764635601108)
,p_event_id=>wwv_flow_api.id(679393462064601105)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$(''table.a-IRR-iconViewTable td'').attr(''align'',''middle'');'
,p_stop_execution_on_error=>'Y'
);
end;
/
