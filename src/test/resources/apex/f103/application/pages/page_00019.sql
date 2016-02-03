prompt --application/pages/page_00019
begin
wwv_flow_api.create_page(
 p_id=>19
,p_user_interface_id=>wwv_flow_api.id(1519898999322209702)
,p_tab_set=>'TS1'
,p_name=>'Product Order Tree'
,p_page_mode=>'NORMAL'
,p_step_title=>'&APP_NAME. - Product Order Tree'
,p_step_sub_title=>'Orders by Category'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_group_id=>wwv_flow_api.id(1679080816211228466)
,p_step_template=>wwv_flow_api.id(1259767801430281840)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'No help is available for this page.'
,p_last_upd_yyyymmddhh24miss=>'20150316121036'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(7514231676399625378)
,p_plug_name=>'Product Orders'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(1259803633802281962)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'with data as (',
'select ''M'' as link_type,',
'       null as parent,',
'       ''All Categories'' as id,',
'       ''All Categories'' as name,',
'       null as sub_id',
'  from demo_product_info',
'union',
'select distinct(''C'') as link_type,',
'       ''All Categories'' as parent,',
'       category as id,',
'       category as name,',
'       null as sub_id',
'  from demo_product_info',
'union',
'select ''P'' as link_type,',
'       category parent,',
'       to_char(product_id) id,',
'       product_name as name,',
'       product_id as sub_id',
'  from demo_product_info',
'union',
'select ''O'' as link_type,',
'       to_char(product_id) as parent,',
'       null as id,',
'       (select c.cust_first_name || '' '' || c.cust_last_name  ',
'          from demo_customers c, demo_orders o',
'         where c.customer_id = o.customer_id',
'           and o.order_id    = oi.order_id ) || '', ordered ''||to_char(oi.quantity) as name,',
'       order_id as sub_id',
'  from demo_order_items oi',
'  where oi.quantity != 0',
')',
'select case when connect_by_isleaf = 1 then 0',
'            when level = 1             then 1',
'            else                           -1',
'       end as status, ',
'       level, ',
'       name as title, ',
'       null as icon, ',
'       id as value, ',
'       ''View'' as tooltip, ',
'       case when link_type = ''M''',
'            then apex_util.prepare_url(''f?p=''||:APP_ID||'':3:''||:APP_SESSION||''::NO:RIR'')',
'            when link_type = ''C''',
'            then apex_util.prepare_url(''f?p=''||:APP_ID||'':3:''||:APP_SESSION||''::NO:CIR:IR_CATEGORY:''',
'                 ||name)',
'            when link_type = ''P''',
'            then apex_util.prepare_url(''f?p=''||:APP_ID||'':6:''||:APP_SESSION||''::NO::P6_PRODUCT_ID,P6_BRANCH:''',
'                 ||sub_id||'',19'')',
'            when link_type = ''O''',
'            then apex_util.prepare_url(''f?p=''||:APP_ID||'':29:''||:APP_SESSION||''::NO::P29_ORDER_ID,P29_LAST_PAGE:''',
'                 || sub_id || '',19'')',
'            else null',
'            end as link ',
'from data',
'start with parent is null',
'connect by prior id = parent',
'order siblings by name'))
,p_plug_source_type=>'NATIVE_JSTREE'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'S'
,p_attribute_04=>'STATIC'
,p_attribute_05=>'View'
,p_attribute_06=>'orderTree'
,p_attribute_07=>'APEX_TREE'
,p_attribute_08=>'a-Icon'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(7514232292489625395)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(7471144805461572136)
,p_button_name=>'EXPAND_ALL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1259817292296282017)
,p_button_image_alt=>'Expand All'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(7514232075913625390)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(7471144805461572136)
,p_button_name=>'CONTRACT_ALL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1259817292296282017)
,p_button_image_alt=>'Collapse All'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(1404666510690741537)
,p_name=>'Auto-expand on page load'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1404666747319741539)
,p_event_id=>wwv_flow_api.id(1404666510690741537)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.widget.tree.expand_all(''tree7508038848540739742'');'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(1501363704327030248)
,p_name=>'collapse'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(7514232075913625390)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1501363729181030249)
,p_event_id=>wwv_flow_api.id(1501363704327030248)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_TREE_COLLAPSE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(7514231676399625378)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(1501363870582030250)
,p_name=>'expand'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(7514232292489625395)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1501363959774030251)
,p_event_id=>wwv_flow_api.id(1501363870582030250)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_TREE_EXPAND'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(7514231676399625378)
,p_stop_execution_on_error=>'Y'
);
end;
/
