# Class: fileserve
#
# This module manages fileserving.
#
# Parameters:
#
# Actions:
#
# Requires:
#  puppetlabs-stdlib - https://github.com/puppetlabs/puppetlabs-stdlib
#
#  Packaged NGINX
#    - RHEL: EPEL or custom package
#    - Debian/Ubuntu: Default Install or custom package
#    - SuSE: Default Install or custom package
#
#  stdlib
#    - puppetlabs-stdlib module >= 0.1.6
#    - plugin sync enabled to obtain the anchor type
#
# Sample Usage:
#
# The module works with sensible defaults:
#
# node default {
#   include fileserve
# }
class fileserve (


  ### START Package Configuration ###
  ### END Package Configuration ###

  ### START Service Configuation ###
  ### END Service Configuration ###

  ### START Hiera Lookups ###
  $directory_resource             = {},
  $file_resource                  = {},
  $dir_defaults                   = {},
  $file_defaults                  = {},

  ### END Hiera Lookups ###
) {
  notify { "$dir_defaults $directory_resource $file_resource $file_defaults Are what we are getting":}

  create_resources('fileserve::resource::file', $file_resource, $file_defaults)
  create_resources('fileserve::resource::directory', $directory_resource, $dir_defaults)
}
