# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ':idy_options' do
  describe '.idy_options' do
    context 'when has options' do
      it 'returns the options' do
        expect(Comment.new.idy_options).to eq(salt: 'salt')
      end
    end

    context 'when has no options' do
      it 'returns an default one' do
        expect(Clean.new.idy_options).to eq(salt: clean_default_salt)
      end
    end
  end

  describe '#idy_options' do
    before do
      allow(Clean).to receive(:idy_options) { :idy_options }
    end

    it 'delegates to class method' do
      expect(Clean.new.idy_options).to eq :idy_options
    end
  end
end
