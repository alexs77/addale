#!/bin/sh

a="/$0"; a=${a%/*}; a=${a:-.}; a=${a#/}/; script_dir=$(cd "$a"; pwd)
kitchen_dir="$script_dir/.."
exec /usr/bin/chef-client -j $kitchen_dir/nodes/$(hostname -s).json -c $kitchen_dir/client.rb $@
exit $?

# EOF
