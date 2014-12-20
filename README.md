# <a name="title"></a> zeromq-cookbook [![Build Status](https://api.travis-ci.org/plu/zeromq-cookbook.png)](https://travis-ci.org/plu/zeromq-cookbook)
# DESCRIPTION

Installs zeromq.

# REQUIREMENTS

## Platform

* Tested on
  * Debian 6.0.8
  * Debian 7.2.0
  * Ubuntu 10.04
  * Ubuntu 12.04
  * CentOS 6.5

## Cookbooks

* apt
* build-essential
* yum

# ATTRIBUTES

* zeromq['dir'] = '/usr/local'
* zeromq['install_method'] = 'source'
* zeromq['sha256_sum'] = 'df96a141c85b65c2cb6c0db22223126623a09eecbfccb7f74400f3f938742f59'
* zeromq['src_url'] = 'http://download.zeromq.org'
* zeromq['version'] = '3.2.5'
* zeromq['creates'] = 'lib/libzmq.so'

Note: If you want to install a different version than 3.2.5, just
set the node attribute to the version you want.

If the `source` installation method is being used, the recipe uses the `creates` attribute
to be idempotent. If a newer version of zeromq does not create `lib/libzmq.so`
anymore, you can change this attribute.

# USAGE

Include the zeromq recipe to install zeromq on your system based on the default installation method:

include_recipe 'zeromq'

Currently the only installation method that is supported is: source

# LICENSE/AUTHOR

Author:: Johannes Plunien (plu@pqpq.de)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
