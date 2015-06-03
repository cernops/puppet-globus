require 'spec_helper_acceptance'

describe 'globus' do
    it 'should configure and work with no errors' do
      pp = <<-EOS
         class{globus:
           name_compatibility => 'HYBRID'
         }
      EOS
      # Run it two times, it should be stable by then
      apply_manifest(pp, :catch_failures => true)
      apply_manifest(pp, :catch_changes => true)
      # gsi file should contain the above configuration.
      shell('grep NAME_COMPATIBILITY=HYBRID /etc/grid-security/gsi.conf',  :acceptable_exit_codes => 0)
    end
end
