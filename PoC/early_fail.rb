dep "test early fail" do
  met? {
    shell "echo first; exit 1"
    shell "echo secondl exit 1"
  }
end
