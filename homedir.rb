dep 'public homedir checked out' do
  setup { @repo = Babushka::GitRepo.new("~/.dotfiles".p) }
  met? { @repo.exists? }
  meet { @repo.clone!("git://github.com/richo/dotfiles.git") }
end

dep 'private homedir checked out', :url do
  requires 'subversion.managed'
  met? { File.exists?("~/.svn".p) }
  meet { shell("svn co #{url} ~/") }
end
