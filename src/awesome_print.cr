require "./awesome_print/*"

def self.ap(v)
  if v.is_a? Array
    return Formater.array_formater(v)
  end
  puts v.inspect
end

class Formater

  MAX_ELEMENTS_PER_ROW = 7

  def self.array_formater(vars)
    i = 0
    s = "["
    vars.each { |v|
      s = s + v.to_s
      i = i + 1
      if i < vars.size
        s = s + ", "
      end
      if i % MAX_ELEMENTS_PER_ROW == 0 && i < vars.size 
        s += "\n"
      end
    }
    s += "]"
    puts s
    s
  end
end
