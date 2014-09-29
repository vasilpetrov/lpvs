    Facter.add('lpvs_is_vuln') do
      setcode do
        Facter::Core::Execution.exec('grep -r -c -i "vulnerable" /opt/lpvs/scan_* | awk \'{if ($1 == 0) print "no"; else print "yes"}\'')
      end
    end
