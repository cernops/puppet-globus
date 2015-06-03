# Class: globus::install
class globus::install (
  $gssapi_gsi_pkgversion = $globus::gssapi_gsi_pkgversion
) {

  package{'globus-gssapi-gsi':
    ensure => $gssapi_gsi_pkgversion
  }
}
