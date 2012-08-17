dep 'base system' do
  on(:osx) {
    requires 'richo osx environment'
  }
end

dep 'richo osx environment' do
  requires 'emoji fonts are gone',
           'bitstream-vera.font'
end

