define system_users::user(
  $gid        = undef,
  $home       = undef,
  $username   = $title,
  $keys       = undef,
  $shell      = undef,
  $managehome = $system_users::managehome
) {

  $aliased_gid = $system_users::group_aliases[$gid]
  $aliased_shell = $system_users::shell_aliases[$shell]

  $user_gid = $aliased_gid ? {
    undef   => $gid,
    default => $aliased_gid,
  }

  $user_shell = $aliased_shell ? {
    undef   => $shell,
    default => $aliased_shell,
  }

  $user_home = $home ? {
    undef   => "${system_users::homes}/${username}",
    default => $home,
  }

  $user_hash = {
    "${username}" => { home       => $user_home,
                       gid        => $user_gid,
                       shell      => $user_shell,
                       managehome => $managehome, }
  }
    
  create_resources($system_users::user_resource_type, $user_hash)

  if $keys != undef {
    $key_defaults = { user => $username,
                      type => 'ssh-rsa',
    }

    create_resources($system_users::key_resource_type, $keys, $key_defaults)
  }
}
