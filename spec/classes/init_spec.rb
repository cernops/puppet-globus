require 'spec_helper'
describe 'globus' do

  context 'with defaults for all parameters' do
    it { should contain_class('globus') }
    it { should contain_package('globus-gssapi-gsi').with_ensure('present') }
    it { should contain_file('/etc/grid-security/gsi.conf').with_content(/^FORCE_TLS=false$/) }
    it { should contain_file('/etc/grid-security/gsi.conf').with_content(/^NAME_COMPATIBILITY=STRICT_RFC2818$/) }
    it { should contain_file('/etc/grid-security/gsi.conf').with_content(/^CIPHERS=HIGH$/) }
    it { should contain_file('/etc/grid-security/gsi.conf').with_content(/^SERVER_CIPHER_ORDER=true$/) } 
    context 'with force_tls true' do
        let(:params) { {:force_tls => true} }
        it { should contain_file('/etc/grid-security/gsi.conf').with_content(/^FORCE_TLS=true$/) }
    end
    context 'with name_compatibility set to HYBRID' do
       let(:params) { {:name_compatibility => 'HYBRID'} }
       it { should contain_file('/etc/grid-security/gsi.conf').with_content(/^NAME_COMPATIBILITY=HYBRID$/) }
    end
    context 'with ciphers set to [1,2,3]' do
       let(:params) { {:ciphers => ['1','2','3']} }
       it { should contain_file('/etc/grid-security/gsi.conf').with_content(/^CIPHERS=1 2 3$/) }
    end
    context 'with SERVER_CIPHER_ORDER set false' do
      let(:params) {{:server_cipher_order => false}}
      it { should contain_file('/etc/grid-security/gsi.conf').with_content(/^SERVER_CIPHER_ORDER=false$/) }
    end
  end
end
