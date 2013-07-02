class system_users(
  $users              = [],
  $user_defaults      = {},
  $key_defaults       = {},
  $user_resource_type = 'user',
  $key_resource_type  = 'ssh_authorized_key'
) {
  each($users) { |$username, $values|
    $user = {"${username}" => $values}
    create_resources($user_resource_type, $user, $user_defaults)
    if $values['keys'] {
      each($values['keys']) { |$keyname, $values|
        $key = {"${username}-${keyname}" => merge($values, {user => "${username}"})}
        create_resources($key_resource_type, $key, $key_defaults)
      }
    }
  }
}
