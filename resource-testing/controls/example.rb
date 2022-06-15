describe pathway("inspec.yml") do
  its('current_group') { should match "codespace" }
  its('current_contents') { should_not be_nil}
end

directory = '/workspaces/inspec-advanced-profile-developer-course-lab-environment/resource-testing'

describe pathway(directory) do
  its('current_path') { should cmp directory }
end