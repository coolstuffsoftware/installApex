prompt --application/pages/page_00012
begin
wwv_flow_api.create_page(
 p_id=>12
,p_user_interface_id=>wwv_flow_api.id(1519898999322209702)
,p_name=>'Order Items'
,p_page_mode=>'MODAL'
,p_step_title=>'&APP_NAME. - Order Items'
,p_step_sub_title=>'Enter New Order'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_group_id=>wwv_flow_api.id(1679080816211228466)
,p_inline_css=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
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
'div.demoCustomerInfo{margin: 10px 10px 0;}',
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
'div.innerMessage p {',
'    padding: 0 0 10px;',
'}'))
,p_step_template=>wwv_flow_api.id(1259793923434281919)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'600'
,p_dialog_width=>'500'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_last_upd_yyyymmddhh24miss=>'20150323121142'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(393050827717288953)
,p_name=>'Select Items'
,p_template=>wwv_flow_api.id(1259803633802281962)
,p_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noBorder:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight:t-Report--horizontalBorders'
,p_display_point=>'BODY'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select p.product_id, ',
'       p.product_name, ',
'       p.list_price, ',
'       apex_item.hidden(1, p.product_id) ||',
'          apex_item.hidden(2, p.list_price) || ',
'          apex_item.select_list(',
'              p_idx           =>   3,',
'              p_value         =>   nvl(c.c003,''Add to Cart''),',
'              p_list_values   =>   ''1,2,3,4,5,6,7,8,9,10'',',
'              p_show_null     =>   ''YES'',',
'              p_null_value    =>   0,',
'              p_null_text     =>   ''0'',',
'              p_item_id       =>   ''f03_#ROWNUM#'',',
'              p_item_label    =>   ''f03_#ROWNUM#'',',
'              p_show_extra    =>   ''NO'') "add_to_cart"',
'from demo_product_info p, apex_collections c',
'where p.product_avail = ''Y''',
'  and c.collection_name (+) = ''SDBA_ORDER_ITEMS''',
'  and c.c001 (+) = p.product_id'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_ajax_enabled=>'Y'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(1259808956189281975)
,p_query_num_rows=>150
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(393051071132288955)
,p_query_column_id=>1
,p_column_alias=>'PRODUCT_ID'
,p_column_display_sequence=>1
,p_column_heading=>'Product ID'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(393051185414288956)
,p_query_column_id=>2
,p_column_alias=>'PRODUCT_NAME'
,p_column_display_sequence=>2
,p_column_heading=>'Product'
,p_column_link=>'f?p=&APP_ID.:20:&SESSION.::&DEBUG.::P20_PRODUCT_ID:#PRODUCT_ID#'
,p_column_linktext=>'#PRODUCT_NAME#'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(393051286250288957)
,p_query_column_id=>3
,p_column_alias=>'LIST_PRICE'
,p_column_display_sequence=>3
,p_column_heading=>'Price'
,p_use_as_row_header=>'N'
,p_column_format=>'FML999G999G999G999G990D00'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_lov_show_nulls=>'NO'
,p_derived_column=>'N'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(399665679270630590)
,p_query_column_id=>4
,p_column_alias=>'add_to_cart'
,p_column_display_sequence=>4
,p_column_heading=>'Add To Cart'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(395244399447334649)
,p_plug_name=>'Order Progress'
,p_component_template_options=>'#DEFAULT#:t-WizardSteps--displayCurrentLabelOnly'
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_01'
,p_list_id=>wwv_flow_api.id(7488115622509571106)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(1259815938281282002)
,p_plug_query_row_template=>1
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(395244754921334649)
,p_plug_name=>'Select Items'
,p_component_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'  l_customer_id varchar2(30) := :P11_CUSTOMER_ID;',
'begin',
'--',
'-- display customer information',
'--',
'sys.htp.p(''<div class="demoCustomerInfo">'');',
'if :P11_CUSTOMER_OPTIONS = ''EXISTING'' then',
'  for x in (select * from demo_customers where customer_id = l_customer_id) loop',
'    sys.htp.p(''<strong>Customer:</strong>'');',
'    sys.htp.p(''<p>'');',
'    sys.htp.p(apex_escape.html(x.cust_first_name) || '' '' ||',
'    apex_escape.html(x.cust_last_name) || ''<br />'');',
'    sys.htp.p(apex_escape.html(x.cust_street_address1) || ''<br />'');',
'    if x.cust_street_address2 is not null then',
'      sys.htp.p(apex_escape.html(x.cust_street_address2) || ''<br />'');',
'    end if;',
'    sys.htp.p(apex_escape.html(x.cust_city) || '', '' ||',
'    apex_escape.html(x.cust_state) || ''  '' ||',
'    apex_escape.html(x.cust_postal_code));',
'    sys.htp.p(''</p>'');',
'  end loop;',
'else',
'  sys.htp.p(''<strong>Customer:</strong>'');',
'  sys.htp.p(''<p>'');',
'  sys.htp.p(apex_escape.html(:P11_CUST_FIRST_NAME) || '' '' || apex_escape.html(:P11_CUST_LAST_NAME) || ''<br />'');',
'  sys.htp.p(apex_escape.html(:P11_CUST_STREET_ADDRESS1) || ''<br />'');',
'  if :P11_CUST_STREET_ADDRESS2 is not null then',
'    sys.htp.p(apex_escape.html(:P11_CUST_STREET_ADDRESS2) || ''<br />'');',
'  end if;',
'  sys.htp.p(apex_escape.html(:P11_CUST_CITY) || '', '' ||',
'  apex_escape.html(:P11_CUST_STATE) || ''  '' ||',
'  apex_escape.html(:P11_CUST_POSTAL_CODE));',
'  sys.htp.p(''</p>'');',
'end if;',
'sys.htp.p(''<br></div>'');',
'end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(661793329359364288)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1259797707782281943)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(1923903121965293267)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(661793329359364288)
,p_button_name=>'CANCEL'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1259817292296282017)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(395243742911334648)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(661793329359364288)
,p_button_name=>'NEXT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(1259816830774282015)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Next'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'fa-chevron-right'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(395243992410334649)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(661793329359364288)
,p_button_name=>'PREVIOUS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1259816755107282011)
,p_button_image_alt=>'Previous'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-chevron-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(395247103392334657)
,p_branch_name=>'Go To Page 14'
,p_branch_action=>'f?p=&APP_ID.:14:&SESSION.::&DEBUG.::P14_CUSTOMER_ID:&P12_CUSTOMER_ID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(395243742911334648)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(393051612923288960)
,p_branch_name=>'Branch to Self'
,p_branch_action=>'f?p=&APP_ID.:12:&SESSION.::&DEBUG.::P12_BRANCH:11'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>15
,p_branch_condition_type=>'NEVER'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(395246670795334657)
,p_branch_name=>'Branch to Previous Page'
,p_branch_action=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.:::'
,p_branch_point=>'BEFORE_VALIDATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(395243992410334649)
,p_branch_sequence=>5
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(395244582865334649)
,p_name=>'P12_CUSTOMER_NAME'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(395244399447334649)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(395245021930334652)
,p_name=>'P12_PRODUCT_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(395244754921334649)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(395245143097334652)
,p_name=>'P12_BRANCH'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(395244754921334649)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1923902956682293266)
,p_name=>'P12_CUSTOMER_ID'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(395244399447334649)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(395245496466334652)
,p_computation_sequence=>10
,p_computation_item=>'P12_CUSTOMER_NAME'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>'select cust_first_name || '' '' || cust_last_name from demo_customers where customer_id = :P11_CUSTOMER_ID'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(395245690198334653)
,p_validation_name=>'Product must be selected'
,p_validation_sequence=>10
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'for i in 1..apex_application.g_f01.count',
'loop',
'    if apex_application.g_f03(i) is not null and apex_application.g_f03(i) != ''0'' then',
'        return true;',
'    end if;',
'end loop;',
'',
'return false;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'At least one product must be "added to cart".'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(395243742911334648)
,p_associated_item=>wwv_flow_api.id(395245021930334652)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(689315513399900069)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Populate Collections'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'    l_order_id    number;',
'    l_customer_id varchar2(30) := :P11_CUSTOMER_ID;',
'begin',
'    -- create collections',
'    --',
'    apex_collection.CREATE_OR_TRUNCATE_COLLECTION (''SDBA_CUSTOMERS'');',
'    apex_collection.CREATE_OR_TRUNCATE_COLLECTION (''SDBA_ORDER_ITEMS'');',
'',
'    -- Create New Customer',
'    if :P11_CUSTOMER_OPTIONS = ''NEW'' then',
'        apex_collection.add_member(',
'            p_collection_name => ''SDBA_CUSTOMERS'',',
'            p_c001            => :P11_CUST_FIRST_NAME,',
'            p_c002            => :P11_CUST_LAST_NAME,',
'            p_c003            => :P11_CUST_STREET_ADDRESS1,',
'            p_c004            => :P11_CUST_STREET_ADDRESS2,',
'            p_c005            => :P11_CUST_CITY,',
'            p_c006            => :P11_CUST_STATE,',
'            p_c007            => :P11_CUST_POSTAL_CODE,',
'            p_c008            => :P11_CUST_EMAIL,',
'            p_c009            => :P11_PHONE_NUMBER1,',
'            p_c010            => :P11_PHONE_NUMBER2,',
'            p_c011            => :P11_URL,',
'            p_c012            => :P11_CREDIT_LIMIT,',
'            p_c013            => :P11_TAGS',
'        );',
'    end if;',
'',
'    -- Loop through the ORDER collection and insert rows into the Order Line Item table',
'    for i in 1..apex_application.g_f01.count loop',
'        apex_collection.add_member(',
'            p_collection_name => ''SDBA_ORDER_ITEMS'',',
'            p_c001            => to_number(apex_application.g_f01(i)), -- product_id',
'            p_c002            => to_number(apex_application.g_f02(i)), -- unit_price',
'            p_c003            => to_number(apex_application.g_f03(i))  -- quantity',
'        );',
'    end loop;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(395243742911334648)
,p_process_when=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'  l_orders number := 0;',
'begin',
'',
'    for i in 1..apex_application.g_f01.count loop',
'        l_orders := l_orders + to_number(apex_application.g_f03(i));',
'    end loop;',
'',
'    if (l_orders = 0) then',
'        return false;',
'    else',
'        return true;',
'    end if;',
'end;'))
,p_process_when_type=>'FUNCTION_BODY'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(1923903272692293269)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close on Cancel'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(1923903121965293267)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(395246136642334656)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Add Product to the ORDER Collection'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'  l_count number := 0;',
'begin',
'for x in (select p.rowid, p.* from demo_product_info p where product_id = :P12_PRODUCT_ID)',
'loop',
'  select count(*) ',
'  into l_count',
'  from wwv_flow_collections',
'  where collection_name = ''ORDER''',
'  and c001 =  x.product_id;',
'  if l_count >= 10 then',
'    exit;',
'  end if;',
'  apex_collection.add_member(p_collection_name => ''ORDER'', ',
'    p_c001 => x.product_id, ',
'    p_c002 => x.product_name,',
'    p_c003 => x.list_price,',
'    p_c004 => 1,',
'    p_c010 => x.rowid);',
'end loop;',
'end;'))
,p_process_when=>'ADD'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(395245942567334656)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Remove Product from the ORDER Collection'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'for x in ',
'  (select seq_id, c001 from apex_collections ',
'    where collection_name = ''ORDER'' and c001 = :P12_PRODUCT_ID)',
'loop',
'apex_collection.delete_member(p_collection_name => ''ORDER'', p_seq => x.seq_id);',
'--htp.p(''removed an item'');',
'end loop;'))
,p_process_when=>'REMOVE'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
end;
/
