# == Class: nixstats::cleanup
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
#
class nixstats::cleanup {

  $files = [
    '/etc/nixstats/serverid',
    '/etc/nixstats/token',
    '/etc/nixstats/user',
    '/etc/nixstats/nixstats.sh'
  ]

  file { $files:
    ensure => absent,
  }

  $directories = [
    '/etc/nixstats/retry'
  ]

  file { $directories:
    ensure  => absent,
    recurse => true,
    force   => true,
  }

  cron { 'nixstats':
    ensure => absent,
    user   => 'nixstats',
  }

}
