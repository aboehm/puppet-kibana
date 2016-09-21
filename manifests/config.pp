# == Class: kibana::config
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

class kibana::config (
  $ensure                   = $kibana::params::ensure,

  $config                   = $kibana::params::config,
  $config_file_mode         = $kibana::params::config_file_mode,
  $user                     = $kibana::params::user,
  $group                    = $kibana::params::group,

  $interface                = $kibana::params::interface,
  $port                     = $kibana::params::port,
  $ssl_cert                 = $kibana::params::ssl_cert,
  $ssl_key                  = $kibana::params::ssl_key,

  $elasticsearch_url        = $kibana::params::elasticsearch_url,
  $elasticsearch_username   = $kibana::params::elasticsearch_username,
  $elasticsearch_password   = $kibana::params::elasticsearch_password,
  $elasticsearch_ssl_verify = $kibana::params::elasticsearch_ssl_verify,
  $elasticsearch_ssl_cert   = $kibana::params::elasticsearch_ssl_cert,
  $elasticsearch_ssl_key    = $kibana::params::elasticsearch_ssl_key,
) inherits kibana::params {

  validate_re($ensure, 'present|installed|purged|absent|held|latest')

  $ef = $ensure ? {
    /present|installed|latest/ => 'file',
    /absent|purged/            => 'absent',
    default                    => false,
  }

  if $ef != false {
    file { $config:
      ensure  => $ef,
      mode    => $config_file_mode,
      owner   => $user,
      group   => $group,
      content => template("kibana/kibana.yml"),
      notify  => Service['kibana'],
    }
  }
}

# vi: set ft=puppet expandtab shiftwidth=2 tabstop=2 :
