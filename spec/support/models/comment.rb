# frozen_string_literal: true

class Comment < ::ActiveRecord::Base
  idy salt: 'salt'

  belongs_to :article
end
