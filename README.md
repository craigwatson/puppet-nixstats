# puppet-nixstats

[![Build Status](https://secure.travis-ci.org/craigwatson/puppet-nixstats.png?branch=master)](http://travis-ci.org/craigwatson/puppet-nixstats)
[![Puppet Forge](http://img.shields.io/puppetforge/v/CraigWatson1987/nixstats.svg)](https://forge.puppetlabs.com/CraigWatson1987/nixstats)

## Table of Contents

1. [Overview - What is the puppet-nixstats module?](#overview)
1. [Module Description - What does the module do?](#module-description)
1. [Setup - The basics of getting started with puppet-nixstats](#setup)
    * [What puppet-nixstats affects](#what-puppet-nixstats-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with puppet-nixstats](#beginning-with-registry)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Overview

This module manages the installation and configuration of the NIXStats server monitoring agent, which currently in BETA.

## Module Description

A rough Puppetisation of the install scripts available via [nixstats.com](https://nixstats.com), this module creates the directory structure, and all necessary files for the NIXStats agent to run.

## Setup

### What puppet-nixstats affects
  * TBC

### Setup Requirements
  * TBC

## Usage

The simplest way to use the module is to pass your user ID to the module. The module will then configure the directories and packages necessary to run the NIXstats agent.

Your user ID is a hexadecimal string displayed at the end of the command you are given to manually install the agent.

    class { 'nixstats':
      user_id => '343249dab923d2389e9a1b',
    }

To stop the module from installing any supporting packages (e.g. `curl`), just set the `manage_packages` parameter to `false`.

## Reference

### Classes

#### `nixstats::config`

  * Creates the directory structure and deploys the user/server IDs

#### `nixstats::user`

  * Creates a system user and group for the agent to run as.

#### `nixstats::install`

  * Downloads the agent script, and optionally installs supporting system packages.

#### `nixstats::params`

  * O/S-specific and module configuration (e.g. paths to binaries and a boolean variable to control file deployment)

## Limitations

### Supported Operating Systems

* Ubuntu/Debian
* CentOS/RedHat (untested)
* Arch Linux (untested)

## Development

* Copyright (C) 2013 to 2015 Craig Watson - <craig@cwatson.org>
* Distributed under the terms of the Apache License v2.0 - see LICENSE file for details.
* Further contributions and testing reports are extremely welcome - please submit a pull request or issue on [GitHub](https://github.com/craigwatson/puppet-nixstats)
