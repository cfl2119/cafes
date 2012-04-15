desc "Finds the top three rated movies"

 task :find_top_3_movies do
    puts "starting to read in CSV"
    movies = Hash.new    
    
    require 'csv'
    CSV.read("gistfile1.txt").each do |row|
      row.each do |x|
        (temp1,temp2) = x.split(":")
        temp1 = Integer(temp1)
	if movies[temp2].nil?
	  movies[temp2]=0
	end
      	movies[temp2] = temp1+ movies[temp2]
      end
    end

    # puts movies

    sortedM = movies.sort_by { |title , totalRank| totalRank }
    
    puts sortedM[0][0]
    puts sortedM[1][0]
    puts sortedM[2][0]


    # require 'csv'

    # csv.open ...

    # puts "and the top 3 movies are ..."

  end