#
# Cookbook:: phpinfo
# Spec:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'phpinfo::default' do
  context 'When all attributes are default, on CentOS 7.6.1804' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: 'centos', version: '7.6.1804')
      runner.converge(described_recipe)
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

    # firewall zone set
    #
    # firewall ssh and http services allow
    #
    # sshd config verify

    it 'creates /etc/httpd/conf/httpd.conf' do
      expect(chef_run).to create_template('/etc/httpd/conf/httpd.conf').with(
        user: 'root',
        group: 'root',
        mode: '0644'
      )
    end

    it 'creates /var/www/html' do
      expect(chef_run).to create_directory('/var/www/html').with(
        user: 'root',
        group: 'apache',
        mode: '0750'
      )
    end

    it 'creates /var/www/html/index.php' do
      expect(chef_run).to create_file('/tmp/explicit_action').with(
        user: 'root',
        group: 'apache',
        mode: '0750'
      )
    end
  end
end
