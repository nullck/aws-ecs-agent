[:stop, :start].each do |act|
	service "amazon-ecs-agent" do
		provider Chef::Provider::Service::Upstart
		supports [:status]
		action act
	end
end
