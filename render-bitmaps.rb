#!/usr/bin/env ruby

require "rexml/document"
require "ftools"
include REXML
INKSCAPE = '/usr/bin/inkscape'
SRC = "./src"

def renderit(file)
  svg = Document.new(File.new("#{SRC}/#{file}", 'r'))
  svg.root.each_element("//g[contains(@inkscape:label,'plate')]") do |icon|
    context = icon.elements["text[@inkscape:label='context']/tspan"].text
    icon_name = icon.elements["text[@inkscape:label='icon-name']/tspan"].text
    puts "#{file}:#{icon.attributes['inkscape:label']}  #{context}/#{icon_name}"
    icon.each_element("rect") do |box|
      dir = "#{box.attributes['width']}x#{box.attributes['height']}/#{context}"
      cmd = "#{INKSCAPE} -i #{box.attributes['id']} -e #{dir}/#{file.gsub(/\.svg$/,'.png')} #{SRC}/#{file} > /dev/null 2>&1"
      File.makedirs(dir) unless File.exists?(dir)
      system(cmd)
      print "."
    end
    puts ''
  end
end

if (ARGV[0].nil?) #render all SVGs
  puts "Rendering from SVGs in #{SRC}"
  Dir.foreach(SRC) do |file|
    renderit(file) if file.match(/svg$/)
  end
  puts "\nrendered all SVGs"
else #only render the SVG passed
  file = "#{ARGV[0]}.svg"
  if (File.exists?("#{SRC}/#{file}"))
    renderit(file)
    puts "\nrendered #{file}"
  else
    puts "[E] No such file (#{file})"
  end
end
