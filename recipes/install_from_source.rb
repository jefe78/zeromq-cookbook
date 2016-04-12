#
# Cookbook Name:: zeromq
# Recipe:: install_from_source
#
# Copyright (C) 2013 Johannes Plunien
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'build-essential'

case node['platform_family']
when 'rhel', 'fedora'
  package 'openssl-devel'
  if node['zeromq']['version'] =~ /^2\..*/
    package 'libuuid-devel'
  end
when 'debian', 'ubuntu'
  package 'libssl-dev'
  if node['zeromq']['version'] =~ /^2\..*/
    package 'uuid-dev'
  end
end

zeromq_src_dir = "/usr/local/src/zeromq-#{node['zeromq']['version']}"

git zeromq_src_dir do
  repository node['zeromq']['src_url']
  revision node['zeromq']['version']
  action :sync
end

execute 'zeromq compile and install' do
  environment({'PATH' => '/usr/local/bin:/usr/bin:/bin'})
  command "./autogen.sh && ./configure --prefix=#{node['zeromq']['dir']} && make && make install"
  cwd zeromq_src_dir
  creates File.join(node['zeromq']['dir'], 'lib', node['zeromq']['creates'])
end

template '/etc/ld.so.conf.d/zeromq.conf' do
  group 'root'
  mode '0444'
  owner 'root'
end

execute 'ldconfig' do
  action :nothing
  command 'ldconfig'
  subscribes :run, 'template[/etc/ld.so.conf.d/zeromq.conf]', :immediately
end
