# == Class: nixstats::cron
#
# This class handles creating the cron to send data to nixstats.com
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
class nixstats::cron {
  cron { 'nixstats':
    command => '/bin/bash /etc/nixstats/nixstats.sh > /dev/null 2>&1',
    user    => 'nixstats',
    require => Exec['download_nixstats'],
  }
}
