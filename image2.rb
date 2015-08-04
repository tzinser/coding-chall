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
    
    def blur
        puts "\n"
        pixel_transform = Array.new
        #Identify the x and y coordinates of array with a value of 1
        @data.each_with_index do |row, rowIndex|
            row.each_with_index do |value, colIndex|
                if value == 1 
                    pixel_transform << [rowIndex, colIndex]
                  
                end                    
            end
        end
        #Using coordinates identified, modify corresponding coordinates to value of 1
        pixel_transform.each_with_index do |row, rowIndex|
            x = row[0]
            y = row[1]
            print x, y
            if @data[x - 1][y] != nil
                @data[x - 1][y] = 1
            end
            if @data[x + 1][y] != nil
                @data[x + 1][y] = 1
            end
            if @data[x][y - 1] != nil
                @data[x][y - 1] = 1
            end
            if @data[x][y + 1] != nil
                @data[x][y + 1] = 1
            end
        end
    end
end

#Create an Image object initialized with integer array values.
image = Image.new([[0,0,0,0],[0, 1, 0, 0],[0, 0, 0, 1],[0, 0, 0, 0]])
#Call output method to display image values to the screen
image.output_image
image.blur
image.output_image