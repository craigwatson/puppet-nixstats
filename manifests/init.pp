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
# [*manage_packages*]
#   Whether to manage associated packages or not. Helpful if you already have
#   other modules managing these packages. Either way, the module will only
#   manage them if they aren't declared elsewhere.
#   Default: true (boolean)
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
  $user_id,
  $manage_packages = true,
) {

  validate_legacy('Stdlib::Compat::String', 'validate_string', $user_id)
  validate_legacy('Stdlib::Compat::Bool', 'validate_bool', $manage_packages)

  include ::nixstats::params
  include ::nixstats::user
  include ::nixstats::config
  include ::nixstats::install
  include ::nixstats::cron

}
