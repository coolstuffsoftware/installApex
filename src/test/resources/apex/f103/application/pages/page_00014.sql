prompt --application/pages/page_00014
begin
wwv_flow_api.create_page(
 p_id=>14
,p_user_interface_id=>wwv_flow_api.id(1519898999322209702)
,p_tab_set=>'TS1'
,p_name=>'Order Summary'
,p_page_mode=>'MODAL'
,p_step_title=>'&APP_NAME. - Order Summary'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_group_id=>wwv_flow_api.id(1679080816211228466)
,p_step_template=>wwv_flow_api.id(1259793923434281919)
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
 p_id=>wwv_flow_api.id(684565890677462139)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1259797707782281943)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(7508369712547742666)
,p_plug_name=>'Order Header'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="margin: 10px 10px 0;"'
,p_plug_template=>wwv_flow_api.id(1259796920908281940)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'    procedure draw_customer_row',
'    (',
'        p_first_name in varchar2,',
'        p_last_name  in varchar2,',
'        p_address1   in varchar2,',
'        p_address2   in varchar2,',
'        p_city       in varchar2,',
'        p_state      in varchar2,',
'        p_zipcode    in varchar2',
'    )',
'    is',
'    begin',
'        htp.p(apex_escape.html(p_first_name) || '' '' || apex_escape.html(p_last_name) || ''<br />'');',
'        htp.p(apex_escape.html(p_address1) || ''<br />'');',
'        if p_address2 is not null then',
'          htp.p(apex_escape.html(p_address2) || ''<br />'');',
'        end if;',
'        htp.p(apex_escape.html(p_city) || '', '' || apex_escape.html(p_state) || ''  '' || apex_escape.html(p_zipcode) || ''<br /><br />'');',
'    end;',
'begin',
'    if :P11_CUSTOMER_OPTIONS = ''NEW'' then',
'        for x in (select c001 as cust_first_name,',
'                         c002 as cust_last_name, ',
'                         c003 as cust_street_address1, ',
'                         c004 as cust_street_address2, ',
'                         c005 as cust_city, ',
'                         c006 as cust_state, ',
'                         c007 as cust_postal_code',
'                      from apex_collections',
'                     where collection_name = ''SDBA_CUSTOMERS''',
'                 )',
'        loop',
'            draw_customer_row',
'            (',
'                p_first_name => x.cust_first_name,',
'                p_last_name  => x.cust_last_name,',
'                p_address1   => x.cust_street_address1,',
'                p_address2   => x.cust_street_address2,',
'                p_city       => x.cust_city,',
'                p_state      => x.cust_state,',
'                p_zipcode    => x.cust_postal_code',
'            );',
'        end loop;',
'    else',
'        for x in (select c.cust_first_name,',
'                         c.cust_last_name, ',
'                         cust_street_address1, ',
'                         cust_street_address2, ',
'                         cust_city, ',
'                         cust_state, ',
'                         cust_postal_code ',
'                   from demo_customers c',
'                  where c.customer_id = :P14_CUSTOMER_ID)',
'        loop',
'            draw_customer_row',
'            (',
'                p_first_name => x.cust_first_name,',
'                p_last_name  => x.cust_last_name,',
'                p_address1   => x.cust_street_address1,',
'                p_address2   => x.cust_street_address2,',
'                p_city       => x.cust_city,',
'                p_state      => x.cust_state,',
'                p_zipcode    => x.cust_postal_code',
'            );',
'        end loop;',
'    end if;',
'end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(7508385226324841237)
,p_name=>'Order Lines'
,p_template=>wwv_flow_api.id(1259803633802281962)
,p_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_display_point=>'BODY'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select (select product_name from demo_product_info p where product_id = c001) as product_name,',
'       c002 as unit_price,',
'       c003 as quantity,',
'       (c002 * c003) as total_cost',
'  from apex_collections',
' where collection_name = ''SDBA_ORDER_ITEMS''',
'   and c003 <> 0',
' order by 1'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_ajax_enabled=>'N'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(1259808956189281975)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_no_data_found=>'no data found'
,p_query_row_count_max=>500
,p_report_total_text_format=>'Report Total'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(7508387307539854815)
,p_query_column_id=>1
,p_column_alias=>'PRODUCT_NAME'
,p_column_display_sequence=>1
,p_column_heading=>'Product'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(7508385718585841259)
,p_query_column_id=>2
,p_column_alias=>'UNIT_PRICE'
,p_column_display_sequence=>2
,p_column_heading=>'Unit Price'
,p_use_as_row_header=>'N'
,p_column_format=>'FML999G999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'LEFT'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(7508385809197841259)
,p_query_column_id=>3
,p_column_alias=>'QUANTITY'
,p_column_display_sequence=>3
,p_column_heading=>'Quantity'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(399627525711328184)
,p_query_column_id=>4
,p_column_alias=>'TOTAL_COST'
,p_column_display_sequence=>4
,p_column_heading=>'Total Cost'
,p_use_as_row_header=>'N'
,p_column_format=>'FML999G999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(7508467511368007324)
,p_plug_name=>'Order Progress'
,p_component_template_options=>'#DEFAULT#:t-WizardSteps--displayCurrentLabelOnly'
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_01'
,p_list_id=>wwv_flow_api.id(7488115622509571106)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(1259815938281282002)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(1923903326841293270)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(684565890677462139)
,p_button_name=>'CANCEL'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1259817292296282017)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(688644354317649910)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(684565890677462139)
,p_button_name=>'PLACE_ORDER'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(1259816830774282015)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Place Order'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_redirect_url=>'javascript:apex.confirm(''Are you sure you want to place this order?'',''PLACE_ORDER'');'
,p_icon_css_classes=>'fa-chevron-right'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(7513864602205827394)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(684565890677462139)
,p_button_name=>'PREVIOUS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1259816755107282011)
,p_button_image_alt=>'Previous'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_button_redirect_url=>'f?p=&APP_ID.:12:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-chevron-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(688647389698734658)
,p_branch_name=>'Go to Confirmation'
,p_branch_action=>'f?p=&APP_ID.:8:&SESSION.::&DEBUG.:8:P8_ORDER_ID:&P14_ORDER_ID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(688644354317649910)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(689309601545760921)
,p_branch_name=>'Previous'
,p_branch_action=>'f?p=&APP_ID.:12:&SESSION.::&DEBUG.:::'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(7513864602205827394)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1923902864617293265)
,p_name=>'P14_CUSTOMER_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(7508385226324841237)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7508364523020726780)
,p_name=>'P14_ORDER_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(7508385226324841237)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(688646913154731039)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Place Order'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'    l_order_id    number;',
'    l_customer_id varchar2(30) := :P11_CUSTOMER_ID;',
'begin',
'',
'    -- Create New Customer',
'    if :P11_CUSTOMER_OPTIONS = ''NEW'' then',
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
'            :P11_CUST_FIRST_NAME,',
'            :P11_CUST_LAST_NAME,',
'            :P11_CUST_STREET_ADDRESS1,',
'            :P11_CUST_STREET_ADDRESS2,',
'            :P11_CUST_CITY,',
'            :P11_CUST_STATE,',
'            :P11_CUST_POSTAL_CODE,',
'            :P11_CUST_EMAIL,',
'            :P11_PHONE_NUMBER1,',
'            :P11_PHONE_NUMBER2,',
'            :P11_URL,',
'            :P11_CREDIT_LIMIT,',
'            :P11_TAGS)',
'          returning customer_id into l_customer_id;',
'',
'          :P11_CUSTOMER_ID := l_customer_id;',
'    end if;',
'',
'    -- Insert a row into the Order Header table',
'    insert into demo_orders(customer_id, order_total, order_timestamp, user_name)',
'       values(l_customer_id, null, systimestamp, upper(:APP_USER)) returning order_id into l_order_id;',
'    commit;',
'',
'    -- Loop through the ORDER collection and insert rows into the Order Line Item table',
'    for i in',
'    (',
'        select c001 as product_id,',
'               c002 as unit_price,',
'               c003 as quantity',
'          from apex_collections',
'         where collection_name = ''SDBA_ORDER_ITEMS''',
'           and c003 <> 0',
'         order by 2',
'    )',
'    loop',
'       insert into demo_order_items(order_item_id, order_id, product_id, unit_price, quantity) ',
'         values (null, l_order_id, i.product_id, i.unit_price, i.quantity);',
'    end loop;',
'    commit;',
'',
'    -- Set the item P14_ORDER_ID to the order which was just placed',
'    :P14_ORDER_ID := l_order_id;',
'',
'    -- Truncate the collection after the order has been placed',
'    apex_collection.truncate_collection(p_collection_name => ''SDBA_CUSTOMERS'');',
'    apex_collection.truncate_collection(p_collection_name => ''SDBA_ORDER_ITEMS'');',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(688644354317649910)
,p_process_success_message=>'Order placed'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(1923903483425293271)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'New'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(1923903326841293270)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(688643068521620653)
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
end;
/
