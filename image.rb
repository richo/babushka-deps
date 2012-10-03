dep 'Gimp.app' do
  source 'ftp://ftp.gimp.org/pub/gimp/v2.8/osx/gimp-2.8.2-dmg-2.dmg'
end

dep 'ImageOptim.app' do
  source 'http://imageoptim.com/ImageOptim.tbz2'
end

dep 'imagemagick.managed' do
  requires 'liblqr.managed'
end

dep 'liblqr.managed' do
  on :osx do
    # meet {
    # # XXX patch liblqr dep to do make; make install
    # }
  end
end
