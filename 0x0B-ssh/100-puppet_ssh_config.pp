# Client SSH configuration file

file { '/home/christian/.ssh/config':
  ensure  => file,
  owner   => 'christian',
  group   => 'christian',
  mode    => '0600',
  content => "
Host 3.80.19.9
  IdentityFile ~/.ssh/school
  PasswordAuthentication no
 ",
}
