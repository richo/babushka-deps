class ConfigFile
  include Babushka::ShellHelpers
  extend Babushka::ShellHelpers

  def initialize(args={})
    @args = args
  end

  def source
    @source ||= get_source
  end

  def get_source
    @args[:content] || @args[:src].p.read
  end

  def current?
    shell?("diff -qs /dev/stdin #{@args[:dest].p}", :input=>source, :sudo=>@args[:sudo])
  end

  def update
    shell("tee #{@args[:dest].p}", :input=>source, :sudo=>@args[:sudo])
  end
end
