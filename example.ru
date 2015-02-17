require 'scorched'
require_relative './lib/scorched/rest'


module Test
  def Resource(options)
    Module.new do
      def first
        puts 'hello'
      end
    end
  end
end

Platypus = Test::Resource(7)

class Cat
    include Platypus
end

Cat.new.first

class App < Scorched::Controller
  include Scorched::Rest

  get '/show-somethinf' do

  end
  # include Scorched::Rest
end

run App
