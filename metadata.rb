maintainer       'Johannes Plunien'
maintainer_email 'plu@pqpq.de'
license          'Apache 2.0'
description      'Installs/Configures zeromq'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '1.1.0'
name             'zeromq'
provides         'zeromq'
issues_url       'https://github.com/plu/zeromq-cookbook/issues'
source_url       'https://github.com/plu/zeromq-cookbook'

recipe 'zeromq', 'Installs zeromq based on the default installation method'
recipe 'zeromq::install_from_package', 'Installs zeromq from packages'
recipe 'zeromq::install_from_source', 'Installs zeromq from source'

%w(apt git yum build-essential).each do |cookbook|
  depends cookbook
end

%w(debian ubuntu centos redhat).each do |os|
  supports os
end

