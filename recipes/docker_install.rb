directory node['aws_ecs_agent']['log_folder'] do
  owner 'docker'
  group 'docker'
  mode 0755
  action :create
end

docker_container 'ecs-agent' do
  image 'amazon/amazon-ecs-agent'
  env ['ECS_LOGFILE=/log/ecs-agent.log',
       "ECS_LOGLEVEL=#{node['aws_ecs_agent']['log_level']}",
       "ECS_CLUSTER=#{node['aws_ecs_agent']['cluster_name']}",
       "AWS_ACCESS_KEY_ID=#{node['aws_ecs_agent']['aws_access_key_id']}",
       "AWS_SECRET_ACCESS_KEY=#{node['aws_ecs_agent']['aws_secret_access_key']}"
      ]
  volume ["#{node['aws_ecs_agent']['log_folder']}:/log",
          '/var/run/docker.sock:/var/run/docker.sock'
         ]
  port "#{node['aws_ecs_agent']['port']}"
  cmd_timeout 120
  detach true
  tag node['aws_ecs_agent']['tag']
end
