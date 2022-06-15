class Pathway < Inspec.resource(1)
    name 'pathway'

    def initialize(path)
        @path = path
    end

    def current_path
       @path
    end

    def current_contents
        inspec.command("cat #{@path}").stdout
    end

    def current_group
        inspec.command("stat -c '%G' #{@path}").stdout.strip
    end
end