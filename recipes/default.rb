#
# Cookbook Name:: HUBOT
# Recipe:: default
#
# Copyright 2017, nekonoprotocol
#
# All rights reserved - Do Not Redistribute
#

package "git" do
  action :install
end

execute "npm install -g hubot" do
  command "npm install -g hubot"
  not_if  { Dir.exists?("/usr/lib/node_modules/hubot") }
end

execute "npm install -g coffee-script" do
  command "npm install -g coffee-script"
  not_if  { Dir.exists?("/usr/lib/node_modules/coffee-script") }
end

execute "npm install -g yo" do
  command "npm install -g yo"
  not_if  { Dir.exists?("/usr/lib/node_modules/yo") }
end

execute "npm install -g generator-hubot" do
  command "npm install -g generator-hubot"
  not_if  { Dir.exists?("/usr/lib/node_modules/generator-hubot") }
end

directory "/home/rocketchat/hubot" do
  owner "rocketchat"
  group "rocketchat"
  recursive true
  mode 0755
  action :create
end

execute "yo hubot" do
  cwd "/home/rocketchat/hubot"
  command "sudo -u rocketchat yo hubot --owner=\"OWNER <owner@example.com>\" --name=\"bot\" --description=\"Bot\" --adapter=\"rocketchat\""
  not_if  { Dir.exists?("/home/rocketchat/hubot/bin") }
end

template "/home/rocketchat/hubot/bin/hubot" do
  owner "rocketchat"
  group "rocketchat"
  mode  0755
  source "default/hubot.erb"
  variables({
    :room => node[:hubot][:room],
    :user => node[:hubot][:user],
    :password => node[:hubot][:password]
  })
end

cookbook_file "/home/rocketchat/hubot/external-scripts.json" do
  source "default/external-scripts.json"
  owner "rocketchat"
  group "rocketchat"
  mode 0644
end

cookbook_file "/home/rocketchat/hubot/hubot_start.sh" do
  source "default/hubot_start.sh"
  owner "rocketchat"
  group "rocketchat"
  mode 0755
end

link "/etc/init.d/hubot" do
  to "/home/rocketchat/hubot/hubot_start.sh"
end

service "hubot" do
  ignore_failure true
  action [:enable, :start]
end
