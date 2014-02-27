# Class: thelia
#
# This module manages thelia
# http/www.thelia.net
#
# Parameters:
# - None
#
# Actions:
# - Install thelia
#
# Author:
# Christophe Laffont
#

class thelia {
  
  # Clone Thelia
  vcsrepo { "/var/www/${::hostname}":
    ensure   => present,
    provider => git,
    source   => 'https://github.com/thelia/thelia.git',
    revision => 'master',
    user     => 'vagrant'
  }

  # Install
  exec { 'run composer for installing dependencies':
    command   => "composer install",
    cwd => '/var/www/${::hostname}',
    timeout => 0,
    tries => 10
  }

}

