prompt --application/pages/page_00217
begin
wwv_flow_api.create_page(
 p_id=>217
,p_user_interface_id=>wwv_flow_api.id(1671917025726579211)
,p_name=>'Select Items'
,p_page_mode=>'NORMAL'
,p_step_title=>'&APP_NAME. - Create Order'
,p_step_sub_title=>'Enter New Order'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_group_id=>wwv_flow_api.id(1679080816211228466)
,p_step_template=>wwv_flow_api.id(1609467824370416158)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_last_upd_yyyymmddhh24miss=>'20150309170328'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1318781589103833237)
,p_plug_name=>'Select Items'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1609472717867416182)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY_3'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'  l_customer_id varchar2(30) := :P216_CUSTOMER_ID;',
'begin',
'--',
'-- display customer information',
'--',
'sys.htp.p(''<div class="demoCustomerInfo">'');',
'if :P216_CUSTOMER_OPTIONS = ''EXISTING'' then',
'  for x in (select * from demo_customers where customer_id = l_customer_id) loop',
'    sys.htp.p(''<div class="demoCustomerInfo">'');',
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
'  sys.htp.p(apex_escape.html(:P216_CUST_FIRST_NAME) || '' '' || apex_escape.html(:P216_CUST_LAST_NAME) || ''<br />'');',
'  sys.htp.p(apex_escape.html(:P216_CUST_STREET_ADDRESS1) || ''<br />'');',
'  if :P216_CUST_STREET_ADDRESS2 is not null then',
'    sys.htp.p(apex_escape.html(:P216_CUST_STREET_ADDRESS2) || ''<br />'');',
'  end if;',
'  sys.htp.p(apex_escape.html(:P216_CUST_CITY) || '', '' ||',
'  apex_escape.html(:P216_CUST_STATE) || ''  '' ||',
'  apex_escape.html(:P216_CUST_POSTAL_CODE));',
'  sys.htp.p(''</p>'');',
'end if;',
'sys.htp.p(''</div>'');',
'--',
'-- display products',
'--',
'sys.htp.p(''<div class="demoProducts" >'');',
'sys.htp.p(''<table width="100%" cellspacing="0" cellpadding="0" border="0">',
'<thead>',
'<tr><th class="left">Product</th><th>Price</th><th></th></tr>',
'</thead>',
'<tbody>'');',
'for c1 in (select product_id, product_name,  list_price, ''Add to Cart'' add_to_order',
'from demo_product_info',
'where product_avail = ''Y''',
'order by product_name) loop',
'   sys.htp.p(''<tr><td class="left">'' || apex_escape.html(c1.product_name)||''</td><td>''||trim(to_char(c1.list_price,''999G999G990D00''))||',
'        ''</td><td><a href="''||apex_util.prepare_url(''f?p=&APP_ID.:217:''||:app_session||'':ADD:::P217_PRODUCT_ID:''||',
'        c1.product_id)||''" class="uButton"><span>Add</span></a></td></tr>'');',
'end loop;',
'sys.htp.p(''</tbody></table>'');',
'sys.htp.p(''</div>'');',
'--',
'-- display current order',
'--',
'sys.htp.p(''<div class="demoProducts" >'');',
'sys.htp.p(''<table width="100%" cellspacing="0" cellpadding="0" border="0">',
'<thead>',
'<tr><th class="left">Current Order</th></tr>',
'</thead>',
'</table>',
'<table width="100%" cellspacing="0" cellpadding="0" border="0">',
'<tbody>'');',
'',
'declare',
'    c number := 0; t number := 0;',
'begin',
'-- loop over cart values',
'for c1 in (select c001 pid, c002 i, to_number(c003) p, count(c002) q, sum(c003) ep,  ''Remove'' remove',
'from apex_collections',
'where collection_name = ''ORDER''',
'group by c001, c002, c003',
'order by c002)',
'loop',
'sys.htp.p(''<div class="sideCartItem"><a href="''||',
'    apex_util.prepare_url(''f?p=&APP_ID.:217:&SESSION.:REMOVE:::P217_PRODUCT_ID:''||apex_escape.html(c1.pid))||',
'    ''"><img src="#IMAGE_PREFIX#delete.gif" alt="Remove from cart" title="Remove from cart" /></a>&nbsp;&nbsp;',
'    ''||apex_escape.html(c1.i)||''',
'    <span>''||trim(to_char(c1.p,''$999G999G999D00''))||''</span>',
'    <span>Quantity: ''||c1.q||''</span>',
'    <span class="subtotal">Subtotal: ''||trim(to_char(c1.ep,''$999G999G999D00''))||''</span>',
'</div>'');',
'   c := c + 1;',
'   t := t + c1.ep;',
'',
'end loop;',
'sys.htp.p(''</tbody></table>'');',
'',
'if c > 0 then',
'    sys.htp.p(''<div class="sideCartTotal">',
'    <p>Items: <span>''||c||''</span></p>',
'    <p class="sideCartTotal">Total: <span>''||trim(to_char(t,''$999G999G999D00''))||''</span></p>',
'</div>'');',
'else',
'    sys.htp.p(''<p class="sideCartTotal">You have no items in your current order.</p>'');',
'end if;',
'end;',
'sys.htp.p(''</div>'');',
'end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_list_template_id=>wwv_flow_api.id(1609473500002416188)
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_prn_template_id=>wwv_flow_api.id(1671917120563579211)
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1318819400995870401)
,p_plug_name=>'Butons'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1609472224655416180)
,p_plug_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY_3'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1319030002557009272)
,p_plug_name=>'Max Quantity'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY_3'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_plug_display_condition_type=>'FUNCTION_BODY'
,p_plug_display_when_condition=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'begin',
'  for c1 in (select c001 pid, sum(c004) prod_count',
'             from wwv_flow_collections',
'             where collection_name = ''ORDER''',
'             group by c001',
'            ) loop',
'    if c1.prod_count >= 10 then',
'      return true;',
'    end if;',
'  end loop;',
'  return false;',
'end;'))
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(1318819786800870402)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(1318819400995870401)
,p_button_name=>'NEXT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1609474636193416198)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Place Order'
,p_button_position=>'BOTTOM'
,p_button_cattributes=>'label="NEXT"'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(1318950908289350027)
,p_branch_name=>'Next'
,p_branch_action=>'f?p=&APP_ID.:218:&SESSION.::&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1318781402400833237)
,p_name=>'P217_CUSTOMER_NAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(1318781589103833237)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>64
,p_cMaxlength=>2000
,p_cHeight=>1
,p_cAttributes=>'nowrap'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1318781812523833238)
,p_name=>'P217_PRODUCT_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(1318781589103833237)
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>64
,p_cMaxlength=>2000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1319030381435031080)
,p_name=>'P217_MAX_VALUE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(1319030002557009272)
,p_post_element_text=>'Quantity for each Product must be between 1 and 10'
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
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(1318782295587833239)
,p_computation_sequence=>10
,p_computation_item=>'P217_CUSTOMER_NAME'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>'select cust_first_name || '' '' || cust_last_name from demo_customers where customer_id = :P216_CUSTOMER_ID'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(1319024602994762709)
,p_validation_name=>'Product must be selected'
,p_validation_sequence=>10
,p_validation=>'apex_collection.collection_member_count(''ORDER'') >= 1'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'At least one product must be added.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(1318819786800870402)
,p_only_for_changed_rows=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(1318782403698833239)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Place Order'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'    l_order_id    number;',
'    l_customer_id varchar2(30) := :P216_CUSTOMER_ID;',
'begin',
'',
'    -- Create New Customer',
'    if :P216_CUSTOMER_OPTIONS = ''NEW'' then',
'        insert into DEMO_CUSTOMERS (',
'            CUST_FIRST_NAME,',
'            CUST_LAST_NAME,',
'            CUST_STREET_ADDRESS1,',
'            CUST_STREET_ADDRESS2,',
'            CUST_CITY,',
'            CUST_STATE,',
'            CUST_POSTAL_CODE,',
'            CUST_EMAIL,',
'            PHONE_NUMBER1,',
'            PHONE_NUMBER2,',
'            URL,',
'            CREDIT_LIMIT,',
'            TAGS)',
'          values (',
'            :P216_CUST_FIRST_NAME,',
'            :P216_CUST_LAST_NAME,',
'            :P216_CUST_STREET_ADDRESS1,',
'            :P216_CUST_STREET_ADDRESS2,',
'            :P216_CUST_CITY,',
'            :P216_CUST_STATE,',
'            :P216_CUST_POSTAL_CODE,',
'            :P216_CUST_EMAIL,',
'            :P216_PHONE_NUMBER1,',
'            :P216_PHONE_NUMBER2,',
'            :P216_URL,',
'            :P216_CREDIT_LIMIT,',
'            :P216_TAGS)',
'          returning customer_id into l_customer_id;',
'',
'          :P216_CUSTOMER_ID := l_customer_id;',
'    end if;',
'',
'    -- Insert a row into the Order Header table',
'    insert into demo_orders(customer_id, order_total, order_timestamp, user_name)',
'       values(l_customer_id, null, systimestamp, upper(:APP_USER)) returning order_id into l_order_id;',
'    commit;',
'',
'    -- Loop through the ORDER collection and insert rows into the Order Line Item table',
'    for x in (select c001, c003, sum(c004) c004 from apex_collections ',
'               where collection_name = ''ORDER'' group by c001, c003)',
'    loop',
'        insert into demo_order_items(order_item_id, order_id, product_id, unit_price, quantity) ',
'             values (null, l_order_id, to_number(x.c001), to_number(x.c003),to_number(x.c004));',
'    end loop;',
'    commit;',
'',
'    -- Set the item P218_ORDER_ID to the order which was just placed',
'    :P218_ORDER_ID := l_order_id;',
'',
'    -- Truncate the collection after the order has been placed',
'    apex_collection.truncate_collection(p_collection_name => ''ORDER'');',
'end;'))
,p_process_when_button_id=>wwv_flow_api.id(1318819786800870402)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(1318782607499833241)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Add Product to the ORDER Collection'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'  l_count number := 0;',
'begin',
'for x in (select p.rowid, p.* from demo_product_info p where product_id = :P217_PRODUCT_ID)',
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
,p_process_error_message=>'Quantity must be between 1 and 10'
,p_process_when=>'ADD'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(1318782783479833241)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Remove Product from the ORDER Collection'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'for x in ',
'  (select seq_id, c001 from apex_collections ',
'    where collection_name = ''ORDER'' and c001 = :P217_PRODUCT_ID)',
'loop',
'apex_collection.delete_member(p_collection_name => ''ORDER'', p_seq => x.seq_id);',
'end loop;'))
,p_process_when=>'REMOVE'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
end;
/
