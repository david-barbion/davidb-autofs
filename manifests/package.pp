class autofs::package(
$package = $::autofs::package
) {
  package { $package:
    ensure => present,
  }

}
