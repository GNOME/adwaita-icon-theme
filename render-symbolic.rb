#!/usr/bin/env ruby

require "rexml/document"
require "fileutils"
include REXML


RENDERER = 'rsvg-convert'
#INKSCAPE = '/usr/bin/inkscape' # like this works for me, while using `which` inkscape hangs
SRC = "src/symbolic/gnome-stencils.svg"
PREFIX = "Adwaita/scalable-rsvg"

def chopSVG(icon)
	FileUtils.mkdir_p(icon[:dir]) unless File.exists?(icon[:dir])
	unless (File.exists?(icon[:file]) && !icon[:forcerender])
		cmd = "#{RENDERER} -f svg #{SRC} -i #{icon[:id]} -o #{icon[:file]}"
		puts cmd
		system(cmd)
		
#   remove rectangle
#		svgcrop = Document.new(File.new(icon[:file], 'r'))
#		svgcrop.root.each_element("//rect") do |rect| 
#			w = ((rect.attributes["width"].to_f * 10).round / 10.0).to_i #get rid of 16 vs 15.99999 
#			h = ((rect.attributes["width"].to_f * 10).round / 10.0).to_i #Inkscape bugs
#			if w == 16 && h == 16
#				rect.remove
#			end
#		end
#    icon_f = File.new(icon[:file],'w+')
#    icon_f.puts svgcrop
#    icon_f.close
	else
		puts " -- #{icon[:name]} already exists"
	end
end #end of function

def get_output_filename(d,n)
	if (/rtl$/.match(n))
	  outfile = "#{d}/#{n.chomp('-rtl')}-symbolic-rtl.svg"
	else
	  outfile = "#{d}/#{n}-symbolic.svg"	  
  end
  return outfile
end

#main
# Open SVG file.
svg = Document.new(File.new(SRC, 'r'))

if (ARGV[0].nil?) #render all SVGs
  puts "Rendering from icons in #{SRC}"
	# Go through every layer.
	svg.root.each_element("/svg/g[@inkscape:groupmode='layer']") do |context| 
		context_name = context.attributes.get_attribute("inkscape:label").value  
		puts "Going through layer '" + context_name + "'"
		context.each_element("g") do |icon|
			#puts "DEBUG #{icon.attributes.get_attribute('id')}"
			dir = "#{PREFIX}/#{context_name}"
			icon_name = icon.attributes.get_attribute("inkscape:label").value
			chopSVG({	:name => icon_name,
			 					:id => icon.attributes.get_attribute("id"),
			 					:dir => dir,
			 					:file => get_output_filename(dir, icon_name)})
		end
	end
  puts "\nrendered all SVGs"
else #only render the icons passed
  icons = ARGV
  ARGV.each do |icon_name|
  	icon = svg.root.elements["//g[@inkscape:label='#{icon_name}']"]
  	dir = "#{PREFIX}/#{icon.parent.attributes['inkscape:label']}"
		chopSVG({	:name => icon_name,
		 					:id => icon.attributes["id"],
		 					:dir => dir,
		 					:file => get_output_filename(dir, icon_name),
		 					:forcerender => true})
	end
  puts "\nrendered #{ARGV.length} icons"
end
