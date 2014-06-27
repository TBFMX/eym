class DataFile < ActiveRecord::Base
	#sobre-escribimos el save para guardar el file
	def self.save(upload)
	    name =  upload.original_filename
	    directory = "public/data" 
	    dir ="/data"
	    # create the file path
	    path = File.join(directory, name)
	    path2 = File.join(dir, name)
	    # write the file
	    File.open(path, "wb") { |f| f.write(upload.read) }
	    return path2
	end

	def self.destroy(url)
		url_dir = "public/" + url.to_s
		File.delete(url_dir) if File.exist?(url_dir)
		return true
	end	
end
