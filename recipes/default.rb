#
# Cookbook Name:: aws-ecs-agent
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'docker'
# so != amazon_linux; then

case node['platform_family']
when 'debian'
	include_recipe 'aws-ecs-agent::docker_install'
	include_recipe 'aws-ecs-agent::launch_docker'
when 'rhel'
	include_recipe 'aws-ecs-agent::install_agent_rhel'
end
