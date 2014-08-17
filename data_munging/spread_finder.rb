require_relative 'common'

def calc_temp_spread(array)
  max_temp = array[1]
  min_temp = array[2]
  return 1000 unless are_numbers?(max_temp, min_temp)
  number(max_temp) - number(min_temp)
end


def line_item_legit?(array)
  array[0..2].reject { |i| i =~ /^\d+$/ }.empty?
end

def find_day_with_smallest_spread_redux
  file = File.open('weather.dat')
  indexer = {}
  find_item = Proc.new do |arr, idx|
    arr[0]
  end
  legit_func = lambda { |array| line_item_legit?(array) }
  diff_func = lambda { |arr, idx| calc_temp_spread(arr) }
  result = find_matching_case(file, indexer, find_item, legit_func, diff_func)
  puts result
  result
end

find_day_with_smallest_spread_redux
