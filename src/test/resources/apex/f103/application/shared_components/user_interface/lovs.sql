prompt --application/shared_components/user_interface/lovs
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(7471808604026344181)
,p_lov_name=>'CATEGORIES'
,p_lov_query=>'.'||wwv_flow_api.id(7471808604026344181)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(7471808921699344184)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Mens'
,p_lov_return_value=>'Mens'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(7471809123174344186)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Womens'
,p_lov_return_value=>'Womens'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(7471809298327344186)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'Accessories'
,p_lov_return_value=>'Accessories'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1671882016685532000)
,p_lov_name=>'DATA_LOAD_CHARSET'
,p_lov_query=>'.'||wwv_flow_api.id(1671882016685532000)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1671882304930532001)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Unicode UTF-16 Little Endian'
,p_lov_return_value=>'utf-16le'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1671882612104532001)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Unicode UTF-16 Big Endian'
,p_lov_return_value=>'utf-16be'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1671882899733532001)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'US-ASCII'
,p_lov_return_value=>'us-ascii'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1671883225032532002)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Arabic ISO-8859-6'
,p_lov_return_value=>'iso-8859-6'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1671883512794532002)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Arabic Windows 1256'
,p_lov_return_value=>'windows-1256'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1671883794498532002)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Chinese Big5'
,p_lov_return_value=>'big5'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1671884122705532002)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Chinese GBK'
,p_lov_return_value=>'gbk'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1671884399412532002)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Cyrilic ISO-8859-5'
,p_lov_return_value=>'iso-8859-5'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1671884696512532002)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Cyrilic KOI8-R'
,p_lov_return_value=>'koi8-r'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1671885003688532002)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Cyrilic KOI8-U'
,p_lov_return_value=>'koi8-u'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1671885320200532003)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Cyrilic Windows 1251'
,p_lov_return_value=>'windows-1251'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1671885624824532003)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Eastern European ISO-8859-2'
,p_lov_return_value=>'iso-8859-2'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1671885923008532003)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Eastern European Windows 1250'
,p_lov_return_value=>'windows-1250'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1671886215095532003)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Greek ISO-8859-7'
,p_lov_return_value=>'iso-8859-7'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1671886503508532003)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Greek Windows 1253'
,p_lov_return_value=>'windows-1253'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1671886797726532003)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Hebrew ISO-8859-8-i'
,p_lov_return_value=>'iso-8859-8-i'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1671887124508532003)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Hebrew Windows 1255'
,p_lov_return_value=>'windows-1255'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1671887409449532003)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Japanese EUC'
,p_lov_return_value=>'euc-jp'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1671887718017532003)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Japanese Shift JIS'
,p_lov_return_value=>'shift_jis'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1671888020224532003)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Korean EUC'
,p_lov_return_value=>'euc-kr'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1671888313520532003)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Northern European ISO-8859-4'
,p_lov_return_value=>'iso-8859-4'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1671888622702532004)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Northern European Windows 1257'
,p_lov_return_value=>'windows-1257'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1671888907117532004)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Southern European ISO-8859-3'
,p_lov_return_value=>'iso-8859-3'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1671889194339532004)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Thai TIS-620'
,p_lov_return_value=>'tis-620'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1671889515768532005)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Turkish ISO-8859-9'
,p_lov_return_value=>'iso-8859-9'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1671889794529532005)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Turkish Windows 1254'
,p_lov_return_value=>'windows-1254'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1671890098735532005)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Unicode UTF-8'
,p_lov_return_value=>'utf-8'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1671890394307532005)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Vietnamese Windows 1258'
,p_lov_return_value=>'windows-1258'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1671890717008532006)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Western European ISO-8859-1'
,p_lov_return_value=>'iso-8859-1'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1671891018552532006)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Western European Windows 1252'
,p_lov_return_value=>'windows-1252'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(7655882488395731804)
,p_lov_name=>'DATA_LOAD_OPTION'
,p_lov_query=>'.'||wwv_flow_api.id(7655882488395731804)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(7655882784567731807)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'Upload file, comma separated (*.csv) or tab delimited'
,p_lov_return_value=>'UPLOAD'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(7655882993038731811)
,p_lov_disp_sequence=>20
,p_lov_disp_value=>'Copy and Paste'
,p_lov_return_value=>'PASTE'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(2182153215985300702)
,p_lov_name=>'DATE_FORMAT_OPTION'
,p_lov_query=>'.'||wwv_flow_api.id(2182153215985300702)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(2182153573268300706)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'Yes'
,p_lov_return_value=>'Y'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(7655884994340731819)
,p_lov_name=>'FIRST_ROW_OPTION'
,p_lov_query=>'.'||wwv_flow_api.id(7655884994340731819)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(7655885277787731819)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'Yes'
,p_lov_return_value=>'Y'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(934472767219591364)
,p_lov_name=>'LOV_DATALOAD_LOAD CUSTOMERS'
,p_lov_query=>'.'||wwv_flow_api.id(934472767219591364)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(934473462456591365)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'Customer Identifier'
,p_lov_return_value=>'CUSTOMER_ID'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(934474362636591365)
,p_lov_disp_sequence=>20
,p_lov_disp_value=>'First Name'
,p_lov_return_value=>'CUST_FIRST_NAME'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(934474663674591365)
,p_lov_disp_sequence=>30
,p_lov_disp_value=>'Last Name'
,p_lov_return_value=>'CUST_LAST_NAME'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(934475558883591365)
,p_lov_disp_sequence=>40
,p_lov_disp_value=>'Street Address'
,p_lov_return_value=>'CUST_STREET_ADDRESS1'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(934475849031591366)
,p_lov_disp_sequence=>50
,p_lov_disp_value=>'Street Address Line 2'
,p_lov_return_value=>'CUST_STREET_ADDRESS2'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(934473753038591365)
,p_lov_disp_sequence=>60
,p_lov_disp_value=>'City'
,p_lov_return_value=>'CUST_CITY'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(934475266523591365)
,p_lov_disp_sequence=>70
,p_lov_disp_value=>'State'
,p_lov_return_value=>'CUST_STATE'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(934474963118591365)
,p_lov_disp_sequence=>80
,p_lov_disp_value=>'Postal Code'
,p_lov_return_value=>'CUST_POSTAL_CODE'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(934474081283591365)
,p_lov_disp_sequence=>90
,p_lov_disp_value=>'Email'
,p_lov_return_value=>'CUST_EMAIL'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(934476157145591366)
,p_lov_disp_sequence=>100
,p_lov_disp_value=>'Phone Number'
,p_lov_return_value=>'PHONE_NUMBER1'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(934476462726591367)
,p_lov_disp_sequence=>110
,p_lov_disp_value=>'Alternate Number'
,p_lov_return_value=>'PHONE_NUMBER2'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(934477063699591367)
,p_lov_disp_sequence=>120
,p_lov_disp_value=>'URL'
,p_lov_return_value=>'URL'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(934473151001591365)
,p_lov_disp_sequence=>130
,p_lov_disp_value=>'Credit Limit'
,p_lov_return_value=>'CREDIT_LIMIT'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(934476751464591367)
,p_lov_disp_sequence=>140
,p_lov_disp_value=>'Tags'
,p_lov_return_value=>'TAGS'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(4115751017880793995)
,p_lov_name=>'NEW OR EXISTING CUSTOMER'
,p_lov_query=>'.'||wwv_flow_api.id(4115751017880793995)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(4115751235117793998)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'Existing customer'
,p_lov_return_value=>'EXISTING'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(4115751449208794003)
,p_lov_disp_sequence=>20
,p_lov_disp_value=>'New customer'
,p_lov_return_value=>'NEW'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(7473092897143838782)
,p_lov_name=>'PRODUCTS'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select product_name d, product_id r from demo_product_info',
'order by 1'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(7495957125813916424)
,p_lov_name=>'PRODUCTS WITH PRICE'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select apex_escape.html(product_name) || '' [$'' || list_price || '']'' d, product_id r from demo_product_info',
'where product_avail = ''Y''',
'order by 1'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(4116642432860341325)
,p_lov_name=>'ROWS'
,p_lov_query=>'.'||wwv_flow_api.id(4116642432860341325)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(4116642733383341329)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'5'
,p_lov_return_value=>'5'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(4116642943620341329)
,p_lov_disp_sequence=>20
,p_lov_disp_value=>'10'
,p_lov_return_value=>'10'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(4116643134413341329)
,p_lov_disp_sequence=>30
,p_lov_disp_value=>'15'
,p_lov_return_value=>'15'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(4116643335401341330)
,p_lov_disp_sequence=>40
,p_lov_disp_value=>'20'
,p_lov_return_value=>'20'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(4116643531277341332)
,p_lov_disp_sequence=>50
,p_lov_disp_value=>'50'
,p_lov_return_value=>'50'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(4116643740775341332)
,p_lov_disp_sequence=>60
,p_lov_disp_value=>'100'
,p_lov_return_value=>'100'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(4116643946521341332)
,p_lov_disp_sequence=>70
,p_lov_disp_value=>'500'
,p_lov_return_value=>'500'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(7472360398045802136)
,p_lov_name=>'STATES'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select initcap(state_name) display_value, st return_value from   demo_states',
'order by 1'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(941071576210437061)
,p_lov_name=>'TIMEFRAME'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
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
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(7471461721988570519)
,p_lov_name=>'Y OR N'
,p_lov_query=>'.'||wwv_flow_api.id(7471461721988570519)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(7471462013008570522)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Yes'
,p_lov_return_value=>'Y'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(7471462222729570524)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'No'
,p_lov_return_value=>'N'
);
end;
/
