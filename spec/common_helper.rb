# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'

require 'support/coverage'

require 'active_record/railtie'
require 'idy'

require 'pry-byebug'
require 'support/common'
require 'support/database_cleaner'
require 'support/database'

require 'support/migrate'
