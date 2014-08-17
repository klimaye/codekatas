def is_number?(str)
  str =~ /^[0-9]{1,}\*?$/ ? true : false
end

def are_numbers?(str_one, str_two)
  is_number?(str_one) && is_number?(str_two)
end

def number(str)
  str.sub(/\*/,'').to_i
end

def calc_spread(max_temp, min_temp)
  return 1000 unless are_numbers?(max_temp, min_temp)
  number(max_temp) - number(min_temp)
end

def split(line)
  line.strip.gsub(/\s+/,',').split(',')
end

def find_day_with_smallest_spread
  file = File.open('weather.dat')
  day_with_smallest_spread = 0
  min_spread = 100

  file.each do |line|
    day, max_t, min_t = split(line)
    puts " day = #{day},#{max_t},#{min_t}"
    spread = calc_spread(max_t, min_t)
    if spread < min_spread
      min_spread = spread
      day_with_smallest_spread = day
    end
  end

  puts "day #{day_with_smallest_spread} had the smallest spread with #{min_spread}"
end
