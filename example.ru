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
a = /\/(?<identifier>#{/ud\d{3}/i})/
{
  :integer => /\d+/,
  :decimal => /\d+\.*\d*/,
  :color => /#([0-9a-f]{6}|[0-9a-f]{3})/
}


class App < Scorched::Controller
  # include Rest::Resource({:pattern => /\/(\d+)/})

  def self.patterns
    {
      :integer => /\d+/,
      :decimal => /\d+\.*\d*/,
      :color => /#([0-9a-f]{6}|[0-9a-f]{3})/,
      :catalogue => /(UD|ud)(?<id>\d{3})/

    }
  end

  get(/\/(?<identifier>#{patterns[:integer]})$/) do |id|
    "integer found '#{id}'"
  end

  get(/\/(?<identifier>#{patterns[:decimal]})$/) do |id|
    "decimal found '#{id}'"
  end

  get(/\/(?<identifier>#{patterns[:catalogue]})$/) do |id, blah|
    "catalogue found '#{id}'  '#{blah}'"
  end

  # def index
  #   'index found'
  # end
  #
  # get '/something' do
  #   'works'
  # end
end

run App
