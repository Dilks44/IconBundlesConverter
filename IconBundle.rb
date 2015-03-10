# read in path name as arg.
#Create new Folder "IconBundles" and move result to it.

# File.directory?(file_name) -> bool
#returns true if the named file is a directory

# File.reaname(old_name, new_name) -> 0
# renames the given file to the new name

# Dir.pwd
#Prints the current directory


# get the file extension possibily with regular expressions

#FileUtils.cp
#FileUtils.mv

require 'FileUtils'

$Desktop = "/Users/Andrew/Desktop/"

def doWork(directory)
	puts "%% Starting doWork method %%"
	newDirectory = directory + "Bundles"
	array = Dir.entries("#{newDirectory}/")
	puts "DIR: #{newDirectory}"
	puts "%% Starting .each call %%"
	array.delete(".")
	array.delete("..")
	array.delete(".DS_Store")
	array.each { |dir|
		# Use dir to rename the files
		#puts "%% Dir: #{dir}"
		if (File.directory?("#{newDirectory}/#{dir}"))
			files = Dir.entries("#{newDirectory}/#{dir}")
			files.delete(".")
			files.delete("..")

			#Find largest to copy
			# will work on largest later

			x = 0
			largestFile = files[x]
			while (File.file?("#{newDirectory}/#{dir}/#{largestFile}") == false)
				x += 1
				largestFile = files[x]
			end

			# files.each { |k|
			# 	puts File.size?("#{newDirectory}/#{dir}/k")
			# 	puts "%%  File: #{k} Size: #{File.size?('k')}"
			# 	if (File.size?(k) > File.size?(largestFile))
			# 		largestFile = k
			# 	end
			# }
			#duplicate largest file here and then move'em

		# Add support for other file extensions

			# largestFile ~= /.(\d)?/
			# extension = $1


			FileUtils.cp("#{newDirectory}/#{dir}/#{largestFile}",
				"#{newDirectory}/#{dir}/#{dir}.png")

			FileUtils.cp("#{newDirectory}/#{dir}/#{largestFile}",
				"#{newDirectory}/#{dir}/#{dir}@2x.png")

			FileUtils.cp("#{newDirectory}/#{dir}/#{largestFile}",
				"#{newDirectory}/#{dir}/#{dir}@3x.png")

			FileUtils.cp("#{newDirectory}/#{dir}/#{largestFile}",
				"#{newDirectory}/#{dir}/#{dir}@2x~ipad.png")

			FileUtils.cp("#{newDirectory}/#{dir}/#{largestFile}",
				"#{newDirectory}/#{dir}/#{dir}~ipad.png")


			if (File.directory?("#{directory}/IconBundles") == false)
				Dir.mkdir("#{directory}/IconBundles")
				puts "%% Created IconBundles folder%%"
			end


			FileUtils.mv("#{newDirectory}/#{dir}/#{dir}.png",
				"#{directory}/IconBundles/")

			FileUtils.mv("#{newDirectory}/#{dir}/#{dir}@2x.png",
				"#{directory}/IconBundles/")

			FileUtils.mv("#{newDirectory}/#{dir}/#{dir}@3x.png",
				"#{directory}/IconBundles/")

			FileUtils.mv("#{newDirectory}/#{dir}/#{dir}~ipad.png",
				"#{directory}/IconBundles/")

			FileUtils.mv("#{newDirectory}/#{dir}/#{dir}@2x~ipad.png",
				"#{directory}/IconBundles/")
			

		else
			puts "ERROR: #{dir} is not a directory"
		end
	}

end








def main
	if ARGV.length != 1
		puts "Usage: ruby IconBundle.rb <pathname>"
		exit(1)
	end

	if (File.directory?(ARGV[0]) == false)
		puts "Thats not a working directory try again"
		exit(1)
	elsif (File.directory?("#{ARGV[0]}/Bundles") == false)
		puts "This directory doesnt seem to have a Bundles Folder"
	else
		
		doWork(ARGV[0])
		puts
		puts "Opperation complete!"
		puts
	end

	exit(0)
end


main







