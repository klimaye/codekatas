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
