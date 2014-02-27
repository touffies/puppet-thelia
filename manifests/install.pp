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
    source   => 'https://github.com/thelia/thelia.git',
    user     => 'vagrant',
    force => true
  }

  # Install dependencies
  composer::exec { 'run composer for installing dependencies':
    cmd                  => 'install',  # REQUIRED
    cwd                  => '/var/www/thelia.dev', # REQUIRED
    prefer_source        => false,
    prefer_dist          => false,
    dry_run              => false, # Just simulate actions
    custom_installers    => false, # No custom installers
    scripts              => false, # No script execution
    interaction          => false, # No interactive questions
    optimize             => false, # Optimize autoloader
    dev                  => false, # Install dev dependencies
  }

}

