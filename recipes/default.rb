#
# Cookbook Name:: aws-ecs-agent
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe "docker"
# so != amazon_linux; then

include_recipe "aws-ecs-agent::docker_install"
include_recipe "aws-ecs-agent::launch_docker"
