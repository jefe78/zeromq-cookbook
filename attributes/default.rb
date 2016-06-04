#
# Cookbook Name:: zeromq
# Attributes:: default
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

default['zeromq']['dir'] = '/usr/local'
default['zeromq']['install_method'] = 'source'
default['zeromq']['src_url'] = 'https://github.com/zeromq/zeromq4-1.git'
default['zeromq']['version'] = 'v4.1.4'
default['zeromq']['creates'] = 'libzmq.so'
default['zeromq']['libsodium_version'] = '1.0.10'
default['zeromq']['libsodium_src_url'] = 'https://download.libsodium.org/libsodium/releases/libsodium-1.0.10.tar.gz'
default['zeromq']['libsodium_sha256_sum'] = '71b786a96dd03693672b0ca3eb77f4fb08430df307051c0d45df5353d22bc4be'
default['zeromq']['install_libsodium'] = true
