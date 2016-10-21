#
# Cookbook: grub
# License: Apache 2.0
#
# Copyright 2016, Bloomberg Finance L.P.
#

require 'poise'
require 'chef/resource'
require 'chef/provider'

module Grub
  class Resource < Chef::Resource
    include Poise(fused: true)
    provides(:grub)
    actions(:create)

    attribute(:path, default: lazy { node['grub']['config']['path'] })
    attribute(:source, template: true, default_source: 'grub.conf.erb')

    action(:create) do
      notifying_block do
        file new_resource.path do
          content new_resource.source_content
          owner 'root'
          group 'root'
        end
      end
    end
  end
end
