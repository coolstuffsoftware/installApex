prompt --application/shared_components/plugins/region_type/com_oracle_apex_sampleappfooter
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(1664999720620507256)
,p_plugin_type=>'REGION TYPE'
,p_name=>'COM.ORACLE.APEX.SAMPLEAPPFOOTER'
,p_display_name=>'Sample Apps Footer'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('REGION TYPE','COM.ORACLE.APEX.SAMPLEAPPFOOTER'),'')
,p_plsql_code=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'function render (   p_region in apex_plugin.t_region,',
'                    p_plugin in apex_plugin.t_plugin,',
'                    p_is_printer_friendly in boolean )',
'        return apex_plugin.t_region_render_result is',
'begin',
'    sys.htp.p(''<div class="t-SocialFooter">'');',
'    sys.htp.p(''    <div class="row">'');',
'    sys.htp.p(''        <div class="col col-2 alpha">'');',
'    sys.htp.p(''            <a href="https://forums.oracle.com/forums/forum.jspa?forumID=137" target="_blank">'');',
'    sys.htp.p(''                        <span class="t-Icon fa fa-comments"></span>'');',
'    sys.htp.p(''                        Oracle OTN Forums'');',
'    sys.htp.p(''            </a>'');',
'    sys.htp.p(''        </div>'');',
'    sys.htp.p(''        <div class="col col-2">'');',
'    sys.htp.p(''            <a href="http://www.linkedin.com/skills/skill/Oracle_Application_Express" target="_blank">'');',
'    sys.htp.p(''                        <span class="t-Icon fa fa-linkedin-square"></span>'');',
'    sys.htp.p(''                        Connect on LinkedIn'');',
'    sys.htp.p(''            </a>'');',
'    sys.htp.p(''        </div>'');',
'    sys.htp.p(''        <div class="col col-2">'');',
'    sys.htp.p(''            <a href="http://twitter.com/oracleapexnews" target="_blank">'');',
'    sys.htp.p(''                        <span class="t-Icon fa fa-twitter"></span>'');',
'    sys.htp.p(''                        Follow us on Twitter'');',
'    sys.htp.p(''            </a>'');',
'    sys.htp.p(''        </div>'');',
'    sys.htp.p(''        <div class="col col-2">'');',
'    sys.htp.p(''            <a href="https://cloud.oracle.com/" target="_blank">'');',
'    sys.htp.p(''                        <span class="t-Icon fa fa-cloud"></span>'');',
'    sys.htp.p(''                        Oracle Database Cloud Service'');',
'    sys.htp.p(''            </a>'');',
'    sys.htp.p(''        </div>'');',
'    sys.htp.p(''        <div class="col col-2">'');',
'    sys.htp.p(''            <a href="http://apex.oracle.com/" target="_blank">'');',
'    sys.htp.p(''                        <span class="t-Icon a-Icon sample-apex"></span>'');',
'    sys.htp.p(''                        apex.oracle.com'');',
'    sys.htp.p(''            </a>'');',
'    sys.htp.p(''        </div>'');',
'    sys.htp.p(''        <div class="col col-2 omega">'');',
'    sys.htp.p(''            <a href="http://www.oracle.com/technetwork/developer-tools/apex/overview/index.html" target="_blank">'');',
'    sys.htp.p(''                        <span class="t-Icon a-Icon sample-otn"></span>'');',
'    sys.htp.p(''                        APEX on OTN'');',
'    sys.htp.p(''            </a>'');',
'    sys.htp.p(''        </div>'');',
'    sys.htp.p(''    </div>'');',
'    sys.htp.p(''</div>'');',
'',
'    return null;',
'end render;'))
,p_render_function=>'render'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>This region plug-in is used to display a custom footer at the bottom of pages with large icons for navigating to other sites such as twitter and linkedin.</p>',
'<p>Note: This plug-in should be customized to meet your specific requirements, rather than used as is.</p>'))
,p_version_identifier=>'5.0.1'
);
end;
/
