# # encoding: utf-8

# Inspec test for recipe phpinfo::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe firewalld do
  it { should be_installed }
  it { should be_running }
  its('default_zone') { should eq 'public' }
  it { should have_service_enabled_in_zone('ssh', 'public') }
  it { should have_service_enabled_in_zone('http', 'public') }
end

%w( firewalld openssh-server httpd php ).each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end

%w( firewalld sshd httpd ).each do |svc|
  describe service(svc) do
    it { should be_installed }
    it { should be_enabled }
    it { should be_running }
  end
end

describe sshd_config do
  its('PermitRootLogin') { should eq 'no' }
end

describe apache_conf do
  its('Listen') { should cmp '80' }
end

describe port(80) do
  it { should be_listening }
end

describe directory('/var/www/html') do
  it { should exist }
  its('owner') { should eq 'root' }
  its('group') { should eq 'apache' }
  its('mode') { should cmp '0750' }
end

command('find /var/www/html -type f').stdout.split.each do |fname|
  describe file(fname) do
    its('owner') { should eq 'root' }
    its('group') { should eq 'apache' }
    its('mode') { should cmp '0644' }
  end
end

describe http('http://localhost/') do
  its('status') { should cmp 200 }
  its('body') { should match 'PHP' }
  its('headers.Content-Type') { should match 'text/html' }
end
