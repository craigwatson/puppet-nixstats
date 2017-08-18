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

  include ::python

  $packages = [
    'python-dev',
    'libffi-dev',
    'libssl-dev',
    'python-setuptools',
    'gcc',
    'libevent-dev',
    'python-pip'
  ]

  ensure_packages($packages)

  package { 'nixstats':
    ensure   => $::nixstats::package_ensure,
    provider => 'pip',
    require  => User['nixstats'],
  }

}
