# == Class: nixstats::config
#
# == Actions:
#
# - Deploys systemd service file and reloads systemds
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

  file { '/etc/nixstats.ini-dist':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/nixstats/nixstats.ini',
    require => Package['nixstatsagent'],
  }

  exec { 'nixstats_copy_ini':
    command => '/bin/cp /etc/nixstats.ini-dist /etc/nixstats.ini'
    creates => '/etc/nixstats.ini',
    require => File['/etc/nixstats.ini-dist'],
  }

  file { '/etc/system/systemd/nixstatsagent.service':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/nixstats/nixstatsagent.service',
    notify  => Exec['nixstats_reload_systemd'],
    require => Exec['nixstats_copy_ini'],
  }

  exec { 'nixstats_reload_systemd':
    command     => '/bin/systemctl daemon-reload',
    refreshonly => true,
  }

  exec { 'nixstats_store_userid':
    command => "/usr/local/bin/nixstatshello ${::nixstats::user_id} /etc/nixstats-token.ini",
    creates => '/etc/nixstats-token.ini'
    require => Package['nixstatsagent']
  }

}
