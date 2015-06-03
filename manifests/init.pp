# Class: globus
class globus (
  $gssapi_gsi_pkgversion = present,
  $force_tls = false,
  $name_compatibility = 'STRICT_RFC2818',
  $ciphers = ['HIGH'],
  $server_cipher_order = true
) {

  validate_bool($force_tls)
  validate_re($name_compatibility,['^STRICT_RFC2818', 'STRICT_GT2', 'HYBRID'], "the name_compatibility ${name_compatibility} is not valid")
  validate_array($ciphers)
  validate_bool($server_cipher_order)

  anchor{'globus::begin':} ->
  class{'globus::install':} ->
  class{'globus::config':} ->
  anchor{'globus::end':}

}
