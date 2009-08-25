#!/usr/bin/env ruby
require "fileutils"
require "find"

if (ARGV[0].nil?) #render all SVGs
  puts "Usage: #{$0} [icon theme directory]"
  exit
end

THEME_NAME=ARGV[0]
THEME_COMMENT="#{THEME_NAME} Icon Theme"
CWD=Dir.pwd
OUTPUT="#{CWD}/output/#{THEME_NAME}"

FileUtils.rm_rf OUTPUT
FileUtils.mkdir_p OUTPUT

puts "Creating icon theme in #{OUTPUT}"
puts "Copying build files.."
FileUtils.cp_r Dir.glob("build/*"), OUTPUT

#echo -e "[Icon Theme]\nName=$THEME_NAME\nComment=$THEME_COMMENT\n" > index.theme

meta = File.new("#{OUTPUT}/index.theme.in","w+")
meta.puts "[Icon Theme]\n_Name=#{THEME_NAME}\n_Comment=#{THEME_COMMENT}"
meta.puts "Inherits=Tango,Oxygen"
meta.print "Directories="
#Dir.open(THEME_NAME).each do |path|

Dir.chdir(THEME_NAME)
Find.find(".") do |path|
  if (File.directory?(path))
    dir = path.gsub(/^\.\//,'')
    meta.print "#{dir}," unless !dir.match('/')
  end
end

meta.close
