require "net/http"
require "json"
require "digest"

version = ARGV[0]
if version.nil?
  abort "Usage: release.rb [x.y.z]"
else
  version = version.gsub(/[a-z-]*/i, "")
end

puts "Releasing mcpx on Homebrew: v#{version}"

url = "https://api.github.com/repos/cs50victor/mcpx/releases/tags/v#{version}"
response = Net::HTTP.get_response(URI(url))
unless response.is_a?(Net::HTTPSuccess)
  abort "Did not find release: v#{version} [status: #{response.code}]"
end

release = JSON.parse(response.body)
puts "Found release: #{release["name"]}"

assets = {}
for asset in release["assets"]
  filename = asset["name"]
  next if filename == "checksums.txt"

  url = asset["browser_download_url"]
  begin
    response = Net::HTTP.get_response(URI(url))
    url = response["location"]
  end while response.is_a?(Net::HTTPRedirection)

  unless response.is_a?(Net::HTTPSuccess)
    abort "Did not find asset: #{filename} [status: #{response.code}]"
  end

  sha256 = Digest::SHA256.hexdigest(response.body)
  puts "Found asset: #{filename} [sha256: #{sha256}]"

  assets[filename] = sha256
end

formula = ""
File.open("Formula/mcpx.rb", "r") do |file|
  file.each_line do |line|
    query = line.strip

    new_line = if query.start_with?("version")
      line.gsub(/"[0-9\.]{1,}"/, "\"#{version}\"")
    elsif query.start_with?("sha256")
      asset = query[(query.index("#") + 2)..-1].strip
      sha256 = assets[asset]
      if sha256.nil?
        puts "Warning: Did not find sha256 for #{asset}, keeping existing"
        line
      else
        line.gsub(/"[A-Fa-f0-9]{64}"/, "\"#{sha256}\"")
      end
    else
      line
    end

    formula += new_line
  end
end

File.write("Formula/mcpx.rb", formula)
puts "Saved Formula/mcpx.rb"

readme = File.read("README.md")
new_readme = readme.gsub(/v[0-9]+\.[0-9]+\.[0-9]+/, "v#{version}")
File.write("README.md", new_readme)
puts "Saved README.md"

puts "Done"
