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

dep 'autoscaling tools installed' do
  met? { shell? "which as-create-auto-scaling-group" }
  meet {
    on(:osx) {
      shell "brew install auto-scaling"
      shell "brew link auto-scaling"
    }
  }
end

dep 'rds tools installed' do
  met? { shell? "which rds-describe-db-security-groups" }
  meet {
    on (:osx) {
      shell "brew install rds-command-line-tools"
      shell "brew link rds-command-line-tools"
    }
  }
end
