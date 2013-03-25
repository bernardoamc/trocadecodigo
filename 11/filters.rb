class BasicController
  class << self
    def before_filters
      @before_filters ||= []
    end

    def after_filters
      @after_filters ||= []
    end

    def before_filter(callback, actions={})
      before_filters << actions.merge(callback: callback)
    end

    def after_filter(callback, actions={})
      after_filters << actions.merge(callback: callback)
    end

    def inherited(klass)
      before_filters.each do |filter| 
        klass.before_filters.unshift(filter)
      end

      after_filters.each do |filter| 
        klass.after_filters.unshift(filter)
      end
    end

    def filter_present?(action, filter)
      return true if     filter[:only].nil? and filter[:except].nil?
      return true if     filter.fetch(:only, []).include?(action)
      return true unless filter.fetch(:except, [action]).include?(action)

      false
    end

    def factory
      ProxyController.new(self.new)
    end
  end
end

class ApplicationController < BasicController
  before_filter :check_something

  def check_something
    puts 'Checking something...'
  end
end

class ReportsController < ApplicationController
  before_filter :same_user?, only: [:show, :create]
  before_filter :log, except: [:create]
  after_filter  :called_action, only: [:index]

  def index
    puts 'Index action!'
  end

  def show
    puts 'Show action!'
  end

  def create
    puts 'Create action!'
  end

  def same_user?
    puts 'Inspecting current_user...'
  end

  def log
    puts "#{Time.now} - Logging..."
  end

  def called_action
    puts 'Success!'
    puts '------------------'
  end
end

class ProxyController < BasicObject
  attr_reader :controller

  def initialize(controller)
    @controller = controller 
  end

  def method_missing(action, *args)
    before = controller.class.before_filters.select do |filter|
      controller.class.filter_present?(action, filter)
    end

    after = controller.class.after_filters.select do |filter|
      controller.class.filter_present?(action, filter)
    end

    before.each { |filter| controller.send(filter[:callback]) }
    controller.send(action, *args)
    after.each { |filter| controller.send(filter[:callback]) }
  end
end

p = ReportsController.factory
p.index
p.show
p.create
