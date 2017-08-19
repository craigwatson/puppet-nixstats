# Change Log

## 3.0.0

### 2017-08-19 - Major Version release

#### Nixstats agent 1.0
* The module has been updated to install the nixstatsagent Python agent and daemon, and cleanly remove the old shell agent and cron

## 2.0.0

### 2017-03-10 - Major Version Release

#### Puppet 3 Support Removed
  * This module no longer supports Puppet 3. If you require Puppet 3 functionality, please use version [1.0.4 from the Puppet Forge](https://forge.puppet.com/CraigWatson1987/nixstats/readme), or the [puppet3](https://github.com/craigwatson/puppet-nixstats/tree/puppet3) branch in Git.

## 1.0.4

### 2016-12-30 - Bugfix Release

#### Class: `nixstats`
  * Fixing more stdlib deprecation warnings

## 1.0.3

### 2016-12-30 - Bugfix Release

#### Class: `nixstats`
  * Fixing stdlib deprecation warnings

## 1.0.2

### 2016-06-11 - Bugfix Release

#### Class: `nixstats::install`
  * Now using stdlib's `ensure_packages` function rather than declaring packages manually

## 1.0.1

### 2015-11-09 - Bugfix Release

#### Class: `nixstats::install`
  * Added dependency on the `curl` package resource for the installation `exec` resource

## 1.0.0

### 2015-08-17 - First Release!
  * First release to the forge
