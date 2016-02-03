prompt --application/shared_components/plugins/region_type/com_oracle_apex_html5_bar_chart
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(658375669497504168)
,p_plugin_type=>'REGION TYPE'
,p_name=>'COM.ORACLE.APEX.HTML5_BAR_CHART'
,p_display_name=>'HTML 5 Bar Chart'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('REGION TYPE','COM.ORACLE.APEX.HTML5_BAR_CHART'),'#IMAGE_PREFIX#plugins/com.oracle.apex.html5_bar_chart/1.0/')
,p_javascript_file_urls=>'#PLUGIN_FILES#com_oracle_apex_html5_bar_chart.js'
,p_css_file_urls=>'#PLUGIN_FILES#com_oracle_apex_html5_bar_chart.css'
,p_plsql_code=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'FUNCTION RENDER (',
'    P_REGION IN APEX_PLUGIN.T_REGION,',
'    P_PLUGIN IN APEX_PLUGIN.T_PLUGIN,',
'    P_IS_PRINTER_FRIENDLY IN BOOLEAN',
') RETURN APEX_PLUGIN.T_REGION_RENDER_RESULT IS',
'BEGIN',
'    HTP.PRN(''<div id="''||APEX_ESCAPE.HTML_ATTRIBUTE(P_REGION.STATIC_ID)||''_chart" class="hbc">'');',
'    HTP.PRN(''</div>'');',
'    ',
'    APEX_JAVASCRIPT.ADD_ONLOAD_CODE (',
'        P_CODE => ''com_oracle_apex_html5_bar_chart(''||',
'            APEX_JAVASCRIPT.ADD_VALUE(P_REGION.STATIC_ID)||',
'            ''{''||',
'                -- Why is this attribute needed if is not used?',
'                APEX_JAVASCRIPT.ADD_ATTRIBUTE(',
'                    ''pageItems'', ',
'                    APEX_PLUGIN_UTIL.PAGE_ITEM_NAMES_TO_JQUERY(P_REGION.AJAX_ITEMS_TO_SUBMIT)',
'                )||',
'                APEX_JAVASCRIPT.ADD_ATTRIBUTE(',
'                    ''ajaxIdentifier'', ',
'                    APEX_PLUGIN.GET_AJAX_IDENTIFIER, ',
'                    FALSE, ',
'                    FALSE',
'                )||',
'            ''}''||',
'        '');''',
'    );',
'    ',
'    RETURN NULL;',
'END RENDER;',
'',
'FUNCTION AJAX (',
'    P_REGION IN APEX_PLUGIN.T_REGION,',
'    P_PLUGIN IN APEX_PLUGIN.T_PLUGIN',
') RETURN APEX_PLUGIN.T_REGION_AJAX_RESULT IS',
'    -- Map region attributes to function constants',
'    -- MODERN, CLASSIC',
'    C_CHART_TYPE CONSTANT VARCHAR2(7) := P_REGION.ATTRIBUTE_15;',
'    -- MODERN, MODERN_2, SOLAR, METRO, CUSTOM, COLUMN',
'    C_COLOR_SCHEME CONSTANT VARCHAR2(8) := P_REGION.ATTRIBUTE_17;',
'    C_CUSTOM_CHART_COLORS CONSTANT VARCHAR2(4000) := P_REGION.ATTRIBUTE_10;',
'    C_COLOR_COLUMN CONSTANT VARCHAR2(255) := P_REGION.ATTRIBUTE_19;',
'    -- NONE, IMAGE, ICON, INITIALS',
'    C_ICON_TYPE CONSTANT VARCHAR2(8) := case when C_CHART_TYPE = ''ICON'' then P_REGION.ATTRIBUTE_01 end;',
'    C_LABEL_COLUMN CONSTANT VARCHAR2(255) := P_REGION.ATTRIBUTE_02;',
'    C_LABEL_LINK CONSTANT VARCHAR2(255) := P_REGION.ATTRIBUTE_03;',
'    C_VALUE_COLUMN CONSTANT VARCHAR2(255) := P_REGION.ATTRIBUTE_04;',
'    C_VALUE_LINK CONSTANT VARCHAR2(255) := P_REGION.ATTRIBUTE_05;',
'    -- ABOVE, AROUND',
'    C_TEXT_POSITION VARCHAR2(6) := P_REGION.ATTRIBUTE_18;',
'    C_CHART_CSS_CLASSES CONSTANT VARCHAR2(32767) := P_REGION.ATTRIBUTE_06;',
'    C_IMAGE_URL CONSTANT VARCHAR2(4000) := P_REGION.ATTRIBUTE_07;',
'    C_CSS_ICON_CLASS_NAME CONSTANT VARCHAR2(255) := P_REGION.ATTRIBUTE_08;',
'    C_INITIALS_COLUMN CONSTANT VARCHAR2(255) := P_REGION.ATTRIBUTE_09;',
'    -- ABSOLUTE, RELATIVE',
'    C_BAR_WIDTH_CALCULATION CONSTANT VARCHAR2(8) := P_REGION.ATTRIBUTE_16;',
'    C_DISPLAY CONSTANT VARCHAR2(19) := P_REGION.ATTRIBUTE_11;',
'    C_PREFIX_FOR_VALUE CONSTANT VARCHAR2(4000) := P_REGION.ATTRIBUTE_12;',
'    C_POSTFIX_FOR_VALUE CONSTANT VARCHAR2(4000) := P_REGION.ATTRIBUTE_13;',
'    C_MAXIMUM_ROWS CONSTANT NUMBER := P_REGION.ATTRIBUTE_14;',
'    C_MESSAGE_WHEN_NO_DATA_FOUND CONSTANT VARCHAR2(4000) := P_REGION.ATTRIBUTE_20;',
'    ',
'    L_COLOR_COLUMN_NUMBER PLS_INTEGER;',
'    L_LABEL_COLUMN_NUMBER PLS_INTEGER;',
'    L_VALUE_COLUMN_NUMBER PLS_INTEGER;',
'    L_INITIALS_COLUMN_NUMBER PLS_INTEGER;',
'    ',
'    L_COLUMN_VALUE_LIST APEX_PLUGIN_UTIL.T_COLUMN_VALUE_LIST2;',
'    ',
'    L_COLOR VARCHAR2(4000) := NULL;',
'    L_LABEL VARCHAR2(4000) := NULL;',
'    L_LABEL_LINK VARCHAR2(4000) := NULL;',
'    L_VALUE VARCHAR2(4000) := NULL;',
'    L_VALUE_LINK VARCHAR2(4000) := NULL;',
'    L_IMAGE_URL VARCHAR2(4000) := NULL;',
'    L_CSS_ICON_CLASS_NAME VARCHAR2(4000) := NULL;',
'    L_INITIALS VARCHAR2(4000) := NULL;',
'    L_MESSAGE_WHEN_NO_DATA_FOUND VARCHAR2(4000) := NULL;',
'',
'    L_CUSTOM_CHART_COLORS_TABLE APEX_APPLICATION_GLOBAL.VC_ARR2;',
'    L_CUSTOM_CHART_COLORS VARCHAR2(32767) := NULL;',
'BEGIN',
'    L_COLUMN_VALUE_LIST := APEX_PLUGIN_UTIL.GET_DATA2(',
'        P_SQL_STATEMENT  => P_REGION.SOURCE,',
'        P_MIN_COLUMNS    => 1,',
'        P_MAX_COLUMNS    => NULL,',
'        P_COMPONENT_NAME => P_REGION.NAME,',
'        P_MAX_ROWS => C_MAXIMUM_ROWS',
'    );',
'',
'    L_COLOR_COLUMN_NUMBER := APEX_PLUGIN_UTIL.GET_COLUMN_NO (',
'        P_ATTRIBUTE_LABEL   => ''Color Column'',',
'        P_COLUMN_ALIAS      => C_COLOR_COLUMN,',
'        P_COLUMN_VALUE_LIST => L_COLUMN_VALUE_LIST,',
'        P_IS_REQUIRED       => C_COLOR_SCHEME = ''COLUMN'',',
'        P_DATA_TYPE         => APEX_PLUGIN_UTIL.C_DATA_TYPE_VARCHAR2',
'    );',
'    L_LABEL_COLUMN_NUMBER := APEX_PLUGIN_UTIL.GET_COLUMN_NO (',
'        P_ATTRIBUTE_LABEL   => ''Label Column'',',
'        P_COLUMN_ALIAS      => C_LABEL_COLUMN,',
'        P_COLUMN_VALUE_LIST => L_COLUMN_VALUE_LIST,',
'        P_IS_REQUIRED       => TRUE,',
'        P_DATA_TYPE         => APEX_PLUGIN_UTIL.C_DATA_TYPE_VARCHAR2',
'    );',
'    L_VALUE_COLUMN_NUMBER := APEX_PLUGIN_UTIL.GET_COLUMN_NO (',
'        P_ATTRIBUTE_LABEL   => ''Value Column'',',
'        P_COLUMN_ALIAS      => C_VALUE_COLUMN,',
'        P_COLUMN_VALUE_LIST => L_COLUMN_VALUE_LIST,',
'        P_IS_REQUIRED       => TRUE,',
'        P_DATA_TYPE         => APEX_PLUGIN_UTIL.C_DATA_TYPE_VARCHAR2',
'    );',
'    if C_ICON_TYPE = ''INITIALS'' then',
'        L_INITIALS_COLUMN_NUMBER := APEX_PLUGIN_UTIL.GET_COLUMN_NO (',
'            P_ATTRIBUTE_LABEL   => ''Initials Column'',',
'            P_COLUMN_ALIAS      => C_INITIALS_COLUMN,',
'            P_COLUMN_VALUE_LIST => L_COLUMN_VALUE_LIST,',
'            P_IS_REQUIRED       => true,',
'            P_DATA_TYPE         => APEX_PLUGIN_UTIL.C_DATA_TYPE_VARCHAR2',
'        );',
'    end if;',
'    -- Begin output as JSON',
'    OWA_UTIL.MIME_HEADER(''application/json'', FALSE);',
'    HTP.P(''Cache-Control: no-cache'');',
'    HTP.P(''Pragma: no-cache'');',
'    OWA_UTIL.HTTP_HEADER_CLOSE;',
'    ',
'    IF C_COLOR_SCHEME = ''CUSTOM'' THEN',
'        L_CUSTOM_CHART_COLORS_TABLE := APEX_UTIL.STRING_TO_TABLE(CASE WHEN C_CUSTOM_CHART_COLORS IS NOT NULL THEN TRIM(BOTH '''''''' FROM APEX_ESCAPE.JS_LITERAL(C_CUSTOM_CHART_COLORS)) END, '':'');',
'        L_CUSTOM_CHART_COLORS := ''"color_scheme":['';',
'        FOR I IN L_CUSTOM_CHART_COLORS_TABLE.FIRST .. L_CUSTOM_CHART_COLORS_TABLE.LAST LOOP',
'            IF I > 1 THEN',
'                L_CUSTOM_CHART_COLORS := L_CUSTOM_CHART_COLORS||'','';',
'            END IF;',
'            L_CUSTOM_CHART_COLORS := L_CUSTOM_CHART_COLORS||''"''||L_CUSTOM_CHART_COLORS_TABLE(I)||''"'';',
'        END LOOP;',
'        L_CUSTOM_CHART_COLORS := L_CUSTOM_CHART_COLORS||''],'';',
'    END IF;',
'',
'    L_MESSAGE_WHEN_NO_DATA_FOUND := APEX_ESCAPE.HTML_WHITELIST(',
'        APEX_PLUGIN_UTIL.REPLACE_SUBSTITUTIONS (',
'                P_VALUE  => C_MESSAGE_WHEN_NO_DATA_FOUND,',
'                P_ESCAPE => FALSE',
'            )',
'        );',
'',
'    HTP.PRN(',
'        ''{''||',
'            APEX_JAVASCRIPT.ADD_ATTRIBUTE (',
'                ''chart_type'',',
'                C_CHART_TYPE,',
'                FALSE,',
'                TRUE',
'            )',
'    );',
'    HTP.PRN(',
'        APEX_JAVASCRIPT.ADD_ATTRIBUTE (',
'            ''message_when_no_data_found'',',
'            L_MESSAGE_WHEN_NO_DATA_FOUND,',
'            TRUE,',
'            TRUE',
'        )',
'    );',
'    HTP.PRN(',
'        APEX_JAVASCRIPT.ADD_ATTRIBUTE (',
'            ''chart_css_class_names'',',
'            C_CHART_CSS_CLASSES,',
'            TRUE,',
'            TRUE',
'        )',
'    );',
'    HTP.PRN(',
'        APEX_JAVASCRIPT.ADD_ATTRIBUTE (',
'            ''icon_type'',',
'            C_ICON_TYPE,',
'            TRUE,',
'            TRUE',
'        )',
'    );',
'    IF C_COLOR_SCHEME = ''CUSTOM'' THEN',
'        HTP.PRN(',
'            L_CUSTOM_CHART_COLORS',
'        );',
'    ELSE',
'        HTP.PRN(',
'            APEX_JAVASCRIPT.ADD_ATTRIBUTE (',
'                ''color_scheme'',',
'                C_COLOR_SCHEME,',
'                TRUE,',
'                TRUE',
'            )',
'        );',
'    END IF;',
'    HTP.PRN(',
'            APEX_JAVASCRIPT.ADD_ATTRIBUTE (',
'                ''text_position'',',
'                C_TEXT_POSITION,',
'                FALSE,',
'                TRUE',
'            )||',
'            APEX_JAVASCRIPT.ADD_ATTRIBUTE (',
'                ''bar_width_calculation'',',
'                C_BAR_WIDTH_CALCULATION,',
'                FALSE,',
'                TRUE',
'            )||',
'            APEX_JAVASCRIPT.ADD_ATTRIBUTE (',
'                ''display'',',
'                C_DISPLAY,',
'                FALSE,',
'                TRUE',
'            )||',
'            CASE ',
'            	WHEN C_DISPLAY IN (''VALUE'') THEN',
'					APEX_JAVASCRIPT.ADD_ATTRIBUTE (',
'						''prefix_for_value'',',
'						C_PREFIX_FOR_VALUE,',
'						TRUE,',
'						TRUE',
'					)||',
'					APEX_JAVASCRIPT.ADD_ATTRIBUTE (',
'						''postfix_for_value'',',
'						C_POSTFIX_FOR_VALUE,',
'						TRUE,',
'						TRUE',
'					)',
'			END||',
'            ''"items":[''',
'    );',
'    ',
'    --FOR L_ROW_NUMBER IN L_COLUMN_VALUE_LIST(1).VALUE_LIST.FIRST .. L_COLUMN_VALUE_LIST(1).VALUE_LIST.LAST LOOP',
'    FOR L_ROW_NUMBER IN 1 .. L_COLUMN_VALUE_LIST(1).VALUE_LIST.COUNT LOOP',
'        BEGIN',
'            APEX_PLUGIN_UTIL.SET_COMPONENT_VALUES (',
'                P_COLUMN_VALUE_LIST => L_COLUMN_VALUE_LIST,',
'                P_ROW_NUM => L_ROW_NUMBER ',
'            );',
'            ',
'            IF L_ROW_NUMBER > 1 THEN',
'            	HTP.PRN('', '');',
'            END IF;',
'            ',
'            HTP.PRN(''{'');',
'            ',
'            L_LABEL := APEX_PLUGIN_UTIL.ESCAPE (',
'                APEX_PLUGIN_UTIL.GET_VALUE_AS_VARCHAR2 (',
'                    P_DATA_TYPE => L_COLUMN_VALUE_LIST(L_LABEL_COLUMN_NUMBER).DATA_TYPE,',
'                    P_VALUE => L_COLUMN_VALUE_LIST(L_LABEL_COLUMN_NUMBER).VALUE_LIST(L_ROW_NUMBER)',
'                ),',
'                P_REGION.ESCAPE_OUTPUT',
'            );',
'            HTP.PRN(',
'            	APEX_JAVASCRIPT.ADD_ATTRIBUTE (',
'                    ''label'',',
'                    L_LABEL,',
'                    FALSE',
'            	)',
'            );',
'            L_LABEL_LINK := ',
'                CASE ',
'                    WHEN C_LABEL_LINK IS NOT NULL THEN ',
'                        APEX_UTIL.PREPARE_URL (',
'                            APEX_PLUGIN_UTIL.REPLACE_SUBSTITUTIONS (',
'                                P_VALUE  => C_LABEL_LINK,',
'                                P_ESCAPE => FALSE',
'                            )',
'                        )',
'                END;',
'            HTP.PRN(',
'            	APEX_JAVASCRIPT.ADD_ATTRIBUTE (',
'                    ''label_link'',',
'                    L_LABEL_LINK',
'                )',
'            );',
'            L_VALUE := APEX_PLUGIN_UTIL.ESCAPE (',
'               APEX_PLUGIN_UTIL.GET_VALUE_AS_VARCHAR2 (',
'                   P_DATA_TYPE => L_COLUMN_VALUE_LIST(L_VALUE_COLUMN_NUMBER).DATA_TYPE,',
'                   P_VALUE => L_COLUMN_VALUE_LIST(L_VALUE_COLUMN_NUMBER).VALUE_LIST(L_ROW_NUMBER)',
'               ),',
'               P_REGION.ESCAPE_OUTPUT',
'            );',
'            HTP.PRN(',
'            	APEX_JAVASCRIPT.ADD_ATTRIBUTE (',
'                    ''value'',',
'                    L_VALUE,',
'                    FALSE,',
'                    C_VALUE_LINK IS NOT NULL OR L_COLOR_COLUMN_NUMBER IS NOT NULL OR C_CHART_TYPE = ''ICON''',
'                )',
'            );',
'            L_VALUE_LINK := ',
'                CASE ',
'                    WHEN C_VALUE_LINK IS NOT NULL THEN ',
'                        APEX_UTIL.PREPARE_URL (',
'                            APEX_PLUGIN_UTIL.REPLACE_SUBSTITUTIONS (',
'                                P_VALUE  => C_VALUE_LINK,',
'                                P_ESCAPE => FALSE',
'                            )',
'                        )',
'                END;',
'             HTP.PRN(',
'            	APEX_JAVASCRIPT.ADD_ATTRIBUTE (',
'                    ''value_link'',',
'                    L_VALUE_LINK,',
'                    TRUE,',
'                    L_COLOR_COLUMN_NUMBER IS NOT NULL OR C_CHART_TYPE = ''ICON''',
'                )',
'            );',
'            IF L_COLOR_COLUMN_NUMBER IS NOT NULL THEN',
'                L_COLOR := APEX_PLUGIN_UTIL.ESCAPE (',
'                   APEX_PLUGIN_UTIL.GET_VALUE_AS_VARCHAR2 (',
'                       P_DATA_TYPE => L_COLUMN_VALUE_LIST(L_COLOR_COLUMN_NUMBER).DATA_TYPE,',
'                       P_VALUE => L_COLUMN_VALUE_LIST(L_COLOR_COLUMN_NUMBER).VALUE_LIST(L_ROW_NUMBER)',
'                   ),',
'                   P_REGION.ESCAPE_OUTPUT',
'                );',
'                HTP.PRN(',
'                    APEX_JAVASCRIPT.ADD_ATTRIBUTE (',
'                        ''color'',',
'                        L_COLOR,',
'                        FALSE,',
'                        C_CHART_TYPE = ''ICON''',
'                    )',
'                );',
'            END IF;',
'            IF C_ICON_TYPE = ''IMAGE'' THEN',
'				L_IMAGE_URL := ',
'                    CASE ',
'                        WHEN C_IMAGE_URL IS NOT NULL THEN ',
'                            APEX_UTIL.PREPARE_URL (',
'                                APEX_PLUGIN_UTIL.REPLACE_SUBSTITUTIONS (',
'                                    P_VALUE  => C_IMAGE_URL,',
'                                    P_ESCAPE => FALSE',
'                                )',
'                            )',
'                    END;',
'				HTP.PRN(',
'					APEX_JAVASCRIPT.ADD_ATTRIBUTE (',
'						''image_url'',',
'						L_IMAGE_URL,',
'						FALSE,',
'						FALSE',
'					)',
'				);',
'			ELSIF C_ICON_TYPE = ''ICON'' THEN',
'				L_CSS_ICON_CLASS_NAME := APEX_PLUGIN_UTIL.REPLACE_SUBSTITUTIONS (',
'                    P_VALUE  => C_CSS_ICON_CLASS_NAME,',
'                    P_ESCAPE => TRUE',
'                );',
'				HTP.PRN(',
'                	APEX_JAVASCRIPT.ADD_ATTRIBUTE (',
'						''icon_css_class_name'',',
'						L_CSS_ICON_CLASS_NAME,',
'						FALSE,',
'						FALSE',
'					)',
'				);',
'			ELSIF C_ICON_TYPE = ''INITIALS'' THEN',
'				L_INITIALS := APEX_PLUGIN_UTIL.ESCAPE (',
'					APEX_PLUGIN_UTIL.GET_VALUE_AS_VARCHAR2 (',
'						P_DATA_TYPE => L_COLUMN_VALUE_LIST(L_INITIALS_COLUMN_NUMBER).DATA_TYPE,',
'						P_VALUE => L_COLUMN_VALUE_LIST(L_INITIALS_COLUMN_NUMBER).VALUE_LIST(L_ROW_NUMBER)',
'					),',
'					P_REGION.ESCAPE_OUTPUT',
'				);',
'				HTP.PRN(',
'                	APEX_JAVASCRIPT.ADD_ATTRIBUTE (',
'                    	''initials'',',
'	                    L_INITIALS,',
'	                    FALSE,',
'	                    FALSE',
'    	            )',
'    	        );',
'            END IF;',
'            ',
'			HTP.PRN(''}'');',
'            ',
'            APEX_PLUGIN_UTIL.CLEAR_COMPONENT_VALUES;',
'        EXCEPTION',
'            WHEN OTHERS THEN',
'                APEX_PLUGIN_UTIL.CLEAR_COMPONENT_VALUES;',
'                RAISE;',
'        END;',
'    END LOOP;',
'    HTP.PRN(',
'            '']''||',
'        ''}''',
'    );',
'    ',
'    RETURN NULL;',
'END AJAX;'))
,p_render_function=>'RENDER'
,p_ajax_function=>'AJAX'
,p_standard_attributes=>'SOURCE_SQL:SOURCE_REQUIRED:AJAX_ITEMS_TO_SUBMIT:ESCAPE_OUTPUT'
,p_sql_min_column_count=>1
,p_substitute_attributes=>false
,p_subscribe_plugin_settings=>true
,p_help_text=>'<p>This plugin draws horizontal bar charts containing labels, values and even icons</p>'
,p_version_identifier=>'5.0.1'
,p_about_url=>'http://apex.oracle.com/plugins'
,p_files_version=>16
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2534416051353907044)
,p_plugin_id=>wwv_flow_api.id(658375669497504168)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>100
,p_prompt=>'Icon Type'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'INITIALS'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(2534424155584907048)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'ICON'
,p_lov_type=>'STATIC'
,p_help_text=>'Select the icon type to be displayed.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2534416433252907044)
,p_plugin_attribute_id=>wwv_flow_api.id(2534416051353907044)
,p_display_sequence=>10
,p_display_value=>'Image'
,p_return_value=>'IMAGE'
,p_help_text=>'Displays an image HTML element on the left side of the chart.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2534416924334907044)
,p_plugin_attribute_id=>wwv_flow_api.id(2534416051353907044)
,p_display_sequence=>20
,p_display_value=>'CSS Icon'
,p_return_value=>'ICON'
,p_help_text=>'Displays an icon with the given CSS class.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2534417507859907044)
,p_plugin_attribute_id=>wwv_flow_api.id(2534416051353907044)
,p_display_sequence=>30
,p_display_value=>'Initials'
,p_return_value=>'INITIALS'
,p_help_text=>'Displays a colored circle containing the first two initials for each entry.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2534418009847907044)
,p_plugin_id=>wwv_flow_api.id(658375669497504168)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>10
,p_prompt=>'Label Column'
,p_attribute_type=>'REGION SOURCE COLUMN'
,p_is_required=>true
,p_column_data_types=>'VARCHAR2'
,p_is_translatable=>false
,p_help_text=>'Select the column from the region SQL Query that holds the labels for the chart.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2534418376976907045)
,p_plugin_id=>wwv_flow_api.id(658375669497504168)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Label Link Target'
,p_attribute_type=>'LINK'
,p_is_required=>false
,p_is_translatable=>false
,p_reference_scope=>'ROW'
,p_examples=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>Example 1: URL to navigate to page 10 and set P10_EMPNO to the EMPNO value of the clicked entry.',
'<pre>f?p=&amp;APP_ID.:10:&amp;APP_SESSION.::&amp;DEBUG.:RP,10:P10_EMPNO:&amp;EMPNO.</pre>',
'</p>',
'<p>Example 2: Display the EMPNO value of the clicked entry in a JavaScript alert',
'<pre>javascript:alert(''current empno: &amp;EMPNO.'');</pre>',
'</p>'))
,p_help_text=>'<p>Enter a target page to be called when the user clicks a label.</p>'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2534418807565907045)
,p_plugin_id=>wwv_flow_api.id(658375669497504168)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>20
,p_prompt=>'Value Column'
,p_attribute_type=>'REGION SOURCE COLUMN'
,p_is_required=>true
,p_column_data_types=>'VARCHAR2'
,p_is_translatable=>false
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>Select the column from the region SQL Query that holds the values for the chart.</p>',
'<p>Note: This value is not displayed on the chart items when the chart has been configured to display the bar width percentage instead.</p>'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2534419124201907045)
,p_plugin_id=>wwv_flow_api.id(658375669497504168)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>40
,p_prompt=>'Value Link Target'
,p_attribute_type=>'LINK'
,p_is_required=>false
,p_is_translatable=>false
,p_reference_scope=>'ROW'
,p_examples=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>Example 1: URL to navigate to page 10 and set P10_EMPNO to the EMPNO value of the clicked entry.',
'<pre>f?p=&amp;APP_ID.:10:&amp;APP_SESSION.::&amp;DEBUG.:RP,10:P10_EMPNO:&amp;EMPNO.</pre>',
'</p>',
'<p>Example 2: Display the EMPNO value of the clicked entry in a JavaScript alert',
'<pre>javascript:alert(''current empno: &amp;EMPNO.'');</pre>',
'</p>'))
,p_help_text=>'<p>Enter a target page to be called when the user clicks a value.</p>'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2534419599098907045)
,p_plugin_id=>wwv_flow_api.id(658375669497504168)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>190
,p_prompt=>'CSS Class Names'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_help_text=>'<p>Enter CSS class names to be added to the root element of the chart separated with spaces.</p>'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2534420022380907046)
,p_plugin_id=>wwv_flow_api.id(658375669497504168)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>7
,p_display_sequence=>120
,p_prompt=>'Image URL'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(2534416051353907044)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'IMAGE'
,p_help_text=>'<p>Enter the Image URL to be displayed as the chart icon. This attribute supports Substitution strings, such as query columns, <strong>&amp;IMAGE_URL.</strong>. Notice that substitutions with no value will be replaced with an empty string.</p>'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2534420368996907046)
,p_plugin_id=>wwv_flow_api.id(658375669497504168)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>8
,p_display_sequence=>110
,p_prompt=>'Icon CSS Class Name'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(2534416051353907044)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'ICON'
,p_help_text=>'<p>Enter the Icon CSS Class Name.</p>'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2534420775578907046)
,p_plugin_id=>wwv_flow_api.id(658375669497504168)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>9
,p_display_sequence=>130
,p_prompt=>'Initials Column'
,p_attribute_type=>'REGION SOURCE COLUMN'
,p_is_required=>true
,p_column_data_types=>'VARCHAR2'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(2534416051353907044)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'INITIALS'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>Select the column from the region SQL Query that holds the initials to be displayed as an icon.</p>',
'<p>Note: If the columns has more than two letters than the icon will includes three ellipses (...). Therefore, it is not recommended to use the label column.</p>'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2534421146554907046)
,p_plugin_id=>wwv_flow_api.id(658375669497504168)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>10
,p_display_sequence=>170
,p_prompt=>'Custom Colors'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(2534427009920907049)
,p_depending_on_condition_type=>'IN_LIST'
,p_depending_on_expression=>'CUSTOM'
,p_help_text=>'<p>Enter a list of CSS supported colors separated by colons.</p>'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2534421551604907046)
,p_plugin_id=>wwv_flow_api.id(658375669497504168)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>11
,p_display_sequence=>50
,p_prompt=>'Value Display'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'VALUE'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'<p>Select whether to display  the item value or the percentage as the right most text in the chart.</p>'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2534421942689907046)
,p_plugin_attribute_id=>wwv_flow_api.id(2534421551604907046)
,p_display_sequence=>10
,p_display_value=>'Value'
,p_return_value=>'VALUE'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2534422479181907047)
,p_plugin_attribute_id=>wwv_flow_api.id(2534421551604907046)
,p_display_sequence=>20
,p_display_value=>'Percentage'
,p_return_value=>'BAR_WIDTH'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2534422933508907047)
,p_plugin_id=>wwv_flow_api.id(658375669497504168)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>12
,p_display_sequence=>60
,p_prompt=>'Value Prefix'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>true
,p_depending_on_attribute_id=>wwv_flow_api.id(2534421551604907046)
,p_depending_on_condition_type=>'IN_LIST'
,p_depending_on_expression=>'VALUE'
,p_help_text=>'<p>Enter the text that prefixes the value.<p>'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2534423386073907047)
,p_plugin_id=>wwv_flow_api.id(658375669497504168)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>13
,p_display_sequence=>70
,p_prompt=>'Value Suffix'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>true
,p_depending_on_attribute_id=>wwv_flow_api.id(2534421551604907046)
,p_depending_on_condition_type=>'IN_LIST'
,p_depending_on_expression=>'VALUE'
,p_help_text=>'Enter the text that is appended to the value.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2534423806663907047)
,p_plugin_id=>wwv_flow_api.id(658375669497504168)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>14
,p_display_sequence=>180
,p_prompt=>'Maximum Rows'
,p_attribute_type=>'INTEGER'
,p_is_required=>true
,p_default_value=>'5'
,p_is_translatable=>false
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>Enter the maximum number of items to be displayed inside the region.</p>',
'<p>Note: Bar width calculations are based on the number of items displayed.</p>'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2534424155584907048)
,p_plugin_id=>wwv_flow_api.id(658375669497504168)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>15
,p_display_sequence=>90
,p_prompt=>'Display Type'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'TEXT'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'<p>Select how to display the chart information.</p>'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2534424604883907048)
,p_plugin_attribute_id=>wwv_flow_api.id(2534424155584907048)
,p_display_sequence=>10
,p_display_value=>'Icon Chart'
,p_return_value=>'ICON'
,p_help_text=>'Displays bars with the label and value above and add an icon on the left.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2534425057197907048)
,p_plugin_attribute_id=>wwv_flow_api.id(2534424155584907048)
,p_display_sequence=>20
,p_display_value=>'Text Chart'
,p_return_value=>'TEXT'
,p_help_text=>'Displays bars with the label and value either above or inline with the bar.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2534425532245907048)
,p_plugin_id=>wwv_flow_api.id(658375669497504168)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>16
,p_display_sequence=>80
,p_prompt=>'Bar Width Calculation'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'ABSOLUTE'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'<p>Select how to calculate the width of the bars in the chart.</p>'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2534425959944907048)
,p_plugin_attribute_id=>wwv_flow_api.id(2534425532245907048)
,p_display_sequence=>10
,p_display_value=>'Absolute'
,p_return_value=>'ABSOLUTE'
,p_help_text=>'100% bar width is represented by the maximum value displayed.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2534426518014907049)
,p_plugin_attribute_id=>wwv_flow_api.id(2534425532245907048)
,p_display_sequence=>20
,p_display_value=>'Relative'
,p_return_value=>'RELATIVE'
,p_help_text=>'100% bar width is represented by the sum of the values of all the displayed chart items.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2534427009920907049)
,p_plugin_id=>wwv_flow_api.id(658375669497504168)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>17
,p_display_sequence=>150
,p_prompt=>'Color Scheme'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'MODERN'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'<p>Select the color scheme used to render the chart.</p>'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2534427408173907049)
,p_plugin_attribute_id=>wwv_flow_api.id(2534427009920907049)
,p_display_sequence=>5
,p_display_value=>'Default'
,p_return_value=>'DEFAULT'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2534427884648907049)
,p_plugin_attribute_id=>wwv_flow_api.id(2534427009920907049)
,p_display_sequence=>10
,p_display_value=>'Modern'
,p_return_value=>'MODERN'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2534428350438907050)
,p_plugin_attribute_id=>wwv_flow_api.id(2534427009920907049)
,p_display_sequence=>20
,p_display_value=>'Modern 2'
,p_return_value=>'MODERN_2'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2534428896432907050)
,p_plugin_attribute_id=>wwv_flow_api.id(2534427009920907049)
,p_display_sequence=>30
,p_display_value=>'Solar'
,p_return_value=>'SOLAR'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2534429370013907050)
,p_plugin_attribute_id=>wwv_flow_api.id(2534427009920907049)
,p_display_sequence=>40
,p_display_value=>'Metro'
,p_return_value=>'METRO'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2534429914247907051)
,p_plugin_attribute_id=>wwv_flow_api.id(2534427009920907049)
,p_display_sequence=>50
,p_display_value=>'Custom'
,p_return_value=>'CUSTOM'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2534430394381907052)
,p_plugin_attribute_id=>wwv_flow_api.id(2534427009920907049)
,p_display_sequence=>60
,p_display_value=>'SQL Query Column'
,p_return_value=>'COLUMN'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2534430827822907053)
,p_plugin_id=>wwv_flow_api.id(658375669497504168)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>18
,p_display_sequence=>140
,p_prompt=>'Text Position'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'AROUND'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(2534424155584907048)
,p_depending_on_condition_type=>'IN_LIST'
,p_depending_on_expression=>'TEXT'
,p_lov_type=>'STATIC'
,p_help_text=>'<p>Select where to display the text within the chart.</p>'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2534431291621907053)
,p_plugin_attribute_id=>wwv_flow_api.id(2534430827822907053)
,p_display_sequence=>10
,p_display_value=>'Above'
,p_return_value=>'ABOVE'
,p_help_text=>'The label and value are displayed above the bar, to the left and right sides of the chart.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2534431774088907053)
,p_plugin_attribute_id=>wwv_flow_api.id(2534430827822907053)
,p_display_sequence=>20
,p_display_value=>'Inline'
,p_return_value=>'AROUND'
,p_help_text=>'The label, bar, and value are all displayed in a single line.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2534432241109907053)
,p_plugin_id=>wwv_flow_api.id(658375669497504168)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>19
,p_display_sequence=>160
,p_prompt=>'Colors Column'
,p_attribute_type=>'REGION SOURCE COLUMN'
,p_is_required=>true
,p_column_data_types=>'VARCHAR2'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(2534427009920907049)
,p_depending_on_condition_type=>'IN_LIST'
,p_depending_on_expression=>'COLUMN'
,p_examples=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<dl>',
'  <dt>Hexadecimal (hex) notation</dt><dd><pre>#FF3377</pre>;</dd>',
'  <dt>HTML colors</dt><dd><pre>blue</pre>.</dd>',
'</dl>'))
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>Select the column from the region SQL Query that holds the color codes for the chart. The color can be set using hex values or as the name of the color.</p>',
'<p>Note: If no column is entered then the color will automatically be calculated.</p>'))
);
end;
/
begin
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2534432638569907054)
,p_plugin_id=>wwv_flow_api.id(658375669497504168)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>20
,p_display_sequence=>200
,p_prompt=>'Message When No Data Found'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'No data found.'
,p_is_translatable=>true
,p_help_text=>'<p>Enter the message to be displayed when no data is found.</p>'
);
null;
end;
/
