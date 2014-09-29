    Facter.add('lpvs_vuln_count') do
      setcode do
        Facter::Core::Execution.exec('grep -r -c -i "vulnerable" /opt/lpvs/scan_*')
      end
    end
