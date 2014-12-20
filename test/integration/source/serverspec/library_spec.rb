require 'serverspec'

set :backend, :exec

describe 'zeromq library' do
  describe command('ldconfig -p | grep -q /usr/local/lib/libzmq') do
    its(:exit_status) { should eq 0 }
  end
end
