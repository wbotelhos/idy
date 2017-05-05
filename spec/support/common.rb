# frozen_string_literal: true

require 'rspec/rails'

RSpec.configure do |config|
  config.filter_run_when_matching :focus

  config.disable_monkey_patching!

  config.order = :random
end
