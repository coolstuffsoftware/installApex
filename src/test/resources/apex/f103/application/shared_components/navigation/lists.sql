prompt --application/shared_components/navigation/lists
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(657688270698430920)
,p_name=>'Application Navigation'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(657688339116430920)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Home'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-home'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'1,15,30'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(657688423873430920)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Customers [&A01.]'
,p_list_item_link_target=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:RIR:::'
,p_list_item_icon=>'fa-users'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'2,7,21,22,23,24,41,42,43,44'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(657688603294430920)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Products [&A02.]'
,p_list_item_link_target=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:RIR:::'
,p_list_item_icon=>'fa-shopping-cart'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'3,6'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(657688685410430920)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Orders [&A03.]'
,p_list_item_link_target=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.:RIR:::'
,p_list_item_icon=>'fa-list-alt'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'4,11,12,14,29,14'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(657688791047430920)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Reports'
,p_list_item_link_target=>'f?p=&APP_ID.:26:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-table'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(1404481351680431162)
,p_list_item_display_sequence=>70
,p_list_item_link_text=>'Customer Map'
,p_list_item_link_target=>'f?p=&APP_ID.:13:&SESSION.::&DEBUG.:RP,13:::'
,p_parent_list_item_id=>wwv_flow_api.id(657688791047430920)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(1404482528698433993)
,p_list_item_display_sequence=>80
,p_list_item_link_text=>'Customer Orders'
,p_list_item_link_target=>'f?p=&APP_ID.:17:&SESSION.::&DEBUG.:RP,17:::'
,p_parent_list_item_id=>wwv_flow_api.id(657688791047430920)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(1404482996676436766)
,p_list_item_display_sequence=>90
,p_list_item_link_text=>'Orders Calendar'
,p_list_item_link_target=>'f?p=&APP_ID.:10:&SESSION.::&DEBUG.:RP,10:::'
,p_parent_list_item_id=>wwv_flow_api.id(657688791047430920)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(1404483191631439207)
,p_list_item_display_sequence=>100
,p_list_item_link_text=>'Product Order Tree'
,p_list_item_link_target=>'f?p=&APP_ID.:19:&SESSION.::&DEBUG.:RP,19:::'
,p_parent_list_item_id=>wwv_flow_api.id(657688791047430920)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(1404483388120443092)
,p_list_item_display_sequence=>110
,p_list_item_link_text=>'Sales by Category'
,p_list_item_link_target=>'f?p=&APP_ID.:16:&SESSION.::&DEBUG.:RP,16:::'
,p_parent_list_item_id=>wwv_flow_api.id(657688791047430920)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(1404483552364445178)
,p_list_item_display_sequence=>120
,p_list_item_link_text=>'Sales by Month'
,p_list_item_link_target=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:RP,5:::'
,p_parent_list_item_id=>wwv_flow_api.id(657688791047430920)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(1404483908047447334)
,p_list_item_display_sequence=>130
,p_list_item_link_text=>'Sales by Product'
,p_list_item_link_target=>'f?p=&APP_ID.:27:&SESSION.::&DEBUG.:RP,27:::'
,p_parent_list_item_id=>wwv_flow_api.id(657688791047430920)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(1404484023444450110)
,p_list_item_display_sequence=>140
,p_list_item_link_text=>'Sales by State'
,p_list_item_link_target=>'f?p=&APP_ID.:31:&SESSION.::&DEBUG.:RP,31:::'
,p_parent_list_item_id=>wwv_flow_api.id(657688791047430920)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(1404484312219452795)
,p_list_item_display_sequence=>150
,p_list_item_link_text=>'Tags'
,p_list_item_link_target=>'f?p=&APP_ID.:28:&SESSION.::&DEBUG.:RP,28:::'
,p_parent_list_item_id=>wwv_flow_api.id(657688791047430920)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(657688919862430920)
,p_list_item_display_sequence=>52
,p_list_item_link_text=>'Administration'
,p_list_item_link_target=>'f?p=&APP_ID.:33:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-gear'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(1452197316525416299)
,p_list_item_display_sequence=>54
,p_list_item_link_text=>'Feedback'
,p_list_item_link_target=>'f?p=&APP_ID.:18:&SESSION.::&DEBUG.:RP,28:::'
,p_parent_list_item_id=>wwv_flow_api.id(657688919862430920)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(1452199081170434448)
,p_list_item_display_sequence=>56
,p_list_item_link_text=>'Reports'
,p_list_item_link_target=>'f?p=&APP_ID.:33:&SESSION.::&DEBUG.::::#adminReports'
,p_parent_list_item_id=>wwv_flow_api.id(657688919862430920)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(1452201041754441881)
,p_list_item_display_sequence=>58
,p_list_item_link_text=>'Activity Calendar'
,p_list_item_link_target=>'f?p=&APP_ID.:40:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(1452199081170434448)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(1452201321283446129)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>'Page Views'
,p_list_item_link_target=>'f?p=&APP_ID.:39:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(1452199081170434448)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(1452202787026452436)
,p_list_item_display_sequence=>62
,p_list_item_link_text=>'Top Users'
,p_list_item_link_target=>'f?p=&APP_ID.:38:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(1452199081170434448)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(1452197880087422279)
,p_list_item_display_sequence=>66
,p_list_item_link_text=>'Sample Data'
,p_list_item_link_target=>'f?p=&APP_ID.:25:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(657688919862430920)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(1452198175847425719)
,p_list_item_display_sequence=>68
,p_list_item_link_text=>'States'
,p_list_item_link_target=>'f?p=&APP_ID.:35:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(657688919862430920)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(1851913134760251032)
,p_list_item_display_sequence=>160
,p_list_item_link_text=>'Theme Style'
,p_list_item_link_target=>'f?p=&APP_ID.:9:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(657688919862430920)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(662141387586366594)
,p_name=>'Header Quick Nav'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(662141566726366594)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Mobile'
,p_list_item_link_target=>'f?p=&APP_ID.:200:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'a-Icon icon-mobile'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(662142156457366595)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Help'
,p_list_item_link_target=>'f?p=&APP_ID.:15:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'a-Icon icon-help'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(2384385084959011174)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Feedback'
,p_list_item_link_target=>'f?p=&APP_ID.:102:&SESSION.::&DEBUG.:102:P102_APPLICATION_ID,P102_PAGE_ID:&APP_ID.,&APP_PAGE_ID.:'
,p_list_item_icon=>'fa-bullhorn'
,p_list_item_disp_cond_type=>'PLSQL_EXPRESSION'
,p_list_item_disp_condition=>'nvl(:ENABLE_FEEDBACK,''NO'') = ''YES'''
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(1999268080937728430)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'&APP_USER.'
,p_list_item_link_target=>'#'
,p_list_item_icon=>'a-Icon icon-user'
,p_list_text_02=>'has-username'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(1999269982732730917)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Sign Out'
,p_list_item_link_target=>'&LOGOUT_URL.'
,p_parent_list_item_id=>wwv_flow_api.id(1999268080937728430)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(934437777317550630)
,p_name=>'Data Load Process Train - Load Customers'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(941044772588199469)
,p_name=>'Admin Reports'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(941045553960199470)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Activity Calendar'
,p_list_item_link_target=>'f?p=&APP_ID.:40:&SESSION.::&DEBUG.:40:::'
,p_list_item_icon=>'fa-calendar'
,p_list_text_01=>'View page views by user in a monthly calendar'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(941045262422199470)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Page Views'
,p_list_item_link_target=>'f?p=&APP_ID.:39:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-eye'
,p_list_text_01=>'Report page view for this application'
,p_list_text_02=>'&P33_PAGE_VIEWS.'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(941044953845199469)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Top Users'
,p_list_item_link_target=>'f?p=&APP_ID.:38:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-users'
,p_list_text_01=>'Report user activity for this application'
,p_list_text_02=>'&P33_USER_COUNT.'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(1609505312807418331)
,p_name=>'Navigation Menu'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(1671927899628614244)
,p_name=>'Mobile Navigation Menu'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(1664888563346895724)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Home'
,p_list_item_link_target=>'f?p=&APP_ID.:200:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(1671928117631614245)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Customers'
,p_list_item_link_target=>'f?p=&APP_ID.:201:&SESSION.::&DEBUG.:201:::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(1671928418571614245)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Products'
,p_list_item_link_target=>'f?p=&APP_ID.:203:&SESSION.::&DEBUG.:203:::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(1671928709068614245)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Orders'
,p_list_item_link_target=>'f?p=&APP_ID.:255:&SESSION.::&DEBUG.:255:::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(1310006994815014583)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Reports'
,p_list_item_link_target=>'f?p=&APP_ID.:208:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(1671929297530614246)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>'Calendar'
,p_list_item_link_target=>'f?p=&APP_ID.:219:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(1677302108258833618)
,p_name=>'Footer Controls'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(1677302318401833618)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Full Site'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.::::'
,p_list_text_01=>'star'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(1677302605771833620)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Logout'
,p_list_item_link_target=>'&LOGOUT_URL.'
,p_list_text_01=>'delete'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(1680937926531270292)
,p_name=>'Charts'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(1680938111747270293)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Customer Orders'
,p_list_item_link_target=>'f?p=&APP_ID.:209:&SESSION.:'
,p_list_item_current_for_pages=>'209'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(1680938405572270293)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Sales by Category'
,p_list_item_link_target=>'f?p=&APP_ID.:210:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(1680945498836448659)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Sales by Product'
,p_list_item_link_target=>'f?p=&APP_ID.:211:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(5374668706056009303)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Customer Map'
,p_list_item_link_target=>'f?p=&APP_ID.:13:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-map-marker'
,p_list_text_01=>'Map of orders with zoom in and out'
,p_list_text_02=>'reportIcon'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(1680938720691270293)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Sales by Category / Month'
,p_list_item_link_target=>'f?p=&APP_ID.:212:&SESSION.:'
,p_list_item_current_for_pages=>'211'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(5374668990924009304)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Product Order Tree'
,p_list_item_link_target=>'f?p=&APP_ID.:19:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-sitemap'
,p_list_text_01=>'Tree control with expand and collapse'
,p_list_text_02=>'reportIcon'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(1680939010481270293)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Sales by State'
,p_list_item_link_target=>'f?p=&APP_ID.:213:&SESSION.:'
,p_list_item_current_for_pages=>'212'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(1681154925181454401)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>'Tags'
,p_list_item_link_target=>'f?p=&APP_ID.:214:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(5374688804989687207)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>'Tags'
,p_list_item_link_target=>'f?p=&APP_ID.:28:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-tags'
,p_list_text_01=>'View tags by customer, product, and order.'
,p_list_text_02=>'reportIcon'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(1685932196802210309)
,p_name=>'Data Load Process Train - Load Customers'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(1685932514596210310)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Data Load Source'
,p_list_item_link_target=>'f?p=&APP_ID.:21:&SESSION.::&DEBUG.'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(1685932794061210310)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Data / Table Mapping'
,p_list_item_link_target=>'f?p=&APP_ID.:22:&SESSION.::&DEBUG.'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(1685933100844210310)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Data Validation'
,p_list_item_link_target=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(1685933304313210310)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Data Load Results'
,p_list_item_link_target=>'f?p=&APP_ID.:24:&SESSION.::&DEBUG.'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(2182145016368300666)
,p_name=>'Data Load Process Train - Load Customers'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(2182145244458300672)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Data Load Source'
,p_list_item_link_target=>'f?p=&APP_ID.:41:&SESSION.::&DEBUG.'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(2182145681508300673)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Data / Table Mapping'
,p_list_item_link_target=>'f?p=&APP_ID.:42:&SESSION.::&DEBUG.'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(2182146045504300673)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Data Validation'
,p_list_item_link_target=>'f?p=&APP_ID.:43:&SESSION.::&DEBUG.'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(2182146451385300673)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Data Load Results'
,p_list_item_link_target=>'f?p=&APP_ID.:44:&SESSION.::&DEBUG.'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(4115764729383052769)
,p_name=>'Reports'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(4115764934045052771)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Customer Map'
,p_list_item_link_target=>'f?p=&APP_ID.:13:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-map-marker'
,p_list_text_01=>'Map of orders with zoom in and out'
,p_list_text_02=>'reportIcon'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(4115765218913052772)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Product Order Tree'
,p_list_item_link_target=>'f?p=&APP_ID.:19:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-sitemap'
,p_list_text_01=>'Tree control with expand and collapse'
,p_list_text_02=>'reportIcon'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(4115785032978730675)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Tags'
,p_list_item_link_target=>'f?p=&APP_ID.:28:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-tags'
,p_list_text_01=>'View tags by customer, product, and order.'
,p_list_text_02=>'reportIcon'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(7471335118078086749)
,p_name=>'Administration'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(941068767745391823)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Feedback Preference'
,p_list_item_link_target=>'f?p=&APP_ID.:18:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-comments-o'
,p_list_text_01=>'Enable or disable Feedback for the application'
,p_list_text_02=>'&P33_FEEDBACK_STATUS.'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(7472482300768026085)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Manage Sample Data'
,p_list_item_link_target=>'f?p=&APP_ID.:25:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'fa-database'
,p_list_text_01=>'Re-create or remove sample data delivered with this application.'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(941044363820180957)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Manage States'
,p_list_item_link_target=>'f?p=&APP_ID.:35:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-map-marker'
,p_list_text_01=>'Manage state codes and names'
,p_list_text_02=>'&P33_STATE_COUNT.'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(1857531711641265890)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Theme Style'
,p_list_item_link_target=>'f?p=&APP_ID.:9:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-desktop'
,p_list_text_01=>'Change user interface theme style for all users.'
,p_translate_list_text_y_n=>'Y'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(7488115622509571106)
,p_name=>'Order Wizard'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(7488116028396572776)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Identify Customer'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'11'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(399610832612239479)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Order Items'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'12'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(7496020223678511890)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Order Summary'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'14'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(688607891243575684)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Order Confirmation'
,p_list_item_current_for_pages=>'8'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(7499376410847287753)
,p_name=>'Report Tabs'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(7499386204660314364)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Sales by Category'
,p_list_item_link_target=>'f?p=&APP_ID.:16:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-cogs'
,p_list_text_01=>'Pie chart of sales for each category'
,p_list_text_02=>'chartIcon'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'16'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(4115763523103022577)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Sales by Product'
,p_list_item_link_target=>'f?p=&APP_ID.:27:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'fa-sort-amount-desc'
,p_list_text_01=>'Bar chart of sales for each product'
,p_list_text_02=>'chartIcon'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'27'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(5374670914361019965)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Customer Map'
,p_list_item_link_target=>'f?p=&APP_ID.:13:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-map-marker'
,p_list_text_01=>'Map of orders with zoom in and out'
,p_list_text_02=>'reportIcon'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(7499377318812290048)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Sales by Month'
,p_list_item_link_target=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-bar-chart-o'
,p_list_text_01=>'Vertical bar chart of sales by month'
,p_list_text_02=>'chartIcon'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'5'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(5374671199229019966)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Product Order Tree'
,p_list_item_link_target=>'f?p=&APP_ID.:19:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-sitemap'
,p_list_text_01=>'Tree control with expand and collapse'
,p_list_text_02=>'reportIcon'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(4117022131234036244)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Sales by State'
,p_list_item_link_target=>'f?p=&APP_ID.:31:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-globe'
,p_list_text_01=>'CSS chart of sales by State'
,p_list_text_02=>'chartIcon'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(7499386508816315595)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>'Customer Orders'
,p_list_item_link_target=>'f?p=&APP_ID.:17:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-money'
,p_list_text_01=>'Stacked bar chart of customer orders by Month'
,p_list_text_02=>'chartIcon'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'17'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(5374691013294697869)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>'Tags'
,p_list_item_link_target=>'f?p=&APP_ID.:28:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-tags'
,p_list_text_01=>'View tags by customer, product, and order.'
,p_list_text_02=>'reportIcon'
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
