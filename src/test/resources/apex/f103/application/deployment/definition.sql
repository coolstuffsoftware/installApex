prompt --application/deployment/definition
begin
wwv_flow_api.create_install(
 p_id=>wwv_flow_api.id(7177471983864396611)
,p_get_version_sql_query=>'SELECT OBJECT_NAME FROM SYS.USER_OBJECTS WHERE OBJECT_NAME = ''DEMO_CUSTOMERS'''
,p_deinstall_script_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'drop sequence DEMO_CUST_SEQ;',
'drop sequence DEMO_ORDER_ITEMS_SEQ;',
'drop sequence DEMO_ORD_SEQ;',
'drop sequence DEMO_PROD_SEQ;',
'',
'drop table demo_tags;',
'drop table demo_tags_type_sum;',
'drop table demo_tags_sum;',
'drop table demo_order_items;',
'drop table demo_product_info;',
'drop table demo_states;',
'drop table demo_orders;',
'drop table demo_customers;',
'drop table demo_constraint_lookup;',
'',
'drop package sample_pkg;',
'drop package sample_data_pkg;',
'',
''))
,p_required_free_kb=>100
,p_required_sys_privs=>'CREATE PROCEDURE:CREATE TABLE:CREATE TRIGGER:CREATE VIEW'
);
end;
/
