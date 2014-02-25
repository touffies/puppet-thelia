# Class: thelia
#
# This module manages thelia
# http/www.thelia.net
#
# === Examples
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
  
  include apache 

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
}

