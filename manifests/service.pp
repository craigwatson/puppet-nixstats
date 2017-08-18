# == Class: nixstats::service
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
class nixstats::service {

  service { 'nixstatsagent':
    ensure  => 'running',
    enable  => true,
    require => Exec['nixstats_reload_systemd'],
  }

}
