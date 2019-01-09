# phpinfo

This cookbook installs httpd, php and makes a phpinfo available at http://0.0.0.0/

Code Quality
[x] README must be current
[] Cookbook must have unit (spec) tests
[x] Cookbook must have integration (inspec) test
[x] Cookbook must converge using test kitchen
[x] A second run of kitchen converge must have 0 updated resources
[x] Cookbook integration tests must pass using test kitchen
[x] Chef spec tests must pass
[x] Default foodcritic tests must pass

OS Configuration
[x] A hostbased firewall must be running
[x] The hostbased firewall must be in a default-deny mode
[x] The hostbased firewall must allow tcp port 80 from anywhere
[x] The hostbased firewall must allow tcp port 22 from anywhere
[x] SSHD service must be enabled and running
[x] SSHD Configuration must prevent root from logging in remotely

Application Configuration
[x] A web server must be installed
[x] The web server me be enabled at boot
[x] The web server must be running
[x] The web server must be listening on port 80
[x] The web server must be listening on 0.0.0.0
[x] The web server must be able to present phpinfo with a request to index.php
[] The web server document root and it's contents must be owned by the root user
[] The web server document root and it's contents must be owned by the web server user group
[] The web server document root and it's contents must be readable by the root user
[] The web server document root and it's contents must be writable by the root user
[] The web server document root and it's contents must be executable by the root user
[] The web server document root and it's contents must be readable by the web server user group
[] The web server document root and it's contents must not be writable by the web server user group
[] The web server document root and it's contents must be executable by the web server user group
[x] All other users and groups must have no access to the web server document root

