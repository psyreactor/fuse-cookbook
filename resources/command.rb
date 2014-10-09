actions :run

default_action :run if defined?(default_action)

attribute :name, :kind_of => String, :name_attribute => true
attribute :command, :kind_of => String
attribute :task, :kind_of => String
attribute :user, :kind_of => String
attribute :password, :kind_of => String
attribute :parameters, :kind_of => String
attribute :user_os, :kind_of => String, :default => nil
attribute :bin_path, :kind_of => String, :default => nil
