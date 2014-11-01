define autofs::master(

) {
  include 'autofs'

  file { "${::autofs::master_dir}/${title}.autofs":
    content => "${::autofs::mount_dir}/${title} /etc/auto.${title} --ghost,--timeout=30",
    owner   => "root",
    group   => "root",
    mode    => "0644",
    notify  => Service['autofs'],
    require => File["${::autofs::master_dir}"],
  }

  file { "${::autofs::mount_dir}/${title}":
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }

  concat { "/etc/auto.${title}":
    mode  => '0644',
    owner => 'root',
    group => 'root',
    notify => Service['autofs'],
  }

}
