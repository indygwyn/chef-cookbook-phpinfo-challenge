#
# Cookbook:: phpinfo
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

%w( firewalld openssh-server httpd php ).each do |pkg|
  package(pkg)
end

%w( firewalld sshd httpd ).each do |svc|
  service(svc) do
    action [ :enable, :start ]
  end
end

%w( ssh http ).each do |svc|
  execute "firewalld_add_service_#{svc}" do
    command "firewall-cmd --add-service #{svc} --zone=public --permanent"
    not_if "firewall-cmd --list-all | grep #{svc}"
    notifies :reload, 'service[firewalld]'
  end
end

execute 'firewalld_default_zone_public' do
  command 'firewall-cmd --set-default-zone=public'
  not_if 'firewall-cmd --get-default-zone | grep public'
end

openssh_server node['sshd']['config_file']

template '/etc/httpd/conf/httpd.conf' do
  source 'httpd.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, 'service[httpd]'
end

directory('/var/www/html') do
  owner 'root'
  group 'apache'
  mode '0750'
end

file '/var/www/html/index.php' do
  content '<?php phpinfo(); ?>'
  owner 'root'
  group 'apache'
  mode '0644'
end
