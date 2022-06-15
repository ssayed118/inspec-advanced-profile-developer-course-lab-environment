git_dir = "/workspaces/inspec-advanced-profile-developer-course-lab-environment/resources/git_test/.git"

# git resource
describe git(git_dir) do
  its('branches') { should include 'master' }
  its('branches') { should include 'testBranch' }
  its('current_branch') { should cmp 'master' }
  its('latest_commit') { should cmp 'edc207f'}
  its('previous_commit') { should cmp '8c30bff'}
end

# The following branches should exist
#describe command("git --git-dir #{git_dir} branch") do
#  its('stdout') { should match /master/ }
#end

#describe command("git --git-dir #{git_dir} branch") do
#  its('stdout') { should match /testBranch/ }
#end

# What is the current branch
#describe command("git --git-dir #{git_dir} branch") do
#  its('stdout') { should match /^\* master/ }
#end

# What is the latest commit
#describe command("git --git-dir #{git_dir} log -1 --pretty=format:'%h'") do
#  its('stdout') { should match 'edc207f' }
#end

# What is the second to last commit
#describe command("git --git-dir #{git_dir} log --skip=1 -1 --pretty=format:'%h'") do
#  its('stdout') { should match '8c30bff' }
#end