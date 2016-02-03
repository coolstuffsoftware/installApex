prompt --application/shared_components/plugins/dynamic_action/com_oracle_apex_highlight
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(5336223411539651339)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'COM.ORACLE.APEX.HIGHLIGHT'
,p_display_name=>'Highlight'
,p_category=>'EFFECT'
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('DYNAMIC ACTION','COM.ORACLE.APEX.HIGHLIGHT'),'')
,p_plsql_code=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'-- The render function generates the necessary javascript code for the',
'-- dynamic action plug-in and registers this function with the dynamic action',
'-- client side framework.',
'-- The render function has a defined interface which every plug-in has to',
'-- implement. It''s designed in a way that future enhancements to the interface',
'-- will not break existing plug-ins.',
'function render_highlight (',
'    p_dynamic_action in apex_plugin.t_dynamic_action,',
'    p_plugin         in apex_plugin.t_plugin )',
'    return apex_plugin.t_dynamic_action_render_result',
'is',
'    l_result apex_plugin.t_dynamic_action_render_result;',
'begin',
'    -- During plug-in development it''s very helpful to have some debug information',
'    if apex_application.g_debug then',
'        apex_plugin_util.debug_dynamic_action (',
'            p_plugin         => p_plugin,',
'            p_dynamic_action => p_dynamic_action );',
'    end if;',
'    -- ***********************************',
'    -- Here starts the actual plug-in code',
'    -- ***********************************',
'    -- Register the javascript library the plug-in uses.',
'    -- The add_library call will make sure that just one instance of the',
'    -- library is loaded when the plug-in is used multiple times on the page.',
'    -- If the developer stores the javascript file on the web-server, the',
'    -- p_plugin.file_prefix will contain the web-server URL. If the variable',
'    -- contains #PLUGIN_PREFIX#, the file will be read from the database.',
'    apex_javascript.add_library (',
'        p_name      => ''highlight'',',
'        p_directory => p_plugin.file_prefix,',
'        p_version   => null );',
'    -- Register the javascript function which should be called when the plug-in',
'    -- action is executed with the APEX client side dynamic action framework.',
'    -- The javascript function can be a named javascript function, but it can',
'    -- also be an anonymous function if the code is really short.',
'    -- For example: function(){this.affectedElements.hide(this.action.attribute01);}',
'    l_result.javascript_function := ''com_yourcompany_apex_highlight'';',
'    -- use the application level values if they are not set on instance level',
'    l_result.attribute_01        := coalesce(p_dynamic_action.attribute_01, p_plugin.attribute_01);',
'    l_result.attribute_02        := coalesce(p_dynamic_action.attribute_02, p_plugin.attribute_02);',
'',
'    return l_result;',
'end render_highlight;',
''))
,p_render_function=>'render_highlight'
,p_standard_attributes=>'ITEM:REGION:JQUERY_SELECTOR:JAVASCRIPT_EXPRESSION:TRIGGERING_ELEMENT:EVENT_SOURCE:REQUIRED'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
,p_about_url=>'http://www.oracleapex.info/'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(5336224311324660780)
,p_plugin_id=>wwv_flow_api.id(5336223411539651339)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Color'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_display_length=>10
,p_max_length=>10
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(5336224627946665538)
,p_plugin_id=>wwv_flow_api.id(5336223411539651339)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Speed'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(5238303369523541380)
,p_plugin_attribute_id=>wwv_flow_api.id(5336224627946665538)
,p_display_sequence=>10
,p_display_value=>'Slow'
,p_return_value=>'slow'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(5238303476807541381)
,p_plugin_attribute_id=>wwv_flow_api.id(5336224627946665538)
,p_display_sequence=>20
,p_display_value=>'Normal'
,p_return_value=>'normal'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(5238303597269541381)
,p_plugin_attribute_id=>wwv_flow_api.id(5336224627946665538)
,p_display_sequence=>30
,p_display_value=>'Fast'
,p_return_value=>'fast'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(5336225004659677797)
,p_plugin_id=>wwv_flow_api.id(5336223411539651339)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Color'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_display_length=>10
,p_max_length=>10
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(5336225321975682747)
,p_plugin_id=>wwv_flow_api.id(5336223411539651339)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Speed'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(5238303686710541381)
,p_plugin_attribute_id=>wwv_flow_api.id(5336225321975682747)
,p_display_sequence=>10
,p_display_value=>'Slow'
,p_return_value=>'slow'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(5238303783949541381)
,p_plugin_attribute_id=>wwv_flow_api.id(5336225321975682747)
,p_display_sequence=>20
,p_display_value=>'Normal'
,p_return_value=>'normal'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(5238303880086541381)
,p_plugin_attribute_id=>wwv_flow_api.id(5336225321975682747)
,p_display_sequence=>30
,p_display_value=>'Fast'
,p_return_value=>'fast'
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2F2F20412064796E616D696320616374696F6E20706C75672D696E2066756E6374696F6E2063616E2061636365737320697427732063757272656E7420636F6E7465787420776974682074686520227468697322206F626A6563742E0A2F2F2049742063';
wwv_flow_api.g_varchar2_table(2) := '6F6E7461696E7320666F72206578616D706C652022616374696F6E222077686963682073746F726573207468652064796E616D69632061747472696275746573206174747269627574653031202D20617474726962757465313020616E640A2F2F207468';
wwv_flow_api.g_varchar2_table(3) := '6520616A61784964656E746966696572207573656420666F722074686520414A41582063616C6C2E20496E73696465207468652066756E6374696F6E20796F752063616E207573650A2F2F2022746869732E6166666563746564456C656D656E74732220';
wwv_flow_api.g_varchar2_table(4) := '746F206765742061206A5175657279206F626A65637420776869636820636F6E7461696E7320616C6C207468652061666665637465640A2F2F20444F4D20656C656D656E7473206F75722064796E616D696320616374696F6E2073686F756C6420626520';
wwv_flow_api.g_varchar2_table(5) := '706572666F726D6564206F6E2E0A2F2F0A2F2F20466F722064796E616D696320616374696F6E20706C75672D696E2066756E6374696F6E7320796F752073686F756C642075736520612066756E6374696F6E206E616D652077686963682069730A2F2F20';
wwv_flow_api.g_varchar2_table(6) := '756E697175652C20736F20697420646F65736E27742067657420696E20636F6E666C6963742077697468206578697374696E672066756E6374696F6E732E20426573742070726163746973650A2F2F20697320746F20757365207468652073616D65206E';
wwv_flow_api.g_varchar2_table(7) := '616D65206173207573656420666F722074686520706C75672D696E20696E7465726E616C206E616D652E0A0A66756E6374696F6E20636F6D5F796F7572636F6D70616E795F617065785F686967686C696768742829207B0A20202F2F2049742773206265';
wwv_flow_api.g_varchar2_table(8) := '7474657220746F2068617665206E616D6564207661726961626C657320696E7374656164206F66207573696E670A20202F2F207468652067656E65726963206F6E65732C206D616B65732074686520636F6465206D6F7265207265616461626C650A2020';
wwv_flow_api.g_varchar2_table(9) := '766172206C436F6C6F72203D2028746869732E616374696F6E2E61747472696275746530313D3D6E756C6C3F2223666664373030223A746869732E616374696F6E2E6174747269627574653031293B0A2020766172206C5370656564203D202874686973';
wwv_flow_api.g_varchar2_table(10) := '2E616374696F6E2E61747472696275746530323D3D6E756C6C3F226E6F726D616C223A746869732E616374696F6E2E6174747269627574653032293B0A0A20202F2F204F6E6C7920686967686C6967687420696620776520617265206E6F742063616C6C';
wwv_flow_api.g_varchar2_table(11) := '656420647572696E6720696E697469616C697A6174696F6E206F66207468652070616765210A202069662028746869732E62726F777365724576656E7420213D3D20226C6F61642229207B0A202020202F2F2022746869732E6166666563746564456C65';
wwv_flow_api.g_varchar2_table(12) := '6D656E74732220657175616C732061206A5175657279206F626A65637420776869636820636F6E7461696E7320616C6C0A202020202F2F2074686520616666656374656420444F4D20656C656D656E7473206F757220616374696F6E2073686F756C6420';
wwv_flow_api.g_varchar2_table(13) := '626520706572666F726D6564206F6E2E0A202020202F2F205765206A757374206861766520746F206C6F6F70206F766572206974206279207573696E6720746865206A517565727920656163682066756E6374696F6E2E0A20202020746869732E616666';
wwv_flow_api.g_varchar2_table(14) := '6563746564456C656D656E74732E65616368280A20202020202066756E6374696F6E28297B0A20202020202020207661722024496E7374616E6365203D206A51756572792874686973293B202F2F2074686973206973207468652063757272656E742044';
wwv_flow_api.g_varchar2_table(15) := '4F4D206F626A6563740A20202020202020202F2F2073746F7265206F726967696E616C206261636B67726F756E6420636F6C6F720A2020202020202020766172206C43757272656E74436F6C6F72203D2024496E7374616E63652E63737328226261636B';
wwv_flow_api.g_varchar2_table(16) := '67726F756E642D636F6C6F7222293B0A20202020202020202F2F20312920646F2074686520616E696D6174696F6E20746F20746865206E657720636F6C6F720A20202020202020202F2F20322920616E696D617465206261636B20746F20746865206F72';
wwv_flow_api.g_varchar2_table(17) := '6967696E616C20636F6C6F720A202020202020202024496E7374616E63650A202020202020202020202E616E696D61746528207B206261636B67726F756E64436F6C6F723A206C436F6C6F72207D2C206C5370656564290A202020202020202020202E61';
wwv_flow_api.g_varchar2_table(18) := '6E696D61746528207B206261636B67726F756E64436F6C6F723A206C43757272656E74436F6C6F72207D2C206C5370656564293B0A2020202020207D293B0A20207D0A7D3B';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(5290142657076117053)
,p_plugin_id=>wwv_flow_api.id(5336223411539651339)
,p_file_name=>'highlight.js'
,p_mime_type=>'application/x-javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
