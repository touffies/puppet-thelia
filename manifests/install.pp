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
  exec { 'git clone thelia ':
        command => 'git clone --recursive https://github.com/thelia/thelia.git /var/www/thelia.dev',
        creates => '/var/www/thelia.dev',
        require => Package["git"]
    }

  # Install
  exec { "run composer for installing dependencies":
    command   => "composer install",
    cwd       => '/var/www/thelia.dev',
    require   => Class['composer'],
    timeout   => 600
  }
}

