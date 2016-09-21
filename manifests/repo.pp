# == Class: kibana::repo
#
# Configure Kibana software repository.
#
# === Authors
#
# Alexander Böhm <alxndr.boehm@gmail.com>
#
# === Copyright
#
# Copyright 2016 Alexander Böhm
#

class kibana::repo (
  $ensure      = $kibana::params::ensure,
  $release     = $kibana::params::release,
  $include_src = $kibana::params::include_src,
) inherits kibana::params {

  validate_re($ensure, 'present|installed|purged|absent|held|latest')

  $ea = $ensure ? {
    /present|installed|latest/ => 'present',
    /absent|purged/            => 'absent',
    default                    => false,
  }

  if $ea != false {
    apt::source { 'kibana':
      ensure   => $ea,
      location => "http://packages.elastic.co/kibana/${release}/debian",
      release  => 'stable',
      repos    => 'main',
      include  => {
        src => $include_src,
      },
    }
  }
}

# vi: set ft=puppet expandtab shiftwidth=2 tabstop=2 :
