# === Copyright
#
# Copyright 2013 Continuent Inc.
#
# === License
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#		http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

class continuent_ebs_snapshot::install(
) {

    file { '/tmp/install_binaries':
      ensure => file,
      owner => 'root',
      mode => 700,
      content => template('continuent_ebs_snapshot/install_binaries.erb')
    } ->
    exec { "install_binaries":
      command => "/tmp/install_binaries",
      creates => "/usr/local/bin/ec2-consistent-snapshot"
    }
}