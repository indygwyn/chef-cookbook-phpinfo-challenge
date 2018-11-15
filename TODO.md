# Chef Cookbook Challenge
## Create a server to present phpinfo at http://localhost:80/index.php

### Description
As a candidate for the Linux Team,
I want to write a cookbook that will configure a server to present phpinfo on port 80 at http://localhost:80/index.php,
so that I can show my ability to learn on the fly and produce some awesome code.

### Acceptance Criteria
#### Code Quality
 - [] README must be current
 - [] Cookbook must have unit (spec) tests
 - [] Cookbook must have integration (inspec) test
 - [] Cookbook must converge using test kitchen
 - [] A second run of `kitchen converge` must have 0 updated resources
 - [] Cookbook integration tests must pass using test kitchen
 - [] Chef spec tests must pass
 - [] Default foodcritic tests must pass

#### OS Configuration
 - [] A hostbased firewall must be running
 - [] The hostbased firewall must be in a default-deny mode
 - [] The hostbased firewall must allow tcp port 80 from anywhere
 - [] The hostbased firewall must allow tcp port 22 from anywhere
 - [] SSHD service must be enabled and running
 - [] SSHD Configuration must prevent root from logging in remotely

#### Application Configuration
 - [] A web server must be installed
 - [] The web server me be enabled at boot
 - [] The web server must be running
 - [] The web server must be listening on port 80
 - [] The web server must be listening on 0.0.0.0
 - [] The web server must be able to present phpinfo with a request to index.php
 - [] The web server document root and it's contents must be owned by the root user
 - [] The web server document root and it's contents must be owned by the web server user group
 - [] The web server document root and it's contents must be readable by the root user
 - [] The web server document root and it's contents must be writable by the root user
 - [] The web server document root and it's contents must be executable by the root user
 - [] The web server document root and it's contents must be readable by the web server user group
 - [] The web server document root and it's contents must not be writable by the web server user group
 - [] The web server document root and it's contents must be executable by the web server user group
 - [] All other users and groups must have no access to the web server document root
