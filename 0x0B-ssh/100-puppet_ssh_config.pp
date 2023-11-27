# Client SSH configuration file

file { '/home/christian/.ssh/config':
  ensure  => file,
  owner   => 'christian',
  group   => 'christian',
  mode    => '0600',
  content => "
Host 54.172.178.214
  IdentityFile ~/.ssh/school
  PasswordAuthentication no
 ",
}
