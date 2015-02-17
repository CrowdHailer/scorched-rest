# module Test
#   def Resource(options)
#
#   end
# end

Platypus = Module.new do
  def first
    puts 'hello'
  end

  def self.second
    puts 'goodbye'
  end
end

class Cat
    include Platypus
end

Platypus.second

Cat.new.first
