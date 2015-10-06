directory node['aws_ecs_agent']['log_folder'] do
  owner 'docker'
  group 'docker'
  mode 0755
  action :create
end

docker_container 'ecs-agent' do
  image 'amazon/amazon-ecs-agent'
  env ['ECS_LOGFILE=/log/ecs-agent.log',
       'ECS_LOGLEVEL=#{node['aws_ecs_agent']['log_level']}',
       'ECS_CLUSTER=#{node['aws_ecs_agent']['cluster_name']}',
       'AWS_ACCESS_KEY_ID=#{node['aws_ecs_agent']['aws_access_key_id']}',
       'AWS_SECRET_ACCESS_KEY=#{node['aws_ecs_agent']['aws_secret_access_key']}',
       'ECS_RESERVED_PORTS=#{node['aws_ecs_agent']['reserved_ports']}',
       'ECS_RESERVED_PORTS_UDP=#{node['aws_ecs_agent']['reserved_ports_udp']}',
       'ECS_ENGINE_AUTH_TYPE=#{node['aws_ecs_agent']['engine_auth_type']}',
       'ECS_ENGINE_AUTH_DATA=#{node['aws_ecs_agent']['engine_auth_data']}',
       'DOCKER_HOST=#{node['aws_ecs_agent']['docker_host']}',
       'ECS_DATADIR=#{node['aws_ecs_agent']['datadir']}',
       'ECS_UPDATES_ENABLED=#{node['aws_ecs_agent']['updates_enabled']',
       'ECS_UPDATE_DOWNLOAD_DIR=#{node['aws_ecs_agent']['update_download_dir']',
       'ECS_DISABLE_METRICS=#{node['aws_ecs_agent']['disable_metrics']',
       'ECS_DOCKER_GRAPHPATH=#{node['aws_ecs_agent']['docker_graphpath']',
       'ECS_RESERVED_MEMORY=#{node['aws_ecs_agent']['reserverd_memory']'

      ]
  volume ['#{node['aws_ecs_agent']['log_folder']}:/log',
          '/var/run/docker.sock:/var/run/docker.sock'
         ]
  port '#{node['aws_ecs_agent']['port']}'
  cmd_timeout 120
  detach true
  tag node['aws_ecs_agent']['tag']
end
