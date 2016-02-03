prompt --application/pages/page_groups
begin
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(1679080816211228466)
,p_group_name=>'Desktop'
);
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(1679080918635229175)
,p_group_name=>'Mobile'
);
end;
/
