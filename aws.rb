dep 'elb tools installed' do
  met? { shell? "which elb-describe-lbs" }
  meet {
    on(:osx) {
      shell "brew install elb-tools"
      shell "brew link elb-tools"
    }
  }
end
