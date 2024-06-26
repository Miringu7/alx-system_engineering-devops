# Increasing the amount of traffic an Nginx server can handle.

# Increase the ULIMIT of the default file
exec { 'fix--for-nginx':
    # Modify the ULIMIT value from 15 default value
    command => "/bin/sed -i 's/15/4096/' /etc/default/nginx",
    # path for the sed command
    path    => '/usr/local/bin/:/bin/',
}

# Restart Nginx service
exec { 'nginx-restart':
    # Restart the Nginx web-server
    command => '/etc/init.d/nginx restart',
    # path for the init.d script
    path    => '/etc/init.d/',
}
