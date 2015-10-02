#
# Cookbook Name:: aws-ecs-agent
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'docker'
include_recipe 'aws-ecs-agent::docker_install'
