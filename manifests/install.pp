# Class: thelia
#
# This module manages thelia
# http/www.thelia.net
#
# Parameters:
# - None
#
#
# Author:
# Christophe Laffont
#

class thelia::install {
  
  # Clone Thelia
  vcsrepo { "/var/www/thelia.dev":
    ensure   => present,
    provider => git,
    source   => 'https://github.com/thelia/thelia.git',
    revision => 'master',
    user     => 'vagrant'
  }

  # Install
  exec { "run composer for installing dependencies":
    command   => "composer install",
    cwd       => '/var/www/thelia.dev',
    require   => [
      Class['composer']
    ],
    timeout   => 600
  }
}

