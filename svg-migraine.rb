#!/usr/bin/env ruby

require "rexml/document"
require "fileutils"
include REXML


INKSCAPE = 'flatpak run org.inkscape.Inkscape'
# INKSCAPE = '/usr/bin/inkscape'
PREFIX = "Adwaita/scalable"

# SVGO is a Node.js SVG optimization tool install with 'sudo npm install -g svgo'
# script will skip if SVGO is not present
SVGO = '/usr/bin/svgo'

if ARGV.empty?
  puts "Invoke with puts #{$PROGRAM_NAME} [PLATE.svg] [ICON_NAME]?"
  exit
end
SRC = ARGV[0]

def chopSVG(icon)
	FileUtils.mkdir_p(icon[:dir]) unless File.exists?(icon[:dir])
	unless (File.exists?(icon[:file]) && !icon[:forcerender])
		FileUtils.cp(SRC,icon[:file]) 
		puts " >> #{icon[:name]}"
		# extract the icon
		cmd = "#{INKSCAPE} -f #{icon[:file]} "
		cmd += "--select #{icon[:id]} --verb=FitCanvasToSelection --verb=EditInvertInAllLayers --verb=EditDelete " # delete everything but the icon
		cmd += "--verb=FileVacuum --verb=FileSave --verb=FileQuit > /dev/null 2>&1"
		system(cmd)
		# remove bounding rectangle
		svgcrop = Document.new(File.new(icon[:file], 'r'))
		svgcrop.root.each_element("//rect") do |rect| 
			w = ((rect.attributes["width"].to_f * 10).round / 10.0).to_i #get rid of 16 vs 15.99999 
			h = ((rect.attributes["width"].to_f * 10).round / 10.0).to_i #Inkscape bugs
			if w == 128 && h == 128
				rect.remove
			end
		end
		icon_f = File.new(icon[:file],'w+')
		icon_f.puts svgcrop
		icon_f.close
		# save as plain SVG
		cmd = "#{INKSCAPE} -f #{icon[:file]} -z --vacuum-defs --export-plain-svg=#{icon[:file]} > /dev/null 2>&1"
		system(cmd)
		# remove as many extraneous elements as possible with SVGO
		cmd = "#{SVGO} --pretty --disable=convertShapeToPath -i #{icon[:file]} -o  #{icon[:file]} > /dev/null 2>&1"
		system(cmd)
	else
		puts " -- #{icon[:name]} already exists"
	end
end #end of function

def get_output_filename(d,n)
	outfile = "#{d}/#{n}.svg"
	return outfile
end

#main
# Open SVG file.
svg = Document.new(File.new(SRC, 'r'))

if (ARGV[1].nil?) #render all SVGs
	puts "Rendering from icons in #{SRC}"
	# Go through every layer.
	svg.root.each_element("/svg/g[@inkscape:groupmode='layer']") do |context| 
		context_name = context.attributes.get_attribute("inkscape:label").value
		if context_name.end_with?("legacy")
			puts "Skipping layer '" + context_name + "'"
		else
			puts "Going through layer '" + context_name + "'"
			context.each_element("g") do |icon|
				#puts "DEBUG #{icon.attributes.get_attribute('id')}"
				dir = "#{PREFIX}/#{context_name}"
				icon_name = icon.elements["title"].text
                                    puts icon_name
				chopSVG({ :name => icon_name,
						:id => icon.attributes.get_attribute("id"),
						:dir => dir,
						:file => get_output_filename(dir, icon_name)})
			end
		end
	end
	puts "\nrendered all SVGs"
else #only render the icons passed
	icons = ARGV
	ARGV.each do |icon_name|
		icon = svg.root.elements["//g/title[text() = '#{icon_name}']"].parent
		dir = "#{PREFIX}/#{icon.parent.attributes['inkscape:label']}"
		#chopSVG({	:name => icon_name,
		#			:id => icon.attributes["id"],
		#			:dir => dir,
		#			:file => get_output_filename(dir, icon_name),
		#			:forcerender => true})
	end
	puts "\nrendered #{ARGV.length} icons"
end
