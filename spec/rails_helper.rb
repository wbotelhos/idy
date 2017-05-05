# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'

require 'active_record/railtie'
require 'idy'
require 'pry-byebug'

ActiveRecord::Base.establish_connection adapter: :sqlite3, database: ':memory:'

Dir[File.expand_path('support/**/*.rb', __dir__)].each { |file| require file }

def article_default_salt
  '1182093125'
end

def clean_default_salt
  '3125114'
end

def comment_default_salt
  ''
end

def user_default_salt
  '1182093125'
end
