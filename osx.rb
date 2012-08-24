dep 'emoji fonts are gone' do
  met? { !File.exists?("/System/Library/Fonts/Apple Color Emoji.ttf") }
  meet { shell("rm '/System/Library/Fonts/Apple Color Emoji.ttf'", :sudo => true) }
end

dep '99designs dev' do
  requires 'elb tools installed',
           'iam tools installed'
end

