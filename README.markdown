# System Users Module

Sage Imel <sage@sagenite.net>

This module provides a wrapper user class and module to enable simple management of
system users and their ssh keys through hiera.

# Dependencies

## Required
* Puppet 3.x
* Hiera

# Quick Start

Currently this module is closely coupled to Debian family Linux and to NGINX.

## Load the system_users class
<pre>
  include system_users
</pre>

## Define your users
<pre>
'system_users::users':
  'example':
    keys:
      'unique-key-name':
        'key': 'long-key-here'
</pre>
