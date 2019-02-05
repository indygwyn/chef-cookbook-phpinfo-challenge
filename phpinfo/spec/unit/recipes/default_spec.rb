#
# Cookbook:: phpinfo
# Spec:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'phpinfo::default' do
  context 'when run on CentOS 7.6.1804' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: 'centos', version: '7.6.1804')
      runner.converge(described_recipe)
    end

    before(:each) do # Skip dat shit
      allow_any_instance_of(Chef::Resource::Execute).to receive(:should_skip?).and_return(true)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    %w( firewalld openssh-server httpd php ).each do |package|
      it "installs #{package}" do
        expect(chef_run).to install_package package
      end
    end

    %w( firewalld sshd httpd ).each do |service|
      it "enables the #{service} service" do
        expect(chef_run).to enable_service service
        expect(chef_run).to start_service service
      end
    end

    #    %w( ssh http ).each do |svc|
    #      it "firewalld checks for #{svc}" do
    #  stub_command("firewall-cmd --list-all | grep #{svc}").and_return(false)
    #  expect(chef_run).to run_execute "firewall-cmd --list-all | grep #{svc}"
    #  stub_command("firewall-cmd --add-service #{svc} --zone=public --permanent").and_return(true)
    #  expect(chef_run).to run_execute "firewall-cmd --add-service #{svc} --zone=public --permanent"
    #      end
    #    end

    #    it 'firewalld default zone is already public' do
    #      stub_command("firewall-cmd --get-default-zone | grep public").and_return(true)
    #      expect(chef_run).to_not run_execute "firewall-cmd --set-default-zone=public"
    #    end

    #    it 'firewalld default zone is not set public' do
    #      stub_command("firewall-cmd --get-default-zone | grep public").and_return(false)
    #      expect(chef_run).to run_execute "firewall-cmd --set-default-zone=public"
    #    end

    it 'creates /etc/httpd/conf/httpd.conf' do
      expect(chef_run).to create_template('/etc/httpd/conf/httpd.conf')
        .with( user: 'root', group: 'root')
    end

    it 'creates /var/www/html' do
      expect(chef_run).to create_directory('/var/www/html')
        .with( user: 'root', group: 'apache')
        .with(recursive: true)
    end

    it 'creates /var/www/html/index.php' do
      expect(chef_run).to create_file('/var/www/html/index.php')
        .with( user: 'root', group: 'apache')
    end
  end
end
