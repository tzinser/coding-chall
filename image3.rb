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
    
    def pixel_transform
        locate_pos = Array.new
        #Identify the x and y coordinates of array with a value of 1
        @data.each_with_index do |row, rowIndex|
            row.each_with_index do |value, colIndex|
                if value == 1 
                    locate_pos << [colIndex,rowIndex]
                end                    
            end
        end
        return locate_pos
    end
    
    def blur(distance)
        puts "\nConverted image:" #for usability making the output easier to understand.
        ones = pixel_transform
        @data.each_with_index do |row, rowIndex|
        row.each_with_index do |value, colIndex|
             ones.each do |x,y|
                manhattan_distance = (x - colIndex ).abs + (y - rowIndex).abs 
                if manhattan_distance <= distance
                    @data[rowIndex][colIndex] = 1
                end
             end
         end
        end

    end
end

#Create an Image object initialized with integer array values.
image = Image.new([[0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0],[0,0,0,1,0,0,0,0,0],[0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,1]])

#image = Image.new([[0,0,0,0],[0, 1, 0, 0],[0, 0, 0, 1],[0, 0, 0, 1]])
#Call output method to display image values to the screen
image.output_image
image.blur(3)
image.output_image