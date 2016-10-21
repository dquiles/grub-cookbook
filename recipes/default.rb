#
# Cookbook: grub
#
# Copyright (c) 2016 Bloomberg L.P., All Rights Reserved.
#
#

template node['grub']['config']['path'] do
  source 'grub.conf.erb'
  mode 0644
end
