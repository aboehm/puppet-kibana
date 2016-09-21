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

  Class['elastic::key'] -> 
  Class['kibana::repo'] ->
  Class['kibana::install'] ->
  Class['kibana::config'] ->
  Class['kibana::service']

  validate_re($ensure, 'present|installed|purged|absent|held|latest')
  validate_bool($enable, true, false)
  validate_re($running, 'running|stopped')

  ensure_resource( 'class', 'elastic::key', {
    ensure  => $ensure,
  } )

  ensure_resource( 'class', 'kibana::repo', {
    ensure  => $ensure,
    release => $release,
  } )

  ensure_resource( 'class', 'kibana::install', {
    ensure => $ensure,
  } )

  ensure_resource( 'class', 'kibana::config', {
    ensure    => $ensure,
  } )

  ensure_resource( 'class', 'kibana::service', {
    enable  => $enable,
    running => $running,
  } )
}



class kibana::install (
  $ensure = $kibana::params::ensure,
) inherits kibana::params {
  package { 'kibana': 
    ensure          => $ensure,
    install_options => ['--no-install-recommends'],
  }
}

class kibana::service (
  $enable  = $kibana::params::enable,
  $running = $kibana::params::running,
) inherits kibana::params {
  service { 'kibana':
    enable => $enable,
    ensure => $running,
  }
}

# vi: set ft=puppet expandtab shiftwidth=2 tabstop=2 :
