prompt --application/shared_components/plugins/region_type/com_oracle_apex_slidetooltip
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(1392928436107493685)
,p_plugin_type=>'REGION TYPE'
,p_name=>'COM_ORACLE_APEX_SLIDETOOLTIP'
,p_display_name=>'Slide Tooltip'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('REGION TYPE','COM_ORACLE_APEX_SLIDETOOLTIP'),'#IMAGE_PREFIX#plugins/com.oracle.apex.slidetooltip/')
,p_javascript_file_urls=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#PLUGIN_FILES#slideTooltipList.js',
'#PLUGIN_FILES#com_oracle_apex_slide_tooltip.js',
''))
,p_css_file_urls=>'#PLUGIN_FILES#a-DetailedContentList.css'
,p_plsql_code=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'function render_slide_tooltip (',
'    p_region              in apex_plugin.t_region,',
'    p_plugin              in apex_plugin.t_plugin,',
'    p_is_printer_friendly in boolean )',
'    return apex_plugin.t_region_render_result',
'is',
'    c_slide_tooltip constant varchar2(255) := p_region.attribute_04;',
'begin',
'    if apex_application.g_debug then',
'        apex_plugin_util.debug_region (',
'            p_plugin => p_plugin,',
'            p_region => p_region );',
'    end if;',
'',
'    sys.htp.p( ''<div'' || apex_plugin_util.get_html_attr( ''id'', p_region.static_id || ''_slideTooltip'' ) || ''></div>'' );',
'',
'    apex_javascript.add_onload_code (',
'        p_code =>',
'            ''com_oracle_apex_slide_tooltip('' ||',
'            apex_javascript.add_value( p_region.static_id ) ||',
'            ''{'' ||',
'            apex_javascript.add_attribute( ''pageitems'',       apex_plugin_util.page_item_names_to_jquery( p_region.ajax_items_to_submit )) ||',
'            apex_javascript.add_attribute( ''slideTooltipOpt'', c_slide_tooltip ) ||',
'            apex_javascript.add_attribute( ''ajaxIdentifier'',  apex_plugin.get_ajax_identifier, false, false ) ||',
'            ''});'' );',
'',
'    return null;',
'end render_slide_tooltip;',
'',
'function ajax_slide_tooltip (',
'    p_region in apex_plugin.t_region,',
'    p_plugin in apex_plugin.t_plugin )',
'    return apex_plugin.t_region_ajax_result',
'is',
'    c_item_icon  constant varchar2(255) := p_region.attribute_01;',
'    c_item_title constant varchar2(255) := p_region.attribute_02;',
'    c_item_badge constant varchar2(255) := p_region.attribute_03;',
'    c_label_link constant varchar2(255) := p_region.attribute_05;',
'',
'    l_column_value_list apex_plugin_util.t_column_value_list2;',
'    l_link    varchar2(4000);',
'    l_icon    varchar2(4000);',
'    l_title   varchar2(4000);',
'    l_badge   varchar2(4000);',
'    l_content varchar2(4000);',
'begin',
'    if apex_application.g_debug then',
'        apex_plugin_util.debug_region (',
'            p_plugin => p_plugin,',
'            p_region => p_region',
'        );',
'    end if;',
'',
'    l_column_value_list := apex_plugin_util.get_data2(',
'                               p_sql_statement => p_region.source,',
'                               p_region        => p_region );',
'',
'    apex_json.initialize_output( p_http_cache => false );',
'    apex_json.open_array;',
'',
'    for l_row_number in 1 .. l_column_value_list( 1 ).value_list.count',
'    loop',
'        begin',
'            apex_plugin_util.set_component_values (',
'                p_column_value_list => l_column_value_list,',
'                p_row_num           => l_row_number );',
'',
'            l_link :=',
'                case when c_label_link is not null then',
'                    apex_util.prepare_url (',
'                        apex_plugin_util.replace_substitutions (',
'                            p_value  => c_label_link,',
'                            p_escape => false )',
'                        )',
'                end;',
'',
'            l_icon  := apex_escape.html( v( c_item_icon ));',
'            l_title := apex_escape.html( v( c_item_title ));',
'            l_badge := apex_escape.html( v( c_item_badge ));',
'',
'            apex_json.open_object;',
'            apex_json.  write( ''icon'',  l_icon );',
'            apex_json.  write( ''title'', l_title );',
'            apex_json.  write( ''badge'', l_badge );',
'            apex_json.  write( ''link'',  l_link );',
'            apex_json.  open_array( ''content'' );',
'',
'            for l_column_no in 1 .. p_region.region_columns.count',
'            loop',
'                if p_region.region_columns( l_column_no ).is_displayed then',
'                    if p_region.region_columns( l_column_no ).name not in ( c_item_icon, c_item_title, c_item_badge ) then',
'                        l_content := apex_escape.html( v( p_region.region_columns( l_column_no ).name ));',
'                        apex_json.open_object;',
'                        apex_json.  write( ''content'', l_content );',
'                        apex_json.  write( ''label'',   p_region.region_columns( l_column_no ).heading );',
'                        apex_json.close_object;',
'                    end if;',
'                end if;',
'            end loop;',
'',
'            apex_json.  close_array;',
'            apex_json.close_object;',
'            wwv_flow_plugin_util.clear_component_values;',
'        exception when others then',
'            wwv_flow_plugin_util.clear_component_values;',
'            raise;',
'        end;',
'    end loop;',
'    apex_json.close_array;',
'',
'    return null;',
'end ajax_slide_tooltip;'))
,p_render_function=>'render_slide_tooltip'
,p_ajax_function=>'ajax_slide_tooltip'
,p_standard_attributes=>'SOURCE_SQL:COLUMNS:COLUMN_HEADING'
,p_sql_min_column_count=>1
,p_substitute_attributes=>false
,p_subscribe_plugin_settings=>true
,p_help_text=>'This region plug-in is useful for displaying a report with additional fields either inline or in an expanded tooltip.'
,p_version_identifier=>'5.0.1'
,p_files_version=>352
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2467777081870506189)
,p_plugin_id=>wwv_flow_api.id(1392928436107493685)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>2
,p_prompt=>'Icon Column'
,p_attribute_type=>'REGION SOURCE COLUMN'
,p_is_required=>true
,p_column_data_types=>'VARCHAR2'
,p_is_translatable=>false
,p_help_text=>'Select the column from the region SQL Query that holds the icon displayed before the title.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2467777500651506190)
,p_plugin_id=>wwv_flow_api.id(1392928436107493685)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>3
,p_prompt=>'Title Column'
,p_attribute_type=>'REGION SOURCE COLUMN'
,p_is_required=>true
,p_column_data_types=>'VARCHAR2:NUMBER:DATE:TIMESTAMP:TIMESTAMP_TZ:TIMESTAMP_LTZ:INTERVAL_Y2M:INTERVAL_D2S:BLOB:CLOB:BFILE:ROWID'
,p_is_translatable=>false
,p_help_text=>'Select the column from the region SQL Query that holds the values displayed in the report.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2467777856721506190)
,p_plugin_id=>wwv_flow_api.id(1392928436107493685)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>5
,p_prompt=>'Badge Column'
,p_attribute_type=>'REGION SOURCE COLUMN'
,p_is_required=>true
,p_column_data_types=>'VARCHAR2:NUMBER:DATE:TIMESTAMP:TIMESTAMP_TZ:TIMESTAMP_LTZ:INTERVAL_Y2M:INTERVAL_D2S:BLOB:CLOB:BFILE:ROWID'
,p_is_translatable=>false
,p_help_text=>'Select the column from the region SQL Query that holds the value displayed at the end of each row displayed.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2467778293495506190)
,p_plugin_id=>wwv_flow_api.id(1392928436107493685)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>1
,p_prompt=>'Mode'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'slide'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'Select how the report fields are displayed.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2467779208493506191)
,p_plugin_attribute_id=>wwv_flow_api.id(2467778293495506190)
,p_display_sequence=>10
,p_display_value=>'Slide'
,p_return_value=>'slide'
,p_help_text=>'A dropdown indicator is included at end of each record. Pressing this indicator displays the additional fields inline within the report, pushing additional records down.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2467778692905506190)
,p_plugin_attribute_id=>wwv_flow_api.id(2467778293495506190)
,p_display_sequence=>20
,p_display_value=>'Tooltip'
,p_return_value=>'tooltip'
,p_help_text=>'The additional fields are displayed as a tooltip next to the record. The tooltip is displayed when you hover over the record.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2467779631043506191)
,p_plugin_id=>wwv_flow_api.id(1392928436107493685)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>4
,p_prompt=>'Link Target'
,p_attribute_type=>'LINK'
,p_is_required=>true
,p_default_value=>'#&ENAME.'
,p_is_translatable=>false
,p_help_text=>'<p>Enter a target page to be called when the user clicks a record.</p>'
);
end;
/
