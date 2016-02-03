prompt --application/shared_components/logic/application_computations
begin
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(2185679108968042619)
,p_computation_sequence=>10
,p_computation_item=>'A01'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'select count(*) from demo_customers'
);
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(2185680074966048468)
,p_computation_sequence=>10
,p_computation_item=>'A02'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'select count(*) from demo_product_info'
);
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(2185680741119056179)
,p_computation_sequence=>10
,p_computation_item=>'A03'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select count(*)',
'  from demo_orders o,',
'       demo_customers c',
' where o.customer_id = c.customer_id'))
);
end;
/
