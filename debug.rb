dep "debug information for richo" do
  met? {
    @met
  }
  meet {
    $stderr.puts "== Environment =="
    ENV.each do |k, v|
     $stderr.puts "#{k}=#{v}"
    end

    $stderr.puts "== Methods on String =="
    $stderr.puts String.methods.sort
    @met = true
  }
end
