prompt --application/shared_components/navigation/breadcrumbs/main_menu
begin
wwv_flow_api.create_menu(
 p_id=>wwv_flow_api.id(7471141614334565297)
,p_name=>'Main Menu'
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(940356462789715666)
,p_parent_id=>0
,p_short_name=>'Administration'
,p_link=>'f?p=&APP_ID.:33:&SESSION.::&DEBUG.:::'
,p_page_id=>33
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(941039676867159925)
,p_parent_id=>wwv_flow_api.id(940356462789715666)
,p_short_name=>'Manage States'
,p_link=>'f?p=&APP_ID.:35:&SESSION.::&DEBUG.:::'
,p_page_id=>35
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(941069949616417829)
,p_parent_id=>wwv_flow_api.id(940356462789715666)
,p_short_name=>'Top Users'
,p_link=>'f?p=&APP_ID.:38:&SESSION.'
,p_page_id=>38
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(941074249167466866)
,p_parent_id=>wwv_flow_api.id(940356462789715666)
,p_short_name=>'Page Views'
,p_link=>'f?p=&APP_ID.:39:&SESSION.'
,p_page_id=>39
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(941078464987477853)
,p_parent_id=>wwv_flow_api.id(940356462789715666)
,p_short_name=>'Activity Calendar'
,p_link=>'f?p=&APP_ID.:40:&SESSION.'
,p_page_id=>40
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(1685934010017210312)
,p_parent_id=>wwv_flow_api.id(7471200906630932055)
,p_short_name=>'Upload Data'
,p_link=>'f?p=&APP_ID.:21:&SESSION.::&DEBUG.:::'
,p_page_id=>21
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(1685941997833210331)
,p_parent_id=>wwv_flow_api.id(7471200906630932055)
,p_short_name=>'Load Customer'
,p_link=>'f?p=&APP_ID.:22:&SESSION.::&DEBUG.:::'
,p_page_id=>22
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(1685943995386210333)
,p_parent_id=>wwv_flow_api.id(7471200906630932055)
,p_short_name=>'Load Customer'
,p_link=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.:::'
,p_page_id=>23
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(1685950707449210344)
,p_parent_id=>wwv_flow_api.id(7471200906630932055)
,p_short_name=>'Load Customer'
,p_link=>'f?p=&APP_ID.:24:&SESSION.::&DEBUG.:::'
,p_page_id=>24
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(1851908115599243609)
,p_parent_id=>wwv_flow_api.id(940356462789715666)
,p_short_name=>'Application Theme Style'
,p_link=>'f?p=&APP_ID.:9:&SESSION.'
,p_page_id=>9
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(1999327582152753923)
,p_parent_id=>wwv_flow_api.id(940356462789715666)
,p_short_name=>'Manage Sample Data'
,p_link=>'f?p=&APP_ID.:25:&SESSION.'
,p_page_id=>25
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4115728645290470320)
,p_parent_id=>wwv_flow_api.id(7471145409616573409)
,p_short_name=>'Help'
,p_link=>'f?p=&FLOW_ID.:15:&SESSION.'
,p_page_id=>15
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4115733142108577543)
,p_parent_id=>wwv_flow_api.id(940356462789715666)
,p_short_name=>'Feedback Preference'
,p_link=>'f?p=&APP_ID.:18:&SESSION.::&DEBUG.:::'
,p_page_id=>18
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4115759021277944331)
,p_parent_id=>0
,p_short_name=>'Reports'
,p_link=>'f?p=&APP_ID.:26:&SESSION.::&DEBUG.:::'
,p_page_id=>26
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4115763347078020175)
,p_parent_id=>wwv_flow_api.id(4115759021277944331)
,p_short_name=>'Sales by Product'
,p_link=>'f?p=&FLOW_ID.:27:&SESSION.'
,p_page_id=>27
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4115784724139726618)
,p_parent_id=>wwv_flow_api.id(4115759021277944331)
,p_short_name=>'Tags'
,p_link=>'f?p=&FLOW_ID.:28:&SESSION.'
,p_page_id=>28
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4116642125852341322)
,p_parent_id=>wwv_flow_api.id(7471145409616573409)
,p_short_name=>'Search Results'
,p_link=>'f?p=&FLOW_ID.:30:&SESSION.'
,p_page_id=>30
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4117020044038022008)
,p_parent_id=>wwv_flow_api.id(4115759021277944331)
,p_short_name=>'Sales by State'
,p_link=>'f?p=&FLOW_ID.:31:&SESSION.'
,p_page_id=>31
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(7471145409616573409)
,p_parent_id=>0
,p_short_name=>'Home'
,p_link=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::'
,p_page_id=>1
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(7471200906630932055)
,p_parent_id=>0
,p_short_name=>'Customers'
,p_link=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:::'
,p_page_id=>2
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(7471205726501947260)
,p_parent_id=>wwv_flow_api.id(7471200906630932055)
,p_short_name=>'Customer Details'
,p_link=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.:::'
,p_page_id=>7
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(7471527109250822295)
,p_parent_id=>0
,p_short_name=>'Products'
,p_link=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:::'
,p_page_id=>3
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(7471527415483824125)
,p_parent_id=>wwv_flow_api.id(7471527109250822295)
,p_short_name=>'Product Details'
,p_link=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.:::'
,p_page_id=>6
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(7471645597345159437)
,p_parent_id=>0
,p_short_name=>'Orders'
,p_link=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.:::'
,p_page_id=>4
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(7472253796802037872)
,p_parent_id=>wwv_flow_api.id(7471645597345159437)
,p_short_name=>'Order Details'
,p_link=>'f?p=&APP_ID.:29:&SESSION.::&DEBUG.:::'
,p_page_id=>29
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(7488109619083522779)
,p_parent_id=>wwv_flow_api.id(7471645597345159437)
,p_short_name=>'Enter New Order'
,p_link=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.:::'
,p_page_id=>11
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(7496196500447028600)
,p_parent_id=>wwv_flow_api.id(7471645597345159437)
,p_short_name=>'Order Summary'
,p_link=>'f?p=&APP_ID.:14:&SESSION.::&DEBUG.:::'
,p_page_id=>14
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(7499488616115544804)
,p_parent_id=>wwv_flow_api.id(4115759021277944331)
,p_short_name=>'Sales by Month'
,p_link=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:::'
,p_page_id=>5
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(7499491609320552291)
,p_parent_id=>wwv_flow_api.id(4115759021277944331)
,p_short_name=>'Sales by Category'
,p_link=>'f?p=&APP_ID.:16:&SESSION.::&DEBUG.:::'
,p_page_id=>16
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(7499523010546666224)
,p_parent_id=>wwv_flow_api.id(4115759021277944331)
,p_short_name=>'Customer Orders'
,p_link=>'f?p=&APP_ID.:17:&SESSION.::&DEBUG.:::'
,p_page_id=>17
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(7514223300367497088)
,p_parent_id=>wwv_flow_api.id(4115759021277944331)
,p_short_name=>'Customer Map'
,p_link=>'f?p=&APP_ID.:13:&SESSION.::&DEBUG.:::'
,p_page_id=>13
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(7514231473679625375)
,p_parent_id=>wwv_flow_api.id(4115759021277944331)
,p_short_name=>'Product Order Tree'
,p_link=>'f?p=&APP_ID.:19:&SESSION.::&DEBUG.:::'
,p_page_id=>19
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(7776635988042477999)
,p_parent_id=>wwv_flow_api.id(4115759021277944331)
,p_short_name=>'Orders Calendar'
,p_link=>'f?p=&APP_ID.:10:&SESSION.::&DEBUG.:::'
,p_page_id=>10
);
end;
/
