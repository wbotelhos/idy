# frozen_string_literal: true

Dir[File.expand_path('models/*.rb', __dir__)].sort.each { |file| require file }

ActiveRecord::Base.establish_connection(adapter: :sqlite3, database: ':memory:')
