prompt --application/create_application
begin
wwv_flow_api.create_flow(
 p_id=>wwv_flow.g_flow_id
,p_display_id=>nvl(wwv_flow_application_install.get_application_id,104)
,p_owner=>nvl(wwv_flow_application_install.get_schema,'APPSTORE')
,p_name=>nvl(wwv_flow_application_install.get_application_name,'Sample Trees')
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'105')
,p_application_group=>5468349620605786
,p_application_group_name=>'Sample Applications'
,p_page_view_logging=>'YES'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt=>'930CA30580ADE1957CB00F0D28569BDF4D20092B402116CD0DA5DBE9827537DD'
,p_checksum_salt_last_reset=>'20150102075811'
,p_bookmark_checksum_function=>'SH1'
,p_compatibility_mode=>'5.0'
,p_flow_language=>'en'
,p_flow_language_derived_from=>'FLOW_PRIMARY_LANGUAGE'
,p_date_format=>'DS'
,p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,'')
,p_documentation_banner=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'1.0.4 -> 1.0.5: Added "SQL Source" show/hide region to "Project Tracking" and "Project Documentation" pages.',
'1.0.5 -> 1.0.6: Changed Authentication scheme to use new "ORA_WWV_PACKAGED_APPLICATIONS" cookie'))
,p_authentication=>'PLUGIN'
,p_authentication_id=>wwv_flow_api.id(7268536901147995397)
,p_application_tab_set=>1
,p_logo_image=>'TEXT:Sample Trees'
,p_public_user=>'APEX_PUBLIC_USER'
,p_proxy_server=> nvl(wwv_flow_application_install.get_proxy,'')
,p_flow_version=>'1.0.11'
,p_flow_status=>'AVAILABLE_W_EDIT_LINK'
,p_flow_unavailable_text=>'This application is currently unavailable at this time.'
,p_exact_substitutions_only=>'Y'
,p_browser_cache=>'N'
,p_browser_frame=>'D'
,p_deep_linking=>'Y'
,p_runtime_api_usage=>'T'
,p_authorize_public_pages_yn=>'Y'
,p_rejoin_existing_sessions=>'P'
,p_csv_encoding=>'Y'
,p_auto_time_zone=>'N'
,p_substitution_string_01=>'APP_NAME'
,p_substitution_value_01=>'Sample Trees'
,p_substitution_string_02=>'GETTING_STARTED_URL'
,p_substitution_value_02=>'http://www.oracle.com/technetwork/developer-tools/apex/index.html'
,p_substitution_string_03=>'APP_FAVICONS'
,p_substitution_value_03=>'<link rel="shortcut icon" href="#IMAGE_PREFIX#apex_ui/img/favicons/app-sample-trees.ico"><link rel="icon" sizes="16x16" href="#IMAGE_PREFIX#apex_ui/img/favicons/app-sample-trees-16x16.png"><link rel="icon" sizes="32x32" href="#IMAGE_PREFIX#apex_ui/im'
||'g/favicons/app-sample-trees-32x32.png"><link rel="apple-touch-icon" sizes="180x180" href="#IMAGE_PREFIX#apex_ui/img/favicons/app-sample-trees.png">'
,p_last_updated_by=>'ERICH'
,p_last_upd_yyyymmddhh24miss=>'20151005235441'
,p_file_prefix => nvl(wwv_flow_application_install.get_static_app_file_prefix,'')
,p_files_version=>3
,p_ui_type_name => null
);
end;
/
