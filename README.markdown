# System Users Module

Sage Imel <sage@sagenite.net>

This module provides a simple way to manage users and authorized keys using hiera. 
This revision depends upon the experimental parser

# Dependencies

## Required
* Puppet 3.2
* [parser=future](http://docs.puppetlabs.com/puppet/3/reference/lang_experimental_3_2.html)
* [puppet-ssh_keys](https://github.com/nightfly19/puppet-ssh_keys) 

# Quick Start

## Define your users (in hiera)
<pre>
'system_users::users':
  'example':
    keys:
      - 'ssh-rsa long-key-here foo@bar'
      - 'ssh-rsa another-long-key-here foo@bar'
</pre>

## Load the system_users class
<pre>
  include system_users
</pre>
