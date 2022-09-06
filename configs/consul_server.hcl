bootstrap_expect   = 5
client_addr        = "0.0.0.0"
bind_addr          = "{{ GetInterfaceIP \"bond0\" }}"
data_dir           = "/opt/consul"
datacenter         = "dc-emea"
log_level          = "INFO"
server             = true
ui                 = true
non_voting_server  = false
${retry_join}
