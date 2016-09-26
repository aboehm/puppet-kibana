# == Class: kibana::install
#
# Install kibana.
#
# === Authors
#
# Alexander Böhm <alxndr.boehm@gmail.com>
#
# === Copyright
#
# Copyright 2016 Alexander Böhm
#

class kibana::install (
  $ensure = $kibana::params::ensure,
) inherits kibana::params {
  package { 'kibana': 
    ensure          => $ensure,
    install_options => ['--no-install-recommends'],
  }
}

# vi: set ft=puppet expandtab shiftwidth=2 tabstop=2 :
