node default {
  class { '::profiles::base::system':
    icinga_repo => lookup('icinga::repo::type')
  }
  ->
  class { '::profiles::base::mysql': }
  ->
  class { '::profiles::base::apache': }
  ->
  class { '::profiles::icinga::icinga2':
    node_name       => lookup('icinga::icinga2::node_name'),
    zone_name       => lookup('icinga::icinga2::zone_name'),
    zones           => lookup('icinga::icinga2::zones'),
    endpoints       => lookup('icinga::icinga2::endpoints'),
    ca_cert         => lookup('icinga::icinga2::ca_cert'),
    ca_key          => lookup('icinga::icinga2::ca_key'),
    node_cert       => lookup('icinga::icinga2::node_cert'),
    node_key        => lookup('icinga::icinga2::node_key'),
    features        => { },
  }
  ->
  class { '::profiles::icinga::icingaweb2':
    node_name => lookup('icinga::icinga2::node_name'),
    modules => {
      "cube" => {},
      "map" => {}
    }
  }
}
