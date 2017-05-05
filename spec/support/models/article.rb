# frozen_string_literal: true

class Article < ::ActiveRecord::Base
  idy

  has_many :comments
end
