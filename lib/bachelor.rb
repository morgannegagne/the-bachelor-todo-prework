
def get_first_name_of_season_winner(data, season)
  data[season].each do |contestant|
    return contestant.fetch("name").split(" ")[0] if contestant["status"] == "Winner"
  end
end

def get_contestant_name(data, occupation)
  data.each do |season, contestant_array|
    contestant_array.each do |contestant|
      return contestant.fetch("name") if contestant["occupation"] == occupation
    end
  end
end

def count_contestants_by_hometown(data, hometown)
  counter = 0

  data.each do |season, contestant_array|
    contestant_array.each do |contestant|
      counter += 1 if contestant["hometown"] == hometown
    end
  end

  counter
end

def get_occupation(data, hometown)
  data.each do |season, contestant_array|
    contestant_array.each do |contestant|
      return contestant.fetch("occupation") if contestant["hometown"] == hometown
    end
  end
end

def get_average_age_for_season(data, season)
  num_contestants = 0
  total_age = 0
  data[season].each do |contestant|
    num_contestants += 1
    total_age += contestant["age"].to_f
  end

  (total_age / num_contestants).round
end
