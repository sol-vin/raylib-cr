require "file_utils"

FileUtils.cd("examples") do
  puts "BUILDING EXAMPLE FROM #{FileUtils.pwd}"
  begin
    FileUtils.rm_r("_build")
  rescue
  end
  FileUtils.mkdir_p("_build/rsrc")
  Dir.entries(FileUtils.pwd).each do |name|
    path = Path[name]
    next if path.basename =~ /^\.{1,2}$/ || path.basename =~ /^_build$/

    puts "BUILDING EXAMPLE #{path.basename}"

    FileUtils.cd(path) do
      `shards install`
      `crystal build --release -s -p -t -o ../_build/#{path.basename} ./src/#{path.basename}.cr`
      unless File.exists?("../_build/#{name}.exe")
        puts "Could not find #{Dir.pwd}/_build/#{name}.exe"
        exit(1)
      end 
      FileUtils.rm("../_build/#{name}.pdb")
      begin
        FileUtils.cp_r("./rsrc", "../_build/rsrc")
      rescue
      end
    end
  end
end
