class Image
	#initialize Image class with parameters 
	def initialize(data)
		@data = data
	end

	#If the data variable is not empty, loop through each row outputting
	#the values of the array on separate lines
	def output_image
		if !(@data.empty?)
			@data.each do |row| 
				puts row.join(' ')
			end
		else
			puts "No values supplied."
		end
	end
end

#Create an Image object initialized with integer array values.
image = Image.new([[0,0,0,0],[0, 1, 0, 0],[0, 0, 0, 1],[0, 0, 0, 0]])
#Call output method to display image values to the screen
image.output_image
