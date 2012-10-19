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

dep "vim springboards from .profile" do
  requires "MacVim.app"
  macvim_binary = "/Applications/MacVim.app/Contents/MacOS/MacVim"
  # MacVim starts as a child of the login session and misses a bunch of
  # important stuff.
  # Install a shell script that loads my profile, then macvim
  def is_shell_script?(path)
    File.open(path) do |f|
      f.read(9) == "#!/bin/sh"
    end
  end
  def is_executable?(path)
    (File.stat(path).mode & 0111) > 0
  end

  met? {
    [
      is_shell_script?(macvim_binary),
      is_executable?(macvim_binary)
    ].all?
  }
  meet {
    File.rename(macvim_binary, "#{macvim_binary}.real") unless is_shell_script?("#{macvim_binary}.real")
    File.open(macvim_binary, "w") do |f|
      f.write <<-EOS
#!/bin/sh
source ~/.profile
exec #{macvim_binary}.real
EOS
      f.chmod(0755)
    end
  }
end

dep "vim environment" do
  on(:osx) do
    requires "MacVim.app",
             "vim springboards from .profile"
  end
  on(:ubuntu) do
    requires "vim-full.managed"
  end
end
