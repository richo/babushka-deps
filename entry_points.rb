dep 'base system' do
  on(:osx) {
    requires 'richo osx environment',
             'Alfred.app',
             'Adium.app',
             '1Password.app',
             'iTerm.app',
             'Bowtie.app'
  }
end

dep 'richo osx environment' do
  requires 'emoji fonts are gone',
           'bitstream-vera.font',
           'ctags.managed'
end

dep 'minimal environment' do
  requires 'shell defaults to vi mode'
end
