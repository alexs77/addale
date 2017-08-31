#!/bin/sh

src_dir="$HOME/Repos/EW/customer/allianz/addale"
dest_dir="/opt/addale-kitchen"

dest_ip="192.168.16.25 192.168.16.24 192.168.16.20"

case "$1" in
    t1) dest_ip=192.168.16.20 ;;
    t) dest_ip=192.168.16.20 ;;
    p1) dest_ip=192.168.16.24 ;;
    p2) dest_ip=192.168.16.25 ;;
    p) dest_ip="192.168.16.25 192.168.16.24" ;;
    all) dest_ip="192.168.16.25 192.168.16.24 192.168.16.20" ;;
esac

for ip in $dest_ip; do
    printf "%s\tSynce von Verzeichnis \`%s' zu \`%s:%s'\n" "`date`" "$src_dir" "$ip" "$dest_dir"

    time tar -cf - --exclude-vcs-ignores --exclude-vcs --exclude-backups -C "$src_dir" . \
        | ssh ask@$ip "
            umask 002
            sudo rm -rf $dest_dir || :
            sudo mkdir $dest_dir
            sudo tar -vxf - -C $dest_dir
            echo \================================================================================
        "
done

exit $?
# EOF
