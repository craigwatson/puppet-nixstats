# == Class: nixstats::user
#
# This class handles creating the user and group for the NIXStats agent.
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
class nixstats::user {
  group { 'nixstats':
    ensure => present,
  }

  user { 'nixstats':
    home    => '/etc/nixstats',
    shell   => '/bin/false',
    gid     => 'nixstats',
    system  => true,
    require => Group['nixstats'],
  }
}
