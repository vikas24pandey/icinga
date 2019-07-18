class icinga::params{
#$Prepkg = ['epel-release','httpd']


$packageName = ['epel-release','centos-release-scl','rh-php71-php-json','rh-php71-php-pgsql','rh-php71-php-xml','rh-php71-php-intl','rh-php71-php-common','rh-php71-php-pdo','rh-php71-php-mysqlnd','rh-php71-php-cli','rh-php71-php-mbstring','rh-php71-php-fpm','rh-php71-php-gd','rh-php71-php-zip','rh-php71-php-ldap','rh-php71-php-imagick','php-intl','php-gd','php-mysql','php-curl','php-mbstring']
$str = "date.timezone = US/Central"
$packageIcinga = ['icingaweb2','icingacli','httpd','icingaweb2-selinux','icinga2','icinga' ,'nagios-plugins-all']
$startIcinga = ['httpd','icinga2','icinga']
$firewallScript = '/var/firewallrul.sh'
$packageDB = ['postgresql-server','postgresql','icinga2-ido-pgsql']
$serviceName= ['httpd','icinga2','postgresql','firewalld']
$dbuser  = 'icinga'
$dbIcingaWeb2 = 'icingaweb2'
$package_ensure ='present'
$service_ensure = 'running'
$service_enable = true
$createDBRole = '/var/createDBRole.sh'
$pg_hba_path = '/var/lib/pgsql/data/pg_hba.conf'
$pgpassword = 'icinga'
$pgsqlFile = '/usr/share/icinga2-ido-pgsql/schema/pgsql.sql'
$icingaEnable = '/var/icingaEnable.sh'
$icingaWebDB = '/var/icingaWebDB.sh'
$icingaweb2Dir = '/etc/icingaweb2'
$configModule = '/etc/icingaweb2/modules/monitoring/config.ini'
$backend = '/etc/icingaweb2/modules/monitoring/backends.ini'
$commandTransport = '/etc/icingaweb2/modules/monitoring/commandtransports.ini'
$roles = '/etc/icingaweb2/roles.ini'
$authFile = '/etc/icingaweb2/authentication.ini'
$configFile = '/etc/icingaweb2/config.ini'
$resourcefile = '/etc/icingaweb2/resources.ini'
$repinstall = '/var/repoInstall.sh'
}
