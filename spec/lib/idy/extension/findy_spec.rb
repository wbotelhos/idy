# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Article, '#findy' do
  context 'when a hash is given' do
    context 'when record is found' do
      let!(:record) { described_class.create id: 1 }
      let!(:hash)   { 'My' }

      it 'finds the record' do
        expect(described_class.findy(hash)).to eq record
      end
    end

    context 'when record is not found' do
      let!(:hash) { 'My' }

      it 'returns nil' do
        expect(described_class.findy(hash)).to be_nil
      end
    end
  end
end
