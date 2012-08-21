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
