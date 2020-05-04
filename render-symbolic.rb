#!/usr/bin/env ruby

require "rexml/document"
require "fileutils"
include REXML


INKSCAPE = 'flatpak run org.inkscape.Inkscape'
# INKSCAPE = '/usr/bin/inkscape'
SRC = "src/symbolic/gnome-stencils.svg"
PREFIX = "Adwaita/scalable"
PREFIX32 = "Adwaita/scalable-up-to-32" # dirty but it allows rendering those up-to icons

# SVGO is a Node.js SVG optimization tool install with 'sudo npm install -g svgo'
# script will skip if SVGO is not present
SVGO = '/usr/bin/svgo'
# SVGO = '/usr/local/bin/svgo' # it gets put here on some distros

def chopSVG(icon)
	FileUtils.mkdir_p(icon[:dir]) unless File.exists?(icon[:dir])
	unless (File.exists?(icon[:file]) && !icon[:forcerender])
		FileUtils.cp(SRC,icon[:file]) 
		puts " >> #{icon[:name]}"
		# extract the icon
		cmd = "#{INKSCAPE} -g #{icon[:file]} --select #{icon[:id]} --verb=\"FitCanvasToSelection;EditInvertInAllLayers"
		cmd += ";EditDelete;EditSelectAll;SelectionUnGroup;SelectionUnGroup;SelectionUnGroup;StrokeToPath;FileVacuum"
		cmd += ";FileSave;FileQuit;\"" 
		system(cmd)
		# remove bounding rectangle
		#bounding rectangle is now a path. needs to be removed
		svgcrop = Document.new(File.new(icon[:file], 'r'))
		svgcrop.root.each_element("//path") do |path|
	    puts(path.attributes['style'])
	    if path.attributes['style'].include? 'fill:none;'
		    puts "DEBUG: found rect to remove #{path}"
		    path.remove
	    end
    end
		icon_f = File.new(icon[:file],'w+')
		icon_f.puts svgcrop
		icon_f.close
		# remove as many extraneous elements as possible with SVGO
		cmd = "#{SVGO} --pretty --disable=convertShapeToPath --disable=convertPathData --enable=removeStyleElement -i #{icon[:file]} -o  #{icon[:file]} > /dev/null 2>&1"
		system(cmd)
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
			# prevent rendering of icons ending in :
			if icon_name.end_with?("-alt", "-old", "-template", "-source", "-ltr", "-working")
				puts " ++ skipping icon '" + icon_name + "'"
			elsif icon_name =~ /\d$/
				puts " ++ skipping icon '" + icon_name + "'"
			else
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
		icon = svg.root.elements["//g[@inkscape:label='#{icon_name}']"]
		if icon_name == "process-working"
			dir = "#{PREFIX32}/#{icon.parent.attributes['inkscape:label']}"
		else
			dir = "#{PREFIX}/#{icon.parent.attributes['inkscape:label']}"
		end
		chopSVG({	:name => icon_name,
					:id => icon.attributes["id"],
					:dir => dir,
					:file => get_output_filename(dir, icon_name),
					:forcerender => true})
	end
	puts "\nrendered #{ARGV.length} icons"
end
