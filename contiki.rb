require 'digest/md5'
DCG_TOOLCHAIN_FILENAME = "gcc-arm-none-eabi-4_7-2013q1-20130313-mac.tar.bz2"

dep 'dcg development environment' do
  requires 'avrdude.managed',
           'mcmote toolchain'
end

dep 'mcmote toolchain' do
  requires 'mcmote toolchain archive'
  met? {
    File.exists? "/usr/local/arm-none-eabi/bin/arm-none-eabi-gcc"
  }
  meet {
    Dir.mkdir "/usr/local/arm-none-eabi"
    shell("tar -xjf /tmp/#{DCG_TOOLCHAIN_FILENAME} -C /usr/local/arm-none-eabi --strip 1")
  }
end

dep 'mcmote toolchain archive' do
  setup {
    @digest = Digest::MD5.new
  }

  def get_digest
    File.open("/tmp/#{DCG_TOOLCHAIN_FILENAME}", 'r').each_line do |line|
      @digest << line
    end
    return @digest.hexdigest
  end

  met? {
    File.exists?("/tmp/#{DCG_TOOLCHAIN_FILENAME}") &&
    get_digest == "017aebb1e47dd772bd535741c68df5de"
  }

  meet {
    shell("curl -L https://launchpad.net/gcc-arm-embedded/4.7/4.7-2013-q1-update/+download/#{DCG_TOOLCHAIN_FILENAME} -o /tmp/#{DCG_TOOLCHAIN_FILENAME}")
  }
end

dep 'avrdude.managed'
