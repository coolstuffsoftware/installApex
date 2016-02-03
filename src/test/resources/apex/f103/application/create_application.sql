prompt --application/create_application
begin
wwv_flow_api.create_flow(
 p_id=>wwv_flow.g_flow_id
,p_display_id=>nvl(wwv_flow_application_install.get_application_id,103)
,p_owner=>nvl(wwv_flow_application_install.get_schema,'APPSTORE')
,p_name=>nvl(wwv_flow_application_install.get_application_name,'Sample Database Application')
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'103')
,p_application_group=>5468349620605786
,p_application_group_name=>'Sample Applications'
,p_page_view_logging=>'YES'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt=>'077A3B0984C5CE28205742085B2E37CFF600F2815EAC241C8E34ECDF698CA1B8'
,p_checksum_salt_last_reset=>'20150323120243'
,p_bookmark_checksum_function=>'SH1'
,p_max_session_length_sec=>28800
,p_compatibility_mode=>'5.0'
,p_flow_language=>'en'
,p_flow_language_derived_from=>'SESSION'
,p_allow_feedback_yn=>'Y'
,p_date_format=>'DS'
,p_date_time_format=>'DD-MON-YYYY HH:MIPM'
,p_timestamp_format=>'DS'
,p_timestamp_tz_format=>'DS'
,p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,'')
,p_documentation_banner=>'4.2.1 -> 4.2.2: Replaced mixed case column aliases in select statement for "Top Users" Interactive report'
,p_authentication=>'PLUGIN'
,p_authentication_id=>wwv_flow_api.id(7772964679312072531)
,p_logout_url=>'wwv_flow_custom_auth_std.logout?p_this_flow=&APP_ID.&amp;p_next_flow_page_sess=&APP_ID.:1'
,p_application_tab_set=>0
,p_logo_image=>'TEXT:Sample Database Application'
,p_public_user=>'APEX_PUBLIC_USER'
,p_proxy_server=> nvl(wwv_flow_application_install.get_proxy,'')
,p_flow_version=>'5.0.3'
,p_flow_status=>'AVAILABLE_W_EDIT_LINK'
,p_flow_unavailable_text=>'This application is currently unavailable at this time.'
,p_exact_substitutions_only=>'Y'
,p_browser_cache=>'N'
,p_browser_frame=>'S'
,p_deep_linking=>'Y'
,p_runtime_api_usage=>'T'
,p_authorize_public_pages_yn=>'Y'
,p_rejoin_existing_sessions=>'P'
,p_csv_encoding=>'N'
,p_auto_time_zone=>'N'
,p_error_handling_function=>'sample_pkg.demo_error_handling'
,p_substitution_string_01=>'APP_NAME'
,p_substitution_value_01=>'Sample Database Application'
,p_substitution_string_02=>'APP_FAVICONS'
,p_substitution_value_02=>'<link rel="shortcut icon" href="#IMAGE_PREFIX#apex_ui/img/favicons/app-sample-database-application.ico"><link rel="icon" sizes="16x16" href="#IMAGE_PREFIX#apex_ui/img/favicons/app-sample-database-application-16x16.png"><link rel="icon" sizes="32x32" '
||'href="#IMAGE_PREFIX#apex_ui/img/favicons/app-sample-database-application-32x32.png"><link rel="apple-touch-icon" sizes="180x180" href="#IMAGE_PREFIX#apex_ui/img/favicons/app-sample-database-application.png">'
,p_last_updated_by=>'ERICH'
,p_last_upd_yyyymmddhh24miss=>'20151005234937'
,p_file_prefix => nvl(wwv_flow_application_install.get_static_app_file_prefix,'')
,p_ui_type_name => null
);
end;
/
