require 'serverspec'

include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

describe 'zeromq library' do
  describe command('ldconfig -p | grep -q /opt/zeromq/lib/libzmq') do
    it { should return_exit_status 0 }
  end
end

describe file('/etc/ld.conf.so.d/zeromq.conf') do
  its(:content) { should match %r|/opt/zeromq/lib| }
end
