# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '#idy_default_salt' do
  context 'when class name has a big length' do
    it 'is bases on the first 10 class letter position index on alphabet' do
      expect(Abcdefghijklm.idy_default_salt).to eq '12345678910'
    end
  end
end
