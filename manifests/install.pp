class continuent_ebs_snapshot::install(
) {




    file { '/tmp/install_binaries':
      ensure => file,
      owner => 'root',
      mode => 700,
      content => template('continuent_ebs_snapshot/install_binaries.erb')
    } ->
    exec { "install_binaries":
      command => "/tmp/install_binaries",
      creates => "/usr/local/bin/ec2-consistent-snapshot"
    }
 
   file { '/usr/local/bin/ebs_snap':
      ensure => file,
      owner => 'root',
      mode => 700,
      content => template('continuent_ebs_snapshot/ebs_snap.erb')
    }

}




