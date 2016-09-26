# == Class: kibana::service
#
# Configures kibana service.
#
# === Authors
#
# Alexander Böhm <alxndr.boehm@gmail.com>
#
# === Copyright
#
# Copyright 2016 Alexander Böhm
#

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
