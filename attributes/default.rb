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
default['zeromq']['sha1_sum'] = '08303259f08edd1faeac2e256f5be3899377135e'
default['zeromq']['src_url'] = 'http://download.zeromq.org'
default['zeromq']['version'] = '3.2.4'
