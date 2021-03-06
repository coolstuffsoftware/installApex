prompt --application/shared_components/user_interface/themes
begin
wwv_flow_api.create_theme(
 p_id=>wwv_flow_api.id(1259818309635282040)
,p_theme_id=>42
,p_theme_name=>'Universal Theme'
,p_ui_type_name=>'DESKTOP'
,p_navigation_type=>'L'
,p_nav_bar_type=>'LIST'
,p_is_locked=>false
,p_default_page_template=>wwv_flow_api.id(1259767801430281840)
,p_default_dialog_template=>wwv_flow_api.id(1259783882679281906)
,p_error_template=>wwv_flow_api.id(1259776832855281897)
,p_printer_friendly_template=>wwv_flow_api.id(1259767801430281840)
,p_breadcrumb_display_point=>'REGION_POSITION_01'
,p_sidebar_display_point=>'REGION_POSITION_02'
,p_login_template=>wwv_flow_api.id(1259776832855281897)
,p_default_button_template=>wwv_flow_api.id(1259817292296282017)
,p_default_region_template=>wwv_flow_api.id(1259803633802281962)
,p_default_chart_template=>wwv_flow_api.id(1259803633802281962)
,p_default_form_template=>wwv_flow_api.id(1259803633802281962)
,p_default_reportr_template=>wwv_flow_api.id(1259803633802281962)
,p_default_tabform_template=>wwv_flow_api.id(1259803633802281962)
,p_default_wizard_template=>wwv_flow_api.id(1259803633802281962)
,p_default_menur_template=>wwv_flow_api.id(1259797028614281942)
,p_default_listr_template=>wwv_flow_api.id(1259803633802281962)
,p_default_irr_template=>wwv_flow_api.id(1259803140431281961)
,p_default_report_template=>wwv_flow_api.id(1259808956189281975)
,p_default_label_template=>wwv_flow_api.id(1259816549476282009)
,p_default_menu_template=>wwv_flow_api.id(1259817494932282020)
,p_default_calendar_template=>wwv_flow_api.id(1259817579707282024)
,p_default_list_template=>wwv_flow_api.id(1259812266753281989)
,p_default_nav_list_template=>wwv_flow_api.id(1259815211882281998)
,p_default_top_nav_list_temp=>wwv_flow_api.id(1259815211882281998)
,p_default_side_nav_list_temp=>wwv_flow_api.id(1259815758007282001)
,p_default_nav_list_position=>'TOP'
,p_default_dialogbtnr_template=>wwv_flow_api.id(1259797707782281943)
,p_default_dialogr_template=>wwv_flow_api.id(1259796920908281940)
,p_default_option_label=>wwv_flow_api.id(1259816549476282009)
,p_default_header_template=>wwv_flow_api.id(1259796920908281940)
,p_default_footer_template=>wwv_flow_api.id(1259796920908281940)
,p_default_required_label=>wwv_flow_api.id(1259816688735282009)
,p_default_page_transition=>'NONE'
,p_default_popup_transition=>'NONE'
,p_default_navbar_list_template=>wwv_flow_api.id(1259814928996281996)
,p_file_prefix => nvl(wwv_flow_application_install.get_static_theme_file_prefix(42),'#IMAGE_PREFIX#themes/theme_42/1.0/')
,p_files_version=>62
,p_icon_library=>'FONTAWESOME'
,p_javascript_file_urls=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.regionDisplaySelector#MIN#.js?v=#APEX_VERSION#',
'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.stickyWidget#MIN#.js?v=#APEX_VERSION#',
'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.stickyTableHeader#MIN#.js?v=#APEX_VERSION#',
'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#tooltipManager#MIN#.js?v=#APEX_VERSION#',
'#IMAGE_PREFIX#libraries/hammer/2.0.3/hammer#MIN#.js?v=#APEX_VERSION#',
'#THEME_IMAGES#js/modernizr-custom#MIN#.js?v=#APEX_VERSION#',
'#IMAGE_PREFIX#plugins/com.oracle.apex.carousel/1.0/com.oracle.apex.carousel#MIN#.js?v=#APEX_VERSION#',
'#THEME_IMAGES#js/theme42#MIN#.js?v=#APEX_VERSION#'))
,p_css_file_urls=>'#THEME_IMAGES#css/Core#MIN#.css?v=#APEX_VERSION#'
);
wwv_flow_api.create_theme(
 p_id=>wwv_flow_api.id(1609475603557416202)
,p_theme_id=>51
,p_theme_name=>'Mobile'
,p_ui_type_name=>'JQM_SMARTPHONE'
,p_navigation_type=>'L'
,p_nav_bar_type=>'NAVBAR'
,p_is_locked=>false
,p_default_page_template=>wwv_flow_api.id(1609467824370416158)
,p_default_dialog_template=>wwv_flow_api.id(1609467640836416154)
,p_error_template=>wwv_flow_api.id(1609467824370416158)
,p_printer_friendly_template=>wwv_flow_api.id(1609467824370416158)
,p_login_template=>wwv_flow_api.id(1609467824370416158)
,p_default_button_template=>wwv_flow_api.id(1609474636193416198)
,p_default_region_template=>wwv_flow_api.id(1609472224655416180)
,p_default_chart_template=>wwv_flow_api.id(1609472224655416180)
,p_default_form_template=>wwv_flow_api.id(1609472224655416180)
,p_default_reportr_template=>wwv_flow_api.id(1609472717867416182)
,p_default_tabform_template=>wwv_flow_api.id(1609472224655416180)
,p_default_wizard_template=>wwv_flow_api.id(1609472224655416180)
,p_default_irr_template=>wwv_flow_api.id(1609472224655416180)
,p_default_report_template=>wwv_flow_api.id(1609472851320416183)
,p_default_label_template=>wwv_flow_api.id(1609474189129416193)
,p_default_calendar_template=>wwv_flow_api.id(1609474899860416199)
,p_default_list_template=>wwv_flow_api.id(1609473500002416188)
,p_default_nav_list_template=>wwv_flow_api.id(1609473266089416187)
,p_default_top_nav_list_temp=>wwv_flow_api.id(1609473266089416187)
,p_default_side_nav_list_temp=>wwv_flow_api.id(1609473866606416190)
,p_default_nav_list_position=>'SIDE'
,p_default_option_label=>wwv_flow_api.id(1609474189129416193)
,p_default_header_template=>wwv_flow_api.id(1609471190071416176)
,p_default_footer_template=>wwv_flow_api.id(1609470724008416174)
,p_default_required_label=>wwv_flow_api.id(1609474272253416194)
,p_default_page_transition=>'SLIDE'
,p_default_popup_transition=>'POP'
,p_file_prefix => nvl(wwv_flow_application_install.get_static_theme_file_prefix(51),'#IMAGE_PREFIX#themes/theme_51/')
,p_css_file_urls=>'#THEME_IMAGES#css/5_0.css'
);
end;
/
