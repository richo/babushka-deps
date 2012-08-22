dep 'Gimp.app' do
  requires 'XQuartz.app'
  source 'http://downloads.sourceforge.net/gimponosx/GIMP-2.8.0p1-Mountain-Lion.dmg'
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
