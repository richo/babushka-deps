dep 'public homedir checked out' do
  setup { @repo = Babushka::GitRepo.new("~/.dotfiles".p) }
  met? { @repo.exists? }
  meet { @repo.clone!("git://github.com/richo/dotfiles.git") }
end

dep 'public homedir up to date' do
  requires 'public homedir checked out'
  Dir["~/.dotfiles".p / "*"].each do |file|
    requires 'dotfile up to date'.with("~/.dotfiles".p, file) if File.file?(file)
  end
end

dep 'dotfile up to date', :path, :file do
  setup {
    @config = ConfigFile.new(
      :src => File.join(path, file),
      :dest => File.expand_path("~/.#{file}")
    )
  }
  met? {
    @config.current?
  }
  meet {
    @config.update
  }
end

dep 'private homedir checked out', :url do
  requires 'subversion.managed'
  met? { File.exists?("~/.svn".p) }
  meet { shell("svn co #{url} ~/") }
end
