require "./awesome_print/*"
require "colorize"


def self.ap(v)
  r = ::Formater.selector(v)
  puts r
  r
end

module AwesomePrint
  class Formater
  
    class_property coloring : Bool = true
    
    COLORS = %i(black red green)
  
  
    MAX_ELEMENTS_PER_ROW = 7
  
    def self.selector(v)
      if v.is_a? Array
        r = Formater.array(v)
      elsif v.is_a? String
        r = Formater.string(v)
      elsif v.is_a? Char
        r = Formater.char(v)
      elsif v.is_a? Int
        r = Formater.integer(v)
      elsif v.is_a? Float
        r = Formater.float(v)
      elsif v.is_a? Symbol
        r = Formater.symbol(v)
      else
        r = v
      end
      return r
    end

    def self.integer(v)
      if coloring
        return v.colorize(:magenta)
      else
        return v
      end
    end

    def self.float(v)
      if coloring
        return v.colorize(:red)
      else
        return v
      end
    end
  
    def self.string(v)
      if coloring
        return "\"#{v}\"".colorize(:green)
      else
        return "\"#{v}\""
      end  
    end
  
    def self.char(v)
      if coloring
        return "'#{v}'".colorize(:yellow)
      else
        return "'#{v}'"
      end    
    end
  
    def self.symbol(v)
      if coloring
        return ":#{v}".colorize(:blue)
      else
        return ":#{v}"
      end   
    end
  
  
    def self.array(vars)
      i = 0
      s = "["
      vars.each { |v|
        s = s + selector(v).to_s
        i = i + 1
        if i < vars.size
          s = s + ", "
        end
        if i % MAX_ELEMENTS_PER_ROW == 0 && i < vars.size
          s += "\n "
        end
      }
      s += "]"
      return s
    end
  end
  
  
end

