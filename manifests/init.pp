class system_users(
  $users              = [],
  $user_defaults      = {},
) {
  include ssh_keys

  each($users) { |$username, $values|
    $user = {"${username}" => $values}
    create_resources('user', $user, $user_defaults)
    if $values['keys'] {
      ssh_keys::user{$username:
        manage_ssh_dir => true,
      }
      
      each($values['keys']) { |$keyline|
        ssh_keys::authorized_key{"${username}-${keyline}":
          key_line => $keyline,
          user     => $username,
        }
      }
    }
  }
}
