# frozen_string_literal: true

module Idy
end

require 'hashids'
require 'idy/extension'

ActiveRecord::Base.include Idy::Extension
