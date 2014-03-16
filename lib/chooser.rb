require "chooser/version"

module Chooser
  def choose(selector)
    ary = []
    if selector.is_a?(Hash)
      each do |ob|
        ary << ob if selector.all? do |m, v|
          ob.public_send(m) == v ||
          (v.respond_to?(:include?) && v.include?(ob.public_send(m))) ||
          (v.is_a?(Regexp) && v =~ ob.public_send(m))
        end
      end
    elsif selector.is_a?(String)
      each do |ob|
        ary << ob if !!ob.instance_eval(selector)
      end
    else
      raise ArgumentError, 'Supply an options hash (e.g. target.choose :street => "Main", :age => [24..30]) or evaluated string (e.g. target.choose "address =~ /Main/").'
    end
    ary
  end
end

class Array
  include Chooser
end
