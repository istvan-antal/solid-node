node default {
    package { "nginx": ensure => "installed" }

    service { "nginx":
        require => File['/etc/nginx/sites-available/default'],
        ensure => running,
        enable => true,
        hasrestart => true,
    }

    file { "/etc/nginx/sites-available/default":
        require => Package["nginx"],
        content  => template('main/nginx.conf.erb'),
        notify  => Service["nginx"]
    }

    service { "pm2":
        require => File['/etc/systemd/system/pm2.service'],
        provider => systemd,
        ensure => running,
        enable => true,
        hasrestart => true,
    }

    file { "/etc/systemd/system/pm2.service":
        require => Package["pm2"],
        #source  => "puppet:///modules/main/pm2.service",
        content => template('main/pm2.service.erb'),
        recurse => true,
    }

    package { [ 'grunt-cli', 'bower', 'pm2' ]:
        require => Exec["install_node"],
        ensure   => 'present',
        provider => 'npm',
    }

    exec { "install_node":
        require => Package[["build-essential", "openssl", "libssl-dev", "pkg-config"]],
        command => "${settings::modulepath}/main/install_node.sh",
        creates => "/usr/local/bin/node",
        logoutput => true,
        timeout => 1800
    }

    package { ["build-essential", "openssl", "libssl-dev", "pkg-config"]: ensure => "installed" }
}