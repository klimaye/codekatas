def is_number?(str)
  str =~ /^[0-9]{1,}\*?$/ ? true : false
end

def are_numbers?(str_one, str_two)
  is_number?(str_one) && is_number?(str_two)
end

def number(str)
  str.sub(/\*/,'').to_i
end

def split(line)
  line.strip.gsub(/\s+/,',').split(',')
end

def abs_diff(a, b)
  (a - b).abs
end

def find_matching_case(file, indexer, find_item, legit_func, differential_func)
  min_differential = 100000
  item  = 'NOT FOUND'
  file.each do |line|
    array = split(line)
    next unless legit_func.call(array)
    differential = differential_func.call(array,indexer)
    if differential < min_differential
      min_differential = differential
      item = find_item.call(array, indexer)
    end
  end
  { item: item, differential: min_differential }
end

