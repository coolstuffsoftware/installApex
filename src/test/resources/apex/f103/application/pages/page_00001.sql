prompt --application/pages/page_00001
begin
wwv_flow_api.create_page(
 p_id=>1
,p_user_interface_id=>wwv_flow_api.id(1519898999322209702)
,p_name=>'Sample Database Application'
,p_page_mode=>'NORMAL'
,p_step_title=>'&APP_NAME.'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_group_id=>wwv_flow_api.id(1679080816211228466)
,p_step_template=>wwv_flow_api.id(1259767801430281840)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'This is the Home Page of the Sample Database Application.  It is intended to be a sales dashboard of sorts - displaying some metrics which are derived in real-time from the database.',
'<p>',
'The <strong>My Quota</strong> region is a Flash chart type called  Dial Chart.  It is dynamically rendered based on a SQL Statement each time the page is viewed.  <strong>My Top Orders</strong> displays the top five orders for the currently signed in'
||' user, based on order total.  The <strong>Tasks</strong> region is an example of using a List to provide easy navigation to common tasks.'))
,p_last_upd_yyyymmddhh24miss=>'20150410120721'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(638211472489181375)
,p_name=>'Sales for this Month (Old)'
,p_template=>wwv_flow_api.id(1259803633802281962)
,p_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_display_point=>'BODY'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select sum(o.order_total) total_sales,',
'    count(distinct o.order_id) total_orders,',
'    count(distinct o.customer_id) total_customers',
'from demo_orders o',
'where order_timestamp >= to_date(to_char(sysdate,''YYYYMM'')||''01'',''YYYYMMDD'')'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_display_condition_type=>'NEVER'
,p_ajax_enabled=>'Y'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(1259806731956281967)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_query_break_cols=>'0'
,p_query_num_rows_type=>'0'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(638211557571181376)
,p_query_column_id=>1
,p_column_alias=>'TOTAL_SALES'
,p_column_display_sequence=>3
,p_column_heading=>'Total Sales'
,p_column_format=>'FML999G999G999G999G990'
,p_column_link=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.:RP,RIR,4:IRGTE_ORDER_DATE:&P1_THIS_MONTH.:'
,p_column_linktext=>'#TOTAL_SALES#'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(638211706129181377)
,p_query_column_id=>2
,p_column_alias=>'TOTAL_ORDERS'
,p_column_display_sequence=>1
,p_column_heading=>'Total Orders'
,p_column_format=>'999G999G999G999G999G990'
,p_column_link=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.:RP,RIR,4:IRGTE_ORDER_DATE:&P1_THIS_MONTH.:'
,p_column_linktext=>'#TOTAL_ORDERS#'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(661875496246918419)
,p_query_column_id=>3
,p_column_alias=>'TOTAL_CUSTOMERS'
,p_column_display_sequence=>2
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1392967163079666996)
,p_plug_name=>'Top Customers'
,p_region_css_classes=>'i-h300'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(1259803633802281962)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'SELECT',
'    b.cust_last_name || '', '' || b.cust_first_name as customer_name,',
'    ''fa-user'' as icon,',
'    nvl(SUM(a.ORDER_TOTAL),0) order_total,',
'    count(a.order_id) as order_cnt,',
'    b.customer_id id,',
'    b.CUST_STREET_ADDRESS1,',
'    b.CUST_STREET_ADDRESS2,',
'    b.CUST_CITY,',
'    b.CUST_STATE,',
'    b.CUST_POSTAL_CODE,',
'    b.CUST_EMAIL,',
'    b.PHONE_NUMBER1,',
'    b.PHONE_NUMBER2,',
'    b.CREDIT_LIMIT,',
'    b.tags',
'FROM',
'    demo_orders a,',
'    DEMO_CUSTOMERS b',
'WHERE',
'    a.customer_id = b.customer_id',
'GROUP BY',
'    b.customer_id,',
'    b.cust_last_name || '', '' || b.cust_first_name,',
'    b.CUST_STREET_ADDRESS1,',
'    b.CUST_STREET_ADDRESS2,',
'    b.CUST_CITY,',
'    b.CUST_STATE,',
'    b.CUST_POSTAL_CODE,',
'    b.CUST_EMAIL,',
'    b.PHONE_NUMBER1,',
'    b.PHONE_NUMBER2,',
'    b.CREDIT_LIMIT,',
'    b.tags',
'ORDER BY',
'    3 DESC'))
,p_plug_source_type=>'PLUGIN_COM_ORACLE_APEX_SLIDETOOLTIP'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'ICON'
,p_attribute_02=>'CUSTOMER_NAME'
,p_attribute_03=>'ORDER_TOTAL'
,p_attribute_04=>'tooltip'
,p_attribute_05=>'f?p=&APP_ID.:7:&APP_SESSION.:::7:P7_CUSTOMER_ID,P7_BRANCH:&ID.,1'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(1392967333459666998)
,p_name=>'CUSTOMER_NAME'
,p_data_type=>'CUSTOMER_NAME'
,p_is_visible=>true
,p_display_sequence=>10
,p_heading=>'Customer Name'
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(1392967652351666998)
,p_name=>'ICON'
,p_data_type=>'ICON'
,p_is_visible=>true
,p_display_sequence=>20
,p_heading=>'Icon'
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(1392967993213666998)
,p_name=>'ORDER_TOTAL'
,p_data_type=>'ORDER_TOTAL'
,p_is_visible=>true
,p_display_sequence=>30
,p_heading=>'Order Total'
,p_format_mask=>'FML999G999G999G999G990D00'
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(1392968229351666998)
,p_name=>'ORDER_CNT'
,p_data_type=>'ORDER_CNT'
,p_is_visible=>true
,p_display_sequence=>40
,p_heading=>'Number of Orders'
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(1392968554369667000)
,p_name=>'ID'
,p_data_type=>'ID'
,p_is_visible=>false
,p_display_sequence=>50
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(1392968830257667000)
,p_name=>'CUST_STREET_ADDRESS1'
,p_data_type=>'CUST_STREET_ADDRESS1'
,p_is_visible=>true
,p_display_sequence=>60
,p_heading=>'Address'
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(1392969215821667000)
,p_name=>'CUST_STREET_ADDRESS2'
,p_data_type=>'CUST_STREET_ADDRESS2'
,p_is_visible=>false
,p_display_sequence=>70
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(1392969472471667000)
,p_name=>'CUST_CITY'
,p_data_type=>'CUST_CITY'
,p_is_visible=>true
,p_display_sequence=>80
,p_heading=>'City'
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(1392969786301667000)
,p_name=>'CUST_STATE'
,p_data_type=>'CUST_STATE'
,p_is_visible=>true
,p_display_sequence=>90
,p_heading=>'State'
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(1392970046171667002)
,p_name=>'CUST_POSTAL_CODE'
,p_data_type=>'CUST_POSTAL_CODE'
,p_is_visible=>true
,p_display_sequence=>100
,p_heading=>'Postal Code'
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(1392970356274667002)
,p_name=>'CUST_EMAIL'
,p_data_type=>'CUST_EMAIL'
,p_is_visible=>true
,p_display_sequence=>110
,p_heading=>'Email'
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(1392970709843667002)
,p_name=>'PHONE_NUMBER1'
,p_data_type=>'PHONE_NUMBER1'
,p_is_visible=>true
,p_display_sequence=>120
,p_heading=>'Phone Number'
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(1392970941994667002)
,p_name=>'PHONE_NUMBER2'
,p_data_type=>'PHONE_NUMBER2'
,p_is_visible=>false
,p_display_sequence=>130
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(1392971230298667003)
,p_name=>'CREDIT_LIMIT'
,p_data_type=>'CREDIT_LIMIT'
,p_is_visible=>true
,p_display_sequence=>140
,p_heading=>'Credit Limit'
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(1392971576648667003)
,p_name=>'TAGS'
,p_data_type=>'TAGS'
,p_is_visible=>true
,p_display_sequence=>150
,p_heading=>'Tags'
,p_escape_on_http_output=>true
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1417218888109861664)
,p_plug_name=>'Footer'
,p_plug_display_sequence=>110
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.SAMPLEAPPFOOTER'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1452164006908868584)
,p_plug_name=>'Sample Database Application'
,p_icon_css_classes=>'app-sample-database-application'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1259800038635281953)
,p_plug_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_source=>'<p>Track and Manage Customers, Orders and Products</p>'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4116635236253318355)
,p_plug_name=>'Search'
,p_parent_plug_id=>wwv_flow_api.id(1452164006908868584)
,p_region_css_classes=>'t-Form--search'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1259796920908281940)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1655641209017249442)
,p_plug_name=>'Oracle APEX Communities and Resources'
,p_plug_display_sequence=>100
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'        <div class="sample-app-oracle-footer">  ',
'            <div class="row">	 ',
'                <div class="col col-2 alpha"> ',
'                    <a href="https://forums.oracle.com/forums/forum.jspa?forumID=137" target="_blank"> ',
'                                <span class="t-Icon u-icon-footer-otn-forums"></span> ',
'                                Oracle OTN Forums	 ',
'                    </a>	 ',
'                </div>	 ',
'                <div class="col col-2"> ',
'                    <a href="http://www.linkedin.com/skills/skill/Oracle_Application_Express" target="_blank"> ',
'                                <span class="t-Icon fa-linkedin-square"></span> ',
'                                Connect on LinkedIn	 ',
'                    </a>	 ',
'                </div>	 ',
'                <div class="col col-2"> ',
'                    <a href="http://twitter.com/oracleapexnews" target="_blank"> ',
'                                <span class="t-Icon fa-twitter"></span> ',
'                                Follow us on Twitter	 ',
'                    </a>	 ',
'                </div>	 ',
'                <div class="col col-2"> ',
'                    <a href="https://cloud.oracle.com/" target="_blank"> ',
'                                <span class="t-Icon u-icon-footer-oracle-cloud"></span> ',
'                                Oracle Database Cloud Service	 ',
'                    </a>	 ',
'                </div>	 ',
'                <div class="col col-2"> ',
'                    <a href="http://apex.oracle.com/" target="_blank"> ',
'                                <span class="t-Icon u-icon-footer-apex"></span> ',
'                                apex.oracle.com	 ',
'                    </a>	 ',
'                </div>	 ',
'                <div class="col col-2 omega"> ',
'                    <a href="http://www.oracle.com/technetwork/developer-tools/apex/overview/index.html" target="_blank"> ',
'                                <span class="t-Icon u-icon-footer-apex-on-otn"></span> ',
'                                APEX on OTN	 ',
'                    </a>	 ',
'                </div> ',
'            </div> ',
'        </div>'))
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2150193716608080649)
,p_plug_name=>'Dashboard'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1259803633802281962)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select',
'    ''Monthly Sales'' as label,',
'    ''$''|| trim(to_char(nvl(sum(o.order_total),0),''999G999G999G999G990'')) as value,',
'    ''f?p=''||:APP_ID||'':4:''||:APP_SESSION||'':::4,RIR:IRGTE_ORDER_DATE:''||:P1_THIS_MONTH as url',
'from demo_orders o',
'where order_timestamp >= to_date(to_char(sysdate,''YYYYMM'')||''01'',''YYYYMMDD'')',
'union all',
'select ',
'    ''Monthly Orders'' as label,',
'    trim(to_char(count(distinct o.order_id),''999G999G999G999G990'')) as value,',
'    ''f?p=''||:APP_ID||'':4:''||:APP_SESSION||'':::4,RIR:IRGTE_ORDER_DATE:''||:P1_THIS_MONTH as url',
'from demo_orders o',
'where order_timestamp >= to_date(to_char(sysdate,''YYYYMM'')||''01'',''YYYYMMDD'')',
'union all',
'select ''Total Products'' as label,',
'        trim(to_char(count(distinct p.product_name),''999G999G999G999G990'')) as value,',
'        ''f?p=''||:APP_ID||'':3:''||:APP_SESSION||'':::'' as url',
'from demo_product_info p',
'union all',
'select ''Total Customers'' as label,',
'        trim(to_char(count(*),''999G999G999G999G990'')) as value,',
'        ''f?p=''||:APP_ID||'':2:''||:APP_SESSION||'':::'' as url',
'from DEMO_CUSTOMERS'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'LABEL'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'&URL.'
,p_attribute_05=>'2'
,p_attribute_06=>'B'
,p_attribute_07=>'BOX'
,p_attribute_08=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4115552348095683230)
,p_plug_name=>'Top Orders by Date'
,p_region_css_classes=>'i-h220'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(1259803633802281962)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select to_char(o.order_timestamp,''Month DD, YYYY'') order_day,',
'    SUM(o.order_total) sales,',
'    ''f?p=&APP_ID.:4:''||:app_session',
'        ||''::&DEBUG.:RIR,4:IREQ_ORDER_DATE:''',
'        ||to_char(trunc(order_timestamp),''MM/DD/YYYY'') the_link',
'from demo_orders o',
'group by to_char(o.order_timestamp,''Month DD, YYYY''), order_timestamp',
'order by 2 desc nulls last',
''))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.HTML5_BAR_CHART'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'INITIALS'
,p_attribute_02=>'ORDER_DAY'
,p_attribute_03=>'&THE_LINK.'
,p_attribute_04=>'SALES'
,p_attribute_11=>'VALUE'
,p_attribute_12=>'$'
,p_attribute_14=>'5'
,p_attribute_15=>'TEXT'
,p_attribute_16=>'ABSOLUTE'
,p_attribute_17=>'DEFAULT'
,p_attribute_18=>'AROUND'
,p_attribute_20=>'No data found.'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4115791130825824703)
,p_plug_name=>'Tags'
,p_region_css_classes=>'i-h220'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1259803633802281962)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select tag, tag_count',
'from demo_tags_sum',
'where tag_count > 0',
'order by 2 desc, 1'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.TAG_CLOUD'
,p_plug_query_row_template=>1
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_no_data_found=>'No tags found.'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'f?p=&APP_ID.:30:&APP_SESSION.:::30:P30_SEARCH,P30_OPTIONS:#TAG#,T'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(7510837696025359270)
,p_name=>'Top Customers (Old)'
,p_template=>wwv_flow_api.id(1259803633802281962)
,p_display_sequence=>90
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_display_point=>'BODY'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'SELECT b.cust_last_name || '', '' || b.cust_first_name ',
'|| '' - ''|| count(a.order_id) ||'' Order(s)'' customer_name ',
', SUM(a.ORDER_TOTAL) order_total,  b.customer_id id',
'FROM demo_orders a, DEMO_CUSTOMERS b',
'WHERE a.customer_id = b.customer_id',
'GROUP BY b.customer_id, b.cust_last_name || '', '' || b.cust_first_name',
'ORDER BY NVL(SUM(a.ORDER_TOTAL),0) DESC'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_display_condition_type=>'NEVER'
,p_ajax_enabled=>'Y'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(1259810084861281976)
,p_query_headings_type=>'NO_HEADINGS'
,p_query_num_rows=>25
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_break_cols=>'0'
,p_query_no_data_found=>'no data found'
,p_query_num_rows_type=>'0'
,p_query_row_count_max=>25
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'N'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(7510839372869380907)
,p_query_column_id=>1
,p_column_alias=>'CUSTOMER_NAME'
,p_column_display_sequence=>1
,p_use_as_row_header=>'N'
,p_column_link=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.:7:P7_CUSTOMER_ID,P7_BRANCH:#ID#,1'
,p_column_linktext=>'#CUSTOMER_NAME#'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(7510838187939359336)
,p_query_column_id=>2
,p_column_alias=>'ORDER_TOTAL'
,p_column_display_sequence=>2
,p_column_format=>'FML999G999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'LEFT'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(7510839500073380908)
,p_query_column_id=>3
,p_column_alias=>'ID'
,p_column_display_sequence=>3
,p_column_alignment=>'RIGHT'
,p_hidden_column=>'Y'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(7510839784774393871)
,p_name=>'Top Products'
,p_template=>wwv_flow_api.id(1259803633802281962)
,p_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_css_classes=>'i-h300'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-AVPList--rightAligned'
,p_new_grid_row=>false
,p_display_point=>'BODY'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Select p.product_name||'' - ''||SUM(oi.quantity)||'' x ''||to_char(p.list_price,''L999G99'')||'''' product,',
'       SUM(oi.quantity * oi.unit_price) sales,  p.product_id',
'from demo_order_items oi',
',    demo_product_info p',
'where oi.product_id = p.product_id',
'group by p.Product_id, p.product_name, p.list_price',
'order by 2 desc'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_ajax_enabled=>'Y'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(1259810084861281976)
,p_query_headings_type=>'NO_HEADINGS'
,p_query_num_rows=>5
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_break_cols=>'0'
,p_query_no_data_found=>'no data found'
,p_query_num_rows_type=>'0'
,p_query_row_count_max=>5
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(7510840391701395857)
,p_query_column_id=>1
,p_column_alias=>'PRODUCT'
,p_column_display_sequence=>1
,p_use_as_row_header=>'N'
,p_column_link=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.:6:P6_PRODUCT_ID,P6_BRANCH:#PRODUCT_ID#,1'
,p_column_linktext=>'#PRODUCT#'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(7510840500708395857)
,p_query_column_id=>2
,p_column_alias=>'SALES'
,p_column_display_sequence=>2
,p_column_format=>'FML999G999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(7513861504144742814)
,p_query_column_id=>3
,p_column_alias=>'PRODUCT_ID'
,p_column_display_sequence=>3
,p_column_alignment=>'RIGHT'
,p_hidden_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(1685867597142778092)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(2150193716608080649)
,p_button_name=>'VIEW_MONTH_ORDERS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_api.id(1259816755107282011)
,p_button_image_alt=>'View Orders for this Month'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.:RIR,4:IRGTE_ORDER_DATE:&P1_THIS_MONTH.'
,p_icon_css_classes=>'fa-chevron-right'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4115710230553362451)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(1392967163079666996)
,p_button_name=>'ADD_CUSTOMER'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_api.id(1259816755107282011)
,p_button_image_alt=>'Add Customer'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.:RP,7:P7_BRANCH:1'
,p_icon_css_classes=>'fa-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(7510841288846413936)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(1392967163079666996)
,p_button_name=>'VIEW_CUSTOMERS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_api.id(1259816755107282011)
,p_button_image_alt=>'View Customers'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-chevron-right'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4115710446268376379)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(7510839784774393871)
,p_button_name=>'ADD_PRODUCT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_api.id(1259816755107282011)
,p_button_image_alt=>'Add Product'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.:RP,6:P6_BRANCH:1'
,p_icon_css_classes=>'fa-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(7513682591341764714)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(7510839784774393871)
,p_button_name=>'VIEW_PRODUCTS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_api.id(1259816755107282011)
,p_button_image_alt=>'View Products'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-chevron-right'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(1314024588405333471)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(4115552348095683230)
,p_button_name=>'ADD_ORDER'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_api.id(1259816755107282011)
,p_button_image_alt=>'Enter New Order'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.:RP,11:P11_BRANCH:1'
,p_icon_css_classes=>'fa-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(7513679694888746782)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_api.id(4115552348095683230)
,p_button_name=>'VIEW_ORDERS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_api.id(1259816755107282011)
,p_button_image_alt=>'View Orders'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-chevron-right'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(4116645333875346031)
,p_branch_action=>'f?p=&APP_ID.:30:&SESSION.::&DEBUG.:1,30:P30_SEARCH:&P1_SEARCH.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_comment=>'Created 13-APR-2012 07:39 by MIKE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1685869025788810394)
,p_name=>'P1_THIS_MONTH'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(638211472489181375)
,p_use_cache_before_default=>'NO'
,p_item_default=>'to_char(sysdate ,''MM'')||''01''||to_char(sysdate ,''YYYY'')'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_source=>'to_char(sysdate ,''MM'')||''01''||to_char(sysdate ,''YYYY'')'
,p_source_type=>'FUNCTION'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4116635929111325683)
,p_name=>'P1_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(4116635236253318355)
,p_prompt=>'Search'
,p_placeholder=>'Search customers, orders & products'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>48
,p_cMaxlength=>4000
,p_tag_css_classes=>'t-Form-searchField'
,p_field_template=>wwv_flow_api.id(1259816475318282004)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--xlarge'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(4115555948273721105)
,p_computation_sequence=>10
,p_computation_item=>'LAST_VIEW'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'&APP_PAGE_ID.'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(1923903578511293272)
,p_name=>'Set Focus on Search Field'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1923903670111293273)
,p_event_id=>wwv_flow_api.id(1923903578511293272)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P1_SEARCH'
,p_stop_execution_on_error=>'Y'
);
end;
/
