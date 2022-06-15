docker_compose_path = '/workspaces/inspec-advanced-profile-developer-course-lab-environment/resources/docker-compose.yml'

describe yaml(docker_compose_path) do
  its(['services', 'workstation', 'image']) {should cmp 'learnchef/inspec_workstation'}
  its(['services', 'workstation', 'volumes']) {should cmp '.:/root'}
end

describe docker_compose_config(docker_compose_path) do
  its('services.workstation.image') {should cmp 'learnchef/inspec_workstation'}
  its('services.workstation.volumes') {should cmp '.:/root'}
end