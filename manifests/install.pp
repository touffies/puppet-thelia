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
    ensure   => latest,
    provider => git,
    source   => 'git://github.com/thelia/thelia.git',
    user     => 'vagrant',
  }

  # Install
  exec { "run composer for installing dependencies":
    command   => "composer install",
    cwd       => '/var/www/thelia.dev',
    require   => Class['composer'],
    timeout   => 600
  }
}

