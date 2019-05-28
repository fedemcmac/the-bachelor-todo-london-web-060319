require 'pry'

def get_first_name_of_season_winner(data, season) #return the first name of that season's winner
  full_name_array = []
  data[season].each do |contestants_array|
    if contestants_array["status"] == "Winner"
      full_name_array = contestants_array["name"].split(" ")   
      return full_name_array[0]
    end
  end  
end

def get_contestant_name(data, job) #returns the name of the woman who has that occupation

  data.each do |season, contestants_array|
    contestants_array.each do |contestants_hash|
      if contestants_hash["occupation"] == job
        return contestants_hash["name"]
      end  
    end
  end
end


def count_contestants_by_hometown(data, town) #return counter of number of women from that town
  counter = 0
  data.each do |season, contestants_array|
    contestants_array.each do |contestants_hash|
      if contestants_hash["hometown"] == town
        counter += 1
      end
    end
  end
  return counter
end

def get_occupation(data, town) # returns occupation of the first contestant from that hometown
  data.each do |season, contestants_array|
    contestants_array.each do |contestants_hash|
      if contestants_hash["hometown"] == town 
        return contestants_hash["occupation"]
      end
    end
  end
end

def get_average_age_for_season(data, season) #return the average age of the contestants for that season
  age_array = []
  data[season].each do |contestants_array|
    age_array << contestants_array["age"].to_f
  end
  return ((age_array.inject(:+))/age_array.length).round
end