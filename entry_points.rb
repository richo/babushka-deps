dep 'base system' do
  on(:osx) {
    requires 'richo osx environment',
             'benhoskings:Google Chrome.app',
             'benhoskings:Skype.app',
             'benhoskings:Firefox.app',
             'Alfred.app'
  }
end

dep 'richo osx environment' do
  requires 'emoji fonts are gone',
           'bitstream-vera.font'
end

