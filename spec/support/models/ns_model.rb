# frozen_string_literal: true

module Namespace
  def self.table_name_prefix
    'namespace_'
  end
  
  class NsModel < ActiveRecord::Base
  end
end
