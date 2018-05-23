require "./awesome_print/*"
require "colorize"

def self.ap(v)
  r = AwesomePrint::Formater.selector(v)
  puts r
  r
end

module AwesomePrint
  module Formater
    extend self
    class_property coloring : Bool = true
    MAX_ELEMENTS_PER_ROW = 7

    def generic_formater(data_type : Symbol, v)
      rules = {
        String: {format: ->{ "\"#{v}\"" }, color: :green},
        Int:    {format: ->{ v }, color: :magenta},
        Float:  {format: ->{ v }, color: :red},
        Char:   {format: ->{ "'#{v}'" }, color: :yellow},
        Symbol: {format: ->{ ":#{v}" }, color: :blue},
      }
      if (coloring)
        (rules[data_type][:format].call).colorize.fore(rules[data_type][:color])
      else
        rules[data_type][:format].call
      end
    end

    def selector(v)
      case v
      when Array
        array(v)
      when String
        generic_formater(:String, v)
      when Char
        generic_formater(:Char, v)
      when Int
        generic_formater(:Int, v)
      when Float
        generic_formater(:Float, v)
      when Symbol
        generic_formater(:Symbol, v)
      else
        v
      end
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
