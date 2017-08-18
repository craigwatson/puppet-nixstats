# == Class: nixstats::params
#
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

  $package_ensure = 'present'
  $service_ensure = 'running'
  $service_enable = true

}
