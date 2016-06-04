require 'serverspec'

set :backend, :exec

describe command('ldconfig -p | grep -q /usr/local/lib/libzmq') do
  its(:exit_status) { should eq 0 }
end

describe file('/usr/local/lib/libzmq.so') do
  it { should be_file }
end
