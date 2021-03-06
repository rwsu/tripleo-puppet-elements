
package {"python-cinderclient":
    before => Class["glance::api"]
}

class {"glance::api":
    auth_host => "$::keystone_host",
    keystone_tenant => "service",
    keystone_user => "glance",
    keystone_password => "$::service_password",
    pipeline => 'keystone',
    sql_connection => $::glance_db,
    enabled => $enabled,
}

class { 'glance::backend::file': }

class {"glance::registry":
    auth_host => "$::keystone_host",
    keystone_tenant => "service",
    keystone_user => "glance",
    keystone_password => "$::service_password",
    sql_connection => $::glance_db,
    enabled => $enabled,
}

