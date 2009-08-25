#!/usr/bin/env ruby
require "fileutils"

if (ARGV[0].nil?) #render all SVGs
  puts "Usage: #{$0} [icon theme directory]"
  exit
end

THEME_NAME=ARGV[0]
THEME_COMMENT="#{THEME_NAME} Icon Theme"
OUTPUT="#{Dir.pwd}/output/#{THEME_NAME}"

FileUtils.rm_rf OUTPUT
FileUtils.mkdir_p OUTPUT

puts "Creating icon theme in #{OUTPUT}"
puts "Copying build files.."
FileUtils.cp_r Dir.glob("build/*"), OUTPUT
