require 'serverspec'

set :backend, :exec

describe command('ldconfig -p | grep -q /opt/zeromq/lib/libzmq') do
  its(:exit_status) { should eq 0 }
end

describe file('/opt/lib/libzmq.so') do
  it { should be_file }
end

describe file('/etc/ld.so.conf.d/zeromq.conf') do
  its(:content) { should match %r|/opt/zeromq/lib| }
end
