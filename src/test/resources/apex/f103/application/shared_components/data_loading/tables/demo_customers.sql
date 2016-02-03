prompt --application/shared_components/data_loading/tables/demo_customers
begin
wwv_flow_api.create_load_table(
 p_id=>wwv_flow_api.id(934437157345550625)
,p_name=>'Load Customers'
,p_owner=>'#OWNER#'
,p_table_name=>'DEMO_CUSTOMERS'
,p_unique_column_1=>'CUST_FIRST_NAME'
,p_is_uk1_case_sensitive=>'N'
,p_unique_column_2=>'CUST_LAST_NAME'
,p_is_uk2_case_sensitive=>'N'
,p_is_uk3_case_sensitive=>'N'
,p_column_names_lov_id=>wwv_flow_api.id(934472767219591364)
,p_skip_validation=>'N'
);
wwv_flow_api.create_load_table_lookup(
 p_id=>wwv_flow_api.id(940157064661615525)
,p_load_table_id=>wwv_flow_api.id(934437157345550625)
,p_load_column_name=>'CUST_STATE'
,p_lookup_owner=>'#OWNER#'
,p_lookup_table_name=>'DEMO_STATES'
,p_key_column=>'ST'
,p_display_column=>'STATE_NAME'
,p_insert_new_value=>'N'
);
wwv_flow_api.create_load_table_rule(
 p_id=>wwv_flow_api.id(934437457869550627)
,p_load_table_id=>wwv_flow_api.id(934437157345550625)
,p_load_column_name=>'TAGS'
,p_rule_name=>'Tags in Upper Case'
,p_rule_type=>'TO_UPPER_CASE'
,p_rule_sequence=>10
);
end;
/
