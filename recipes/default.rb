#
# Cookbook Name:: network_info
# Recipe:: default
#
# Copyright (C) 2014 Amalio G
# 
# All rights reserved - Do Not Redistribute
#


# install gem to get network data

chef_gem "ipaddress" do
  action :install
end

@ipregex = /^([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])(\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])){3}$/

node['network']['interfaces'].each do |iface, addrs|

	addrs['addresses'].each do |ip, params|

		if  @ipregex.match("#{ip}")
			netmask = node['network']['interfaces']["#{iface}"]['addresses']["#{ip}"]['prefixlen']
			ipadd = IPAddress ip + '/' + netmask
			netseg = ipadd.network.to_string.partition('/')
			node.default['network']['interfaces']["#{iface}"]['addresses']["#{ip}"]['netsegment'] = netseg[0]
			
			if iface == node['network']['default_interface']
				node.default['network']['default_network_segment'] = netseg[0]
			end
		end	
	end
end





