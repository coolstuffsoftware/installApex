prompt --application/pages/page_00199
begin
wwv_flow_api.create_page(
 p_id=>199
,p_user_interface_id=>wwv_flow_api.id(1671917025726579211)
,p_name=>'Global Page - jQuery Mobile Smartphone'
,p_page_mode=>'NORMAL'
,p_step_title=>'Global Page - jQuery Mobile Smartphone'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_group_id=>wwv_flow_api.id(1679080918635229175)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'D'
,p_cache_mode=>'NOCACHE'
,p_last_upd_yyyymmddhh24miss=>'20150309170328'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(923705251630642573)
,p_plug_name=>'Mobile Styles'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY_3'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<style>',
'div.sideCartItem{padding:8px 8px 0 8px;font:normal 11px/14px Arial,sans-serif;} ',
'div.sideCartItem a{color:#000;} ',
'div.sideCartItem strong,div.sideCartItem span{display:block;text-align:right;padding:8px 0 0 0;} ',
'div.sideCartItem span{padding:4px 0 0 0;} ',
'div.sideCartItem span.subtotal{font-weight:bold;} ',
'div.sideCartItem p{margin:4px 0 0 0;padding:0 0 8px 0;font:normal 11px/14px Arial,sans-serif;position:relative;} ',
'div.sideCartItem p span{padding:0;font-weight:bold;text-align: right;} ',
'div.sideCartTotal{border-top:1px solid #FFF;margin-top:8px;padding:8px;border-top:1px dotted #AAA;} ',
'div.sideCartTotal span{display:block;text-align:right;font:normal 11px/14px Arial,sans-serif;padding:0 0 4px 0;} ',
'div.sideCartTotal p{padding:0;margin:0;font:normal 11px/14px Arial,sans-serif;position:relative;} ',
'div.sideCartTotal p.sideCartTotal{font:bold 12px/14px Arial,sans-serif;padding:8px 0 0 0;} ',
'div.sideCartTotal p.sideCartTotal span{font:bold 12px/14px Arial,sans-serif;padding:8px 0 0 0;} ',
'div.sideCartTotal p span{padding:0;position:absolute;right:0;top:0;} ',
'div.demoCustomerInfo{}',
'div.demoCustomerInfo strong{font:bold 12px/16px Arial,sans-serif;display:block;width:120px;}',
'div.demoCustomerInfo p{display:block;margin:0; font: normal 12px/16px Arial, sans-serif;}',
'div.demoProducts{clear:both;margin:16px 0 0 0;padding:0 8px 0 0;}',
'div.demoProducts table{border:1px solid #CCC;border-bottom:none;}',
'div.demoProducts table th{background-color:#DDD;color:#000;font:bold 12px/16px Arial,sans-serif;padding:4px 10px;text-align:right;border-bottom:1px solid #CCC;}',
'div.demoProducts table td{border-bottom:1px solid #CCC;font:normal 12px/16px Arial,sans-serif;padding:4px 10px;text-align:right;}',
'div.demoProducts table td a{color:#000;}',
'div.demoProducts .left{text-align:left;}',
'div.demoCurrentOrder{margin:16px 0 0 0; border-left: 1px solid #CCC; padding: 0 0 0 8px}',
'strong.demoTitle{font:bold 12px/16px Arial,sans-serif;display:block;padding: 4px 10px; background-color: #DDD; border: 1px solid #CCC}',
'a.demoAddtoCart {',
'display: block;',
'float: right;',
'padding: 2px 6px;',
'background-color: #CCC;',
'color: #FFF;',
'text-decoration: none;',
'-moz-border-radius: 4px;',
'-webkit-border-radius: 4px;',
'	}',
'a.demoAddtoCart:hover {background-color: #80A2BB; color: #FFF}',
'		</style>'))
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1676861407867704605)
,p_plug_name=>'Header'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1609471190071416176)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY_3'
,p_plug_query_row_template=>1
,p_plug_display_condition_type=>'CURRENT_PAGE_NOT_IN_CONDITION'
,p_plug_display_when_condition=>'1001'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1677107106939312876)
,p_plug_name=>'Footer'
,p_region_css_classes=>'ui-bar'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1609470724008416174)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY_3'
,p_plug_query_row_template=>1
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1677302919925833620)
,p_plug_name=>'Footer Controls'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="text-align:center"'
,p_plug_template=>wwv_flow_api.id(1609470724008416174)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY_3'
,p_list_id=>wwv_flow_api.id(1677302108258833618)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(1609473074074416185)
,p_plug_query_row_template=>1
,p_plug_display_condition_type=>'CURRENT_PAGE_NOT_IN_CONDITION'
,p_plug_display_when_condition=>'1001'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(1677233315156608552)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(1676861407867704605)
,p_button_name=>'MENU'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1609474636193416198)
,p_button_image_alt=>'Menu'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_button_cattributes=>'data-icon="bars" data-iconpos="notext" data-direction="reverse"'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(1609534576932575341)
,p_name=>'open panel'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(1677233315156608552)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1609534844976575342)
,p_event_id=>wwv_flow_api.id(1609534576932575341)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$.mobile.activePage.find(''#menupanel'').panel("open");'
,p_stop_execution_on_error=>'Y'
);
end;
/
