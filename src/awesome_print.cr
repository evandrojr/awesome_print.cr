require "./awesome_print/*"
require "colorize"

def self.ap(v)
  r = ::Formater.selector(v)
  puts r
  r
end

module AwesomePrint
  module Formater
    extend self
    class_property coloring : Bool = true

    COLORS = %i(black red green)

    MAX_ELEMENTS_PER_ROW = 7

    def selector(v)
      case v
      when Array
        array(v)
      when String
        string(v)
      when Char
        char(v)
      when Int
        integer(v)
      when Float
        float(v)
      when Symbol
        symbol(v)
      else
        v
      end
    end

    def integer(v)
      if coloring
        return v.colorize(:magenta)
      end
      v
    end

    def float(v)
      if coloring
        return v.colorize(:red)
      end
      v
    end

    def string(v)
      if coloring
        return "\"#{v}\"".colorize(:green)
      end
      "\"#{v}\""
    end

    def char(v)
      if coloring
        return "'#{v}'".colorize(:yellow)
      end
      "'#{v}'"
    end

    def symbol(v)
      if coloring
        return ":#{v}".colorize(:blue)
      end
      ":#{v}"
    end

    def array(vars)
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
