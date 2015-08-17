# == Class: nixstats::config
#
# This class handles creating the directory structure surrounding NIXStats
# and also storing the server ID and user ID.
#
# == Actions:
#
# None
#
# === Authors:
#
# Craig Watson <craig@cwatson.org>
#
# === Copyright:
#
# Copyright (C) Craig Watson
# Published under the Apache License v2.0
#
class nixstats::config {

  File {
    owner   => 'nixstats',
    group   => 'nixstats',
    mode    => '0700',
  }

  file { '/etc/nixstats':
    ensure  => directory,
    require => [User['nixstats'],Group['nixstats']],
  }

  file { '/etc/nixstats/retry':
    ensure  => directory,
    require => File['/etc/nixstats'],
  }

  exec { 'nixstats_server_id':
    command => "/bin/bash -c 'echo \"$(ip addr | grep inet) $(hostname)\"  | sha256sum | awk \"{print \$1}\" > /etc/nixstats/serverid'",
    creates => '/etc/nixstats/serverid',
    require => File['/etc/nixstats'],
  }

  file { '/etc/nixstats/token':
    ensure  => file,
    require => File['/etc/nixstats'],
  }

  file { '/etc/nixstats/user':
    ensure  => file,
    content => "${::nixstats::user_id}\n",
    require => File['/etc/nixstats'],
  }
}
