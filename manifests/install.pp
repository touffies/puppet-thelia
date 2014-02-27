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
  package { ['git', 'git-core']:
    ensure => installed,
  }


  # Clone Thelia
  vcsrepo { "/var/www/thelia.dev":
    ensure   => latest,
    provider => git,
    source   => 'git://github.com/thelia/thelia.git',
    user     => 'vagrant',
    require  => Class['php::cli'],
  }

  # Install
  exec { "run composer for installing dependencies":
    command   => "composer install",
    cwd       => '/var/www/thelia.dev',
    require   => Class['composer'],
    timeout   => 600
  }
}

