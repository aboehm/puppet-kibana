# == Class: kibana::params
#
# Default configuration values.
#
# === Authors
#
# Alexander Böhm <alxndr.boehm@gmail.com>
#
# === Copyright
#
# Copyright 2016 Alexander Böhm
#

class kibana::params {
  $ensure            = present
  $enable            = true
  $release           = '4.6'
  $running           = running

  $include_src       = false

  $config            = '/opt/kibana/config/kibana.yml'
  $config_file_mode  = '0644'
  $user              = 'kibana'
  $group             = 'kibana'

  $interface                = '127.0.0.1'
  $port                     = 5601
  $basepath                 = ''
  $ssl_cert                 = undef
  $ssl_key                  = undef

  $elasticsearch_url        = 'http://127.0.0.1:9200'
  $elasticsearch_username   = undef
  $elasticsearch_password   = undef
  $elasticsearch_ssl_verify = true
  $elasticsearch_ssl_ca     = undef 
  $elasticsearch_ssl_cert   = undef
  $elasticsearch_ssl_key    = undef
  $index                    = ".kibana"
}

# vi: set ft=puppet expandtab shiftwidth=2 tabstop=2 :
