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

class thelia (
  $dir = "/var/www/thelia.dev",
  $tag = "master"
) {

  # Clone Thelia
  vcsrepo { $dir:
    ensure   => present,
    provider => git,
    source   => 'https://github.com/thelia/thelia.git',
    revision => $tag
    user     => 'vagrant',
    force => true
  }

  # Install PHPUnit
  php::pear::module { 'PHPUnit':
    repository  => 'pear.phpunit.de',
    use_package => 'no',
  }

  # Install dependencies
  composer::exec { 'run composer for installing dependencies':
    cmd                  => 'install',  # REQUIRED
    cwd                  => $dir, # REQUIRED
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