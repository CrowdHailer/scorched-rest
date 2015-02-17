

module Test
  Resource = lambda {|options| 

    Module.new do 
      @@options = options
      def index
        raise @@options[:message] 
      end

      def self.included(klass)
        puts klass
        klass.get
      end
  
    end }

end

class Controller
  

  def self.get
    puts 'get was called'
  end
  
 include Test::Resource.({message: "Wassssupp?"}) 

end

Controller.new.index


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
