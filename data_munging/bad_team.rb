require_relative 'common'

def index_hash
  indexes = ["Num","Team","P","W","L","D","F","-","A","Pts"]
  Hash[indexes.map.with_index.to_a]
end

def goals_differential(entries, indexer)
  goals_for = entries[indexer["F"]]
  goals_against = entries[indexer["A"]]
  abs_diff(goals_for.to_i, goals_against.to_i)
end

def abs_diff(a, b)
  (a - b).abs
end

def legit_line?(array)
  array.size == 10
end

def find_bad_team
  file = File.open('football.dat')
  team = 'NOT SET'
  min_difference = 100
  indexer = index_hash

  file.each do |line|
    array = split(line)
    next unless legit_line?(array)
    puts line
    differential = goals_differential(array, indexer)
    if differential < min_difference
      min_difference = differential
      team = array[indexer["Team"]]
    end
  end

  puts "Team with the smallest goal differential is #{team} with #{min_difference}"
  team
end
