# == Class: nixstats::params
#
# This class handles non-passed parameters for the nixstats module.
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
class nixstats::params {
  $cron_package = $::osfamily ? {
    'RedHat'    => 'cronie',
    'Archlinux' => 'cron',
    'Debian'    => 'cron',
    default     => 'cron',
  }
}
