meta :update do
  template do
    setup { @calls = -1 }
    met? { (@calls += 1) > 0 }
  end
end
