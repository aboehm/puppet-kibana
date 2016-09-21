# kibana

#### Table of Contents

1. [Overview](#overview)
2. [Module Description](#module-description)
3. [Setup](#setup)
    * [What kibana affects](#what-kibana-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with kibana](#beginning-with-kibana)
4. [Usage](#usage)
5. [Reference](#reference)
5. [Limitations](#limitations)

## Overview

Puppet module for managing kibana.

## Module Description

Manage installation, configuration and service definition of kibana.

## Setup

### What kibana affects

* installs the elastic package maintainer key from elastic.co
* add software repository
* installs/helds/remove package
* place/remove elasticsearch configuration file
* activate/deactivate and starts/stop service

### Setup Requirements **OPTIONAL**

* aboehm/elastic (https://github.com/aboehm/puppet-elastic)
* puppetlabs/apt (https://forge.puppet.com/puppetlabs/apt)
* puppetlabs/stdlib (https://forge.puppet.com/puppetlabs/stdlib)

### Beginning with kibana

To do a simple installation and connect kibana to a local elasticsearch
instance, define as follows

~~~
class { 'kibana':
}
~~~

To remove:

~~~
class { 'kibana':
  ensure => absent
}
~~~

For further configuration details, look into `kibana::config`.

## Usage

Include kibana module and configure with hiera.

## Reference

* `kibana`: Define behavior of elasticsearch
* `kibana::config`: Declare actions for configuration files
* `kibana::install`: Install/remove package
* `kibana::params`: Basic parameters of module
* `kibana::repo`: Manage repository
* `kibana::service`: Service management

## Limitations

Only Debian/Ubuntu are supported.


