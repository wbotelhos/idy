# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ':salt' do
  describe '#salt' do
    before do
      allow(Clean).to receive(:idy_options) { { salt: :salty } }
    end

    it 'fetchs the salt options' do
      expect(Clean.salt).to eq(:salty)
    end
  end

  describe '.salt' do
    before { allow(Clean).to receive(:salt) { :salt } }

    it 'delegates to class method' do
      expect(Clean.new.salt).to eq :salt
    end
  end
end
