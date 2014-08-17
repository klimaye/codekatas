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

def legit_line?(array)
  array.size == 10
end

def find_bad_team_redux
  file = File.open('football.dat')
  indexer = index_hash
  find_item = Proc.new do |arr, idx|
    arr[idx["Team"]]
  end
  legit_func = lambda { |array| legit_line?(array) }
  diff_func = lambda { |arr, idx| goals_differential(arr, idx) }
  result = find_matching_case(file, indexer, find_item, legit_func, diff_func)
  puts result
  result
end

