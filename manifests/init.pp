class system_users(
  $users,
  $managehome         = true,
  $homes              = '/home',
  $user_resource_type = 'user',
  $key_resource_type  = 'ssh_authorized_key'
) {

  $group_aliases = {
    'wheel' => $operatingsystem ? {
      'freebsd' => 'wheel',
      default   => 'root',
    },
  }

  $shell_aliases = {
    'bash' => $operatingsystem ? {
      'freebsd' => '/usr/local/bin/bash',
      default   => '/bin/bash',
    },
    'zsh' => $operatingsystem ? {
      'freebsd' => '/usr/local/bin/zsh',
      default   => '/bin/zsh',
    },
  }

  if $users != undef {
    create_resources('system_users::user', $users)
  }
}
