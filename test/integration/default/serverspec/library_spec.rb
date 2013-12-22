require 'serverspec'

include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

# TODO: DRY
RSpec.configure do |c|
  c.path = '/sbin:/usr/sbin'
end

describe 'zeromq library' do
  describe command('ldconfig -p | grep -q /usr/local/lib/libzmq') do
    it { should return_exit_status 0 }
  end
end
