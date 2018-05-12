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

    MAX_ELEMENTS_PER_ROW = 7

    # macro create_painters(varible, rules)
    #   def {{variable(varible, rules)}}
    #     {{puts variable}}
    #     {{puts rules}}
    #   end
    # end

    
    class_property rules = {
      String: {format: "\"\#{v}\"", color: :green}, 
      Float: {format: "\#{v}", color: :red},
    }

    # macro define_method(name, variable, rules)
    #   def {{name(variable, rules)}}
    #     {{puts variable}}  
    #     {{puts rules[:format]}}
    #   end
    # end
    
    

    def selector(v)

      case v
      when Array
        array(v)
      when String
        define_method("string", v, rules[:String] )
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
      return v.colorize(:magenta) if coloring
      v
    end

    def float(v)
      return v.colorize(:red) if coloring
      v
    end

    # def string(v)
    #   return "\"#{v}\"".colorize(:green) if coloring
    #   "\"#{v}\""
    # end

    def char(v)
      return "'#{v}'".colorize(:yellow) if coloring
      "'#{v}'"
    end

    def symbol(v)
      return ":#{v}".colorize(:blue) if coloring
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
