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
      case v
      when Array
        Formater.array(v)
      when String
        Formater.string(v)
      when Char
        Formater.char(v)
      when Int
        Formater.integer(v)
      when Float
        Formater.float(v)
      when Symbol
        Formater.symbol(v)
      else
        v
      end
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
      String::Builder.build do |str|
        str << "["
        vars.each do |v|
          str << selector(v).to_s
          i += 1
          str << ", " if i < vars.size
          str << "\n " if i % MAX_ELEMENTS_PER_ROW == 0 && i < vars.size
        end
        str << "]"
      end
    end
  end
end
