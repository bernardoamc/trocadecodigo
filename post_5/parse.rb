File.open('output.csv', 'w') do |out_file|
  File.open('test.csv', 'r').each do |line|
    out_file.print line.sub(/((\d+,){3})17/, '\125')
  end
end
