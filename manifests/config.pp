# Class: globus::config
class globus::config (
  $force_tls = $globus::force_tls,
  $name_compatibility = $globus::name_compatibility,
  $ciphers = $globus::ciphers,
  $server_cipher_order = $globus::server_cipher_order
) {


  file{'/etc/grid-security/gsi.conf':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template('globus/gsi.conf.erb')
  }

}
