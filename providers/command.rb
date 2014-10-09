#
# Cookbook Name:: fuse
# Provider:: default
#
# Author:: Mariani Lucas <lmariani@gmail.com>
# Copyright 2014
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
use_inline_resources if defined?(use_inline_resources)

def whyrun_supported?
  true
end

action :run do
  new_resource.path = "#{node['fuse']['home']}/bin" if new_resource.path.nil?
  new_resource.user_os = node['fuse']['os']['user'] if new_resource.user_os.nil?

  execute new_resource.name do
    command "#{new_resource.bin_path}/client -u #{new_resource.user} -p #{new_resource.password} #{new_resource.command}:#{new_resource.task}  #{new_resource.parameters}"
    user new_resource.user_os
    action :run
  end

end
