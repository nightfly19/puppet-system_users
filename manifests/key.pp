define system_users::key(
  $key,
  $user,
  $target = undef,
  $type = 'rsa'
) {
  ssh_authorized_key{$title:
    key    => $key,
    user   => $user,
    target => $target,
    type   => $type,
  }
}
