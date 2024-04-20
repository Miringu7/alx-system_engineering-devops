# Declare a file resource for managing a file at /tmp/school
file { 'school':
  ensure  => 'present',
  mode    => '0744',
  owner   => 'www-data',
  group   => 'www-data',
  content => 'I love Puppet',
  path    => '/tmp/school',
}
