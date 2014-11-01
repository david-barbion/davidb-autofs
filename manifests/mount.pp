define autofs::mount(
$fstype,
$access,
$options,
$target,
$master,
) {

  include 'autofs'

  concat::fragment { "${master}_${title}":
    target  => "/etc/auto.$master",
    content => "$title -fstype=${fstype},${access},${options} ${target}
",
  }

}
