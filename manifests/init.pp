# Class: thelia
#
# This module manages thelia
# http/www.thelia.net
#
# === Sample Usage:
#
# include thelia
#
# === Authors
#
# Christophe Laffont
#

class thelia (
  $tag = 'master', 
) {
  
  package{'git':
    name       => $osfamily ? {
      "Redhat" => "git",
      "Debian" => "git-core",
    },
    ensure     => present
  }

  # Clone Thelia
  vcsrepo { "/var/www/${::hostname}":
    ensure   => present,
    provider => git,
    source   => 'https://github.com/thelia/thelia.git',
    revision => $tag,
    user     => 'vagrant'
  }

  // Install
  exec { 'run composer for installing dependencies':
    command   => "composer install",
    cwd => '/var/www/${::hostname}',
    timeout => 0,
    tries => 10,
    require => Exec["install composer"]
  }

}

