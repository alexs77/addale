# https://docs.chef.io/config_rb_solo.html
# Nach /etc/chef/solo.rb kopieren

# Pfade definieren
cookbook_path               "/opt/addale-kitchen/cookbooks"
role_path                   "/opt/addale-kitchen/roles"
environment_path            "/opt/addale-kitchen/environments"
data_bag_path               "/opt/addale-kitchen/data_bags"

# "encrypted_data_bag_secret" deprecated in Chef 12.x. => knife[:secret] and knife[:secret_file]
# https://github.com/chef/chef/pull/1885/commits/63c044871c93c9ed3fa80536a036dc8642a78d0e
encrypted_data_bag_secret   "/etc/chef/addale-encrypted_data_bag_secret"
data_bag_encrypt_version    2

# Wir haben keinen Chef Server
chef_zero.enabled           true
local_mode                  true

cookbook_email              "a@skwar.me"
cookbook_license            "none"

ssl_verify_mode             :verify_peer

# Logging
log_level                   :info
# Possible values: /path/to/log_location, STDOUT, STDERR, :win_evt (Windows Event Logger), or :syslog (writes to the syslog daemon facility with the originator set as chef-client). The application log will specify the source as Chef. Default value: STDOUT.
log_location                "/var/log/chef.log"
