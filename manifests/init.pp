# == Class: kibana
#
# Install and configure kibana.
#
# === Authors
#
# Alexander Böhm <alxndr.boehm@gmail.com>
#
# === Copyright
#
# Copyright 2016 Alexander Böhm
#

class kibana (
  $ensure    = $kibana::params::ensure,
  $enable    = $kibana::params::enable,
  $running   = $kibana::params::running,
  $release   = $kibana::params::release,
) inherits kibana::params {

  validate_re($ensure, 'present|installed|purged|absent|held|latest')
  validate_bool($enable, true, false)
  validate_re($running, 'running|stopped')
  
  include elastic

  anchor { 'kibana::begin': } ->
  Class['elastic::repo'] ->
  Class['apt::update'] ->
  Class['kibana::install'] ->
  Class['kibana::config'] ->
  Class['kibana::service'] ->
  anchor { 'kibana::end': }

  ensure_resource( 'class', 'kibana::install', {
    ensure => $ensure,
  } )

  ensure_resource( 'class', 'kibana::config', {
    ensure => $ensure,
  } )

  ensure_resource( 'class', 'kibana::service', {
    enable  => $enable,
    running => $running,
  } )
}

# vi: set ft=puppet expandtab shiftwidth=2 tabstop=2 :
