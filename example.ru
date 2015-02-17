require 'scorched'
require_relative './lib/scorched/rest'


module Rest

  def self.Resource(options)
    Module.new do
      @@pattern = options[:pattern]
      def self.included(klass)

        klass.get('/') { send :index }
        klass.get('/new') { send :new }

        klass.get(@@pattern) { |id| send :show, id}

      end
      def index
        raise 'index missing'
      end

      def new
        raise 'new missing'
      end

      def show(id)
        raise 'show missing'

      end

    end
  end
end
class App < Scorched::Controller
  include Rest::Resource({:pattern => /\/(\d+)/})

  def index
    'index found'
  end

  get '/something' do
    'works'
  end
end

run App
