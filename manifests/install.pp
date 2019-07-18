class icinga::install inherits icinga{

#package {$::icinga::Prepkg:
#ensure => present,
#}


file{$::icinga::repinstall:
source => 'puppet:///modules/icinga/repoInstall.sh',
mode =>'777',
}
exec {'installrpm':
path      => '/bin:/usr/bin:/sbin:/usr/sbin',
command => "bash +x /var/repoInstall.sh",
}

package{$::icinga::packageName:
 ensure => present,
  }
exec{'updateyum':
command => '/bin/yum -y update',
}

package{$::icinga::packageIcinga:
 ensure => present,
}

package{$::icinga::packageDB:
ensure => present,
}

file{'/etc/opt/rh/rh-php71/php.ini':
content => $str,
}
}
