# == Class: nixstats::install
#
# This class handles installing various packages to support the NIXStats agent
# and also downloading and installing the agent script itself.
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
class nixstats::install {

  if $::nixstats::manage_packages == true {
    ensure_packages(['curl','gzip','sysstat',$::nixstats::params::cron_package], {'ensure' => 'present'})
    $require = [File['/etc/nixstats'],Package['curl']]
  } else {
    $require = File['/etc/nixstats']
  }

  exec { 'download_nixstats':
    command => '/usr/bin/curl -k -o /etc/nixstats/nixstats.sh https://api.nixstats.com/nixstats.sh',
    creates => '/etc/nixstats/nixstats.sh',
    require => $require,
  }

}
