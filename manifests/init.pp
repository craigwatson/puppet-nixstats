# == Class: nixstats
#
# This class handles installing the NIXStats agent. It roughly follows the
# installation script available via nixstats.com
#
# === Parameters:
#
# [*user_id*]
#   The hexadecimal user ID found on your NIXStats control panel when adding a
#   new node. It will look something like '55d1d06265689e75148b4567'.
#
# == Actions:
#
# * Adds the system 'nixstats' user and group
# * Creates the /etc/nixstats directory
# * Stores the server ID and user ID
# * Adds a cron to send the stats every minute
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
class nixstats (
  String $user_id,
  String $package_ensure = $::nixstats::params::package_ensure,
  Boolean $service_enable = $::nixstats::params::service_enable,
  String $service_ensure = $::nixstats::params::service_ensure,
) inherits nixstats::params {

  include ::nixstats::user
  include ::nixstats::config
  include ::nixstats::install
  include ::nixstats::service
  include ::nixstats::cleanup

}
