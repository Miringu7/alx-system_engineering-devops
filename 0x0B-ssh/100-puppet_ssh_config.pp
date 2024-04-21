# set up your client SSH configuration file so that you
# can connect to a server without typing a password.
# Your SSH client configuration must be configured to use the private key ~/.ssh/school
# Your SSH client configuration must be configured to refuse to authenticate
# using a password

# Define class ssh_config
class ssh_config {
  
  # Define SSH client configuration file path
  $ssh_config_file = '/etc/ssh/ssh_config'

  # Ensure the SSH client configuration file exists
  file { $ssh_config_file:
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }

  # Manage the SSH client configuration options
  file_line { 'DisablePasswordAuth':
    ensure  => present,
    path    => $ssh_config_file,
    line    => 'PasswordAuthentication no',
    match   => '^#?PasswordAuthentication',
  }

  # Manage the SSH client configuration options for the specific host
  file_line { 'UsePrivateKey':
    ensure  => present,
    path    => $ssh_config_file,
    line    => 'IdentityFile ~/.ssh/school',
    match   => '^#?IdentityFile',
  }

}

# Include the ssh_config class
include ssh_config
