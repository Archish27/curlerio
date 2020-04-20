## Parsing Log solution

1. `awk -f parser.awk tmp_more_than_50`\
   Output : 161364

2. `awk 'NF>2 && NF%2==0 && !/[?]/{print $2,$3}' tmp_more_than_50 | sort | uniq -c`\
   Output : 
   2 GET "/automate"
   1 GET "/automate/8c7560d37c308befea72bea54db5253b9a2fbe50/error_logs"
   1 GET "/automate/9d1f22d3e2df4170283248234c7ba39618a02d42/error_logs"
   1 GET "/terminal/update_time"
   1 POST "/admin/blacklist_and_block_ip"
   1 POST "/admin/run_query"
   2 POST "/admin/user_search"
   2 POST "/main/sns_data"
  13 POST "/terminal/find_session_id"
   3 POST "/terminal/start"
   1 POST "/user/features_seen"
   1 POST "/user/onboarded"
  