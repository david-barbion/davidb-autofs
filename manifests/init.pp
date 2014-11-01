class autofs(
$package = $::autofs::params::package,
$purge = $::autofs::params::purge,
$master_dir = $::autofs::params::master_dir,
$mount_dir = $::autofs::params::mount_dir,
) inherits autofs::params {
  include 'autofs::package'

  file { $master_dir:
    ensure => directory,
    purge  => $purge,
  }


  service { 'autofs':
    ensure  => running,
    enable  => true,
    require => Package['autofs'],
  }
}
