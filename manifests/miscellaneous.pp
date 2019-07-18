class icinga::miscellaneous inherits icinga{
#service{'httpd':
#ensure => running,
#enable => true,
#}
#service{'firewalld':
#ensure => running,
#}

file{$::icinga::firewallScript:
source => 'puppet:///modules/icinga/firewallrul.sh',
mode => '777',
}
exec { 'enable firewall services':
         path      => '/bin:/usr/bin:/sbin:/usr/sbin',
          command   => 'bash +x /var/firewallrul.sh',
    }

#firewall { 'http':
 #   proto  => 'http',
  #  action => 'accept',
  #}

group {'testin':
name => 'icingaweb2',
ensure => present,
system => true,
}

user{'add user in group icingaweb2':
name => 'apache',
ensure => present,
groups => ['icingaweb2'],
require => Group["testin"],
}
exec {'runConfig':
path      => '/bin:/usr/bin:/sbin:/usr/sbin',
command => 'icingacli setup config directory --group icingaweb2',
#command =>'icingacli setup config webserver apache --document-root /usr/share/icingaweb2/public',
}
}
