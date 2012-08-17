dep "MacVim.app" do
  requires 'macvim.managed'
  met? {
    begin
      fh = File.new("/Applications/MacVim.app")
      (fh.stat.mode & 040000) > 0
    rescue Errno::ENOENT
      false
    end
  }
  meet {
    sudo("mv /usr/local/Cellar/macvim/7.3-64/MacVim.app /Applications")
  }
end

dep "macvim.managed" do
  provides []
  installs "macvim"
end

