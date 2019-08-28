def game_hash
  return {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {player_name: "Alan Anderson",
        number: 0,
        shoe: 16,
        points: 22,
        rebounds: 12,
        assists: 12,
        steals: 3,
        blocks: 1,
        slam_dunks: 1
        },
        {player_name: "Reggie Evans",
        number: 30,
        shoe: 14,
        points: 12,
        rebounds: 12,
        assists: 12,
        steals: 12,
        blocks: 12,
        slam_dunks: 7
        },
        {player_name: "Brook Lopez",
        number: 11,
        shoe: 17,
        points: 17,
        rebounds: 19,
        assists: 10,
        steals: 3,
        blocks: 1,
        slam_dunks: 15
        },
        {player_name: "Mason Plumlee",
        number: 1,
        shoe: 19,
        points: 26,
        rebounds: 11,
        assists: 6,
        steals: 3,
        blocks: 8,
        slam_dunks: 5
        },
        {player_name: "Jason Terry",
        number: 31,
        shoe: 15,
        points: 19,
        rebounds: 2,
        assists: 2,
        steals: 4,
        blocks: 11,
        slam_dunks: 1
        }]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {player_name: "Jeff Adrien",
        number: 4,
        shoe: 18,
        points: 10,
        rebounds: 1,
        assists: 1,
        steals: 2,
        blocks: 7,
        slam_dunks: 2
        },
        {player_name: "Bismack Biyombo",
        number: 0,
        shoe: 16,
        points: 12,
        rebounds: 4,
        assists: 7,
        steals: 22,
        blocks: 15,
        slam_dunks: 10
        },
        {player_name: "DeSagna Diop",
        number: 2,
        shoe: 14,
        points: 24,
        rebounds: 12,
        assists: 12,
        steals: 4,
        blocks: 5,
        slam_dunks: 5
        },
        {player_name: "Ben Gordon",
        number: 8,
        shoe: 15,
        points: 33,
        rebounds: 3,
        assists: 2,
        steals: 1,
        blocks: 1,
        slam_dunks: 0
        },
        {player_name: "Kemba Walker",
        number: 33,
        shoe: 15,
        points: 6,
        rebounds: 12,
        assists: 12,
        steals: 7,
        blocks: 5,
        slam_dunks: 12
        }]      
    }
  }
end

def num_points_scored (name)
  game_hash.each do |team_key, team_hash|
    team_hash[:players].length.times do |index|
      if team_hash[:players][index][:player_name] == name
        return team_hash[:players][index][:points]
      end
    end
  end
end

def shoe_size (name)
  game_hash.each do |team_key, team_hash|
    team_hash[:players].length.times do |index|
      if team_hash[:players][index][:player_name] == name
        return team_hash[:players][index][:shoe]
      end
    end
  end
end

def team_colors (name)
  game_hash.each do |team_key, team_hash|
    if team_hash[:team_name] == name
      return team_hash[:colors]
    end
  end
end

def team_names
  team_names_array =[]
  game_hash.each do |team_key, team_hash|
    team_names_array.push(team_hash[:team_name])
  end
  return team_names_array
end

def player_numbers (name)
  jerseys = []
  game_hash.each do |team_key, team_hash|
    if team_hash[:team_name] == name
      team_hash[:players].length.times do |index|
        jerseys.push(team_hash[:players][index][:number])
      end
    end
  end
  return jerseys
end

def player_stats (name)
  stats = {}
  game_hash.each do |team_key, team_hash|
      team_hash[:players].length.times do |index|
        if team_hash[:players][index][:player_name] == name
          stats = team_hash[:players][index]
          stats.delete(:player_name)
        end
      end
  end
  return stats
end

def big_shoe_rebounds
  shoe_size = 0
  rebounds = 0
  game_hash.each do |team_key, team_hash|
      team_hash[:players].length.times do |index|
        if team_hash[:players][index][:shoe] > shoe_size
          shoe_size = team_hash[:players][index][:shoe]
          rebounds = team_hash[:players][index][:rebounds]
        end
      end
  end
  return rebounds
end

def most_points_scored
  most_points = 0
  player = ""
  game_hash.each do |team_key, team_hash|
      team_hash[:players].length.times do |index|
        if team_hash[:players][index][:points] > most_points
          most_points = team_hash[:players][index][:points]
          player = team_hash[:players][index][:player_name]
        end
      end
  end
  return player
end

def winning_team
  team_scores = {}
  game_hash.each do |team_key, team_hash|
    combined_points = 0
    team_hash[:players].length.times do |index|
      combined_points += team_hash[:players][index][:points]
    end
    team_scores[team_hash[:team_name]] = combined_points
  end
  return team_scores.key(team_scores.values.max)
end

def player_with_longest_name
  letter_count = 0
  player_with_longest_name = ""
  game_hash.each do |team_key, team_hash|
    team_hash[:players].length.times do |index|
      player_name = team_hash[:players][index][:player_name]
      if player_name.length > letter_count 
        letter_count = player_name.length
        player_with_longest_name = team_hash[:players][index][:player_name]
      end
    end
  end
  return player_with_longest_name
end

def long_name_steals_a_ton?
  letter_count = 0
  steals = 0
  player_with_longest_name = ""
  player_with_most_steals = ""
  game_hash.each do |team_key, team_hash|
    team_hash[:players].length.times do |index|
      player_name = team_hash[:players][index][:player_name]
      if player_name.length > letter_count 
        letter_count = player_name.length
        player_with_longest_name = team_hash[:players][index][:player_name]
      end
      if team_hash[:players][index][:steals] > steals
        steals = team_hash[:players][index][:steals]
        player_with_most_steals = team_hash[:players][index][:player_name]
      end
    end
  end
  return player_with_longest_name == player_with_most_steals
end