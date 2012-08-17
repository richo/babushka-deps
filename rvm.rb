dep 'rvm' do
  met? { File.exists?("~/.rvm".p) }
  meet { shell "curl -L https://get.rvm.io | bash -s stable" }
end
