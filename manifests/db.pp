class icinga::db inherits icinga{
#package {$::icinga::packageDB:
#ensure => $package_ensure,
#}

file{$::icinga::createDBRole:
source => 'puppet:///modules/icinga/createDBRole.sh',
mode => '777',
}
file {$::icinga::pg_hba_path:
source => 'puppet:///modules/icinga/pg_hba.conf',
notify => Service["restartDB"],
}
#service{$::icinga::packageDB:
#ensure => 'running',
#enable => true,
#}
#exec {'import':
#path      => '/bin:/usr/bin:/sbin:/usr/sbin',
#environment => ["PGPASSWORD=$pgpassword"],
#command => "psql -U icinga -d icinga < /usr/share/icinga2-ido-pgsql/schema/pgsql.sql",
#}
file{$::icinga::icingaEnable:
source => 'puppet:///modules/icinga/icingaEnable.sh',
mode => '777',
}

file{$::icinga::icingaWebDB:
source => 'puppet:///modules/icinga/icingaWebDB.sh',
mode =>'777',
#provider=> shell,
}
exec {'createdb':
path      => '/bin:/usr/bin:/sbin:/usr/sbin',
command => "bash +x /var/createDBRole.sh",
}

exec {'enableIDO':
path      => '/bin:/usr/bin:/sbin:/usr/sbin',
command => "bash +x /var/icingaEnable.sh"
}
exec {'DbScript':
path      => '/bin:/usr/bin:/sbin:/usr/sbin',
command => "bash +x /var/icingaWebDB.sh",
}
exec{'ApacheConfig':
path => '/bin:/usr/bin:/sbin:/usr/sbin',
command => '/bin/icingacli setup config webserver apache --document-root /usr/share/icingaweb2/public >> /etc/httpd/conf.d/icingaweb2.conf',
}

exec{'NginxConfig':
path => '/bin:/usr/bin:/sbin:/usr/sbin',
command =>'/bin/icingacli setup config webserver nginx --document-root /usr/share/icingaweb2/public >> /etc/httpd/conf.d/Nginxicingaweb2.conf'
}



user{'add user':
name => 'www-data',
ensure => present,
groups => ['icingaweb2'],
require => Group["icingaweb2"],
}

file{"/etc/icingaweb2":
    ensure  =>  directory,
    mode    =>  '2770',
}

file{"/etc/icingaweb2/modules/monitoring/":
    ensure  =>  directory,
    mode    =>  '2770',
}

file{$::icinga::configModule:
source => 'puppet:///modules/icinga/config1.ini',
mode =>'777',
}

file{$::icinga::backend:
source => 'puppet:///modules/icinga/backends.ini',
mode =>'777',
}


file{$::icinga::commandTransport:
source => 'puppet:///modules/icinga/commandtransports.ini',
mode =>'777',
}


file{$::icinga::roles:
source => 'puppet:///modules/icinga/roles.ini',
mode =>'777',
}

file{$::icinga::authFile:
source => 'puppet:///modules/icinga/authentication.ini',
mode =>'777',
}


file{$::icinga::configFile:
source => 'puppet:///modules/icinga/config.ini',
mode =>'777',
}

file{$::icinga::resourcefile:
source => 'puppet:///modules/icinga/resources.ini',
mode =>'777',
}
exec {'Monitoring':
path      => '/bin:/usr/bin:/sbin:/usr/sbin',
command => "icingacli module enable monitoring",
}

service {['rh-php71-php-fpm','icinga2']:
ensure => 'running',
}
}
