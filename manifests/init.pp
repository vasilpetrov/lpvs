# == Class: lpvs
#
# Full description of class lpvs here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'lpvs':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2014 Your name here, unless otherwise noted.
#
class lpvs {

	 file { "/opt/lpvs":
    		ensure => "directory",
    		owner  => "root",
    		group  => "root",
    		mode   => 755,
	 }
         
	 if $osfamily == "Debian" {

                file { "/usr/lib/ruby/vendor_ruby/facter/lpvs_is_vuln.rb":
                                ensure => file,
                                owner  => 'root',
                                group  => 'root',
                                mode   => 0644,
                                source => 'puppet:///modules/lpvs/lpvs_is_vuln.rb',
                 }

                 file { "/usr/lib/ruby/vendor_ruby/facter/lpvs_vuln_count.rb":
                                ensure => file,
                                owner  => 'root',
                                group  => 'root',
                                mode   => 0644,
                                source => 'puppet:///modules/lpvs/lpvs_vuln_count.rb',
                 }

                package { "libxml-libxslt-perl":
                        ensure => "installed"
                 }

         } elsif $osfamily == "RedHat" {

                file { "/usr/share/ruby/vendor_ruby/facter/lpvs_is_vuln.rb":
                                ensure => file,
                                owner  => 'root',
                                group  => 'root',
                                mode   => 0644,
                                source => 'puppet:///modules/lpvs/lpvs_is_vuln.rb',
                 }

                 file { "/usr/share/ruby/vendor_ruby/facter/lpvs_vuln_count.rb":
                                ensure => file,
                                owner  => 'root',
                                group  => 'root',
                                mode   => 0644,
                                source => 'puppet:///modules/lpvs/lpvs_vuln_count.rb',
                 }
		
                package {"perl-XML-LibXML":
                        ensure => latest,
                }

                package {"perl-XML-LibXSLT":
                        ensure => latest,
                }

                package { 'perl-Crypt-SSLeay':
                        ensure => latest,
                }

                package {'perl-LWP-Protocol-https':
                        ensure => latest,
                }

         }


         file { "/opt/lpvs/lpvs-scan.pl":
                        ensure => file,
                        owner  => 'root',
                        group  => 'root',
                        mode   => 0744,
                        source => 'puppet:///modules/lpvs/lpvs-scan.pl',
         }


	cron {'pkg_vuln_scan':
                        command => "perl /opt/lpvs/lpvs-scan.pl -s > /opt/lpvs/scan_$hostname",
                        user    => 'root',
                        hour    => "2",
                        minute  => "0",
                     }

}
