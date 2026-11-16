# Raises the open file limit for Nginx so it handles heavy concurrent load
exec { 'fix--for-nginx':
  command => 'sed -i s/15/4096/ /etc/default/nginx',
  path    => '/bin:/usr/bin',
}

# Restarts Nginx so the new limit applies
exec { 'restart-nginx':
  command => 'service nginx restart',
  path    => '/bin:/usr/bin:/usr/sbin:/sbin',
  require => Exec['fix--for-nginx'],
}
