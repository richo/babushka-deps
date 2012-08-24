dep 'elb tools installed' do
  met? { shell? "which elb-describe-lbs" }
  meet {
    on(:osx) {
      shell "brew install elb-tools"
      shell "brew link elb-tools"
    }
  }
end
dep 'iam tools installed' do
  met? { shell? "which iam-groupaddpolicy" }
  meet {
    on(:osx) {
      shell "brew install aws-iam-tools"
      shell "brew link aws-iam-tools"
    }
  }
end
