class icinga::service inherits icinga{

service{'restartDB':
name => $::icinga::serviceName,
ensure => 'running',
enable => true,
}





}
