class Git < Inspec.resource(1)
    name 'git'

    def initialize(path)
        @path = path
    end

    def branches
        inspec.command("git --git-dir #{@path} branch").stdout
    end

    def current_branch
        branch_name = inspec.command("git --git-dir #{@path} branch").stdout.strip.split("\n").find do |name|
            name.start_with?('*')
        end
        branch_name.gsub(/^\*/, '').strip
    end

    def latest_commit
        inspec.command("git --git-dir #{@path}  log -1 --pretty=format:'%h'").stdout
    end

    def previous_commit
        inspec.command("git --git-dir #{@path} log --skip=1 -1 --pretty=format:'%h'").stdout
    end

end
