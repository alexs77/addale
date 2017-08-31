# Path of the "secret file"
secret_file = node[:ew_icinga_client][:secret_file]
# Secret (Kennwort) laden - EncryptedDataBagItem
secret_edbi = Chef::EncryptedDataBagItem.load_secret(secret_file)
# Secret (Kennwort) laden - IO.read
secret_io = IO.read(node[:ew_icinga_client][:secret_file])

secret = secret_edbi

# Debugging - write out secrets, that have just been read
file "/tmp/secret_edbi" do
    content secret
end

file "/tmp/secret_io" do
    content secret_io
end

# Access an item in the Encrypted Data Bag
dbi = data_bag_item('ew-icinga-client', node['hostname'], secret)
nrpe = dbi['nrpe_service']
