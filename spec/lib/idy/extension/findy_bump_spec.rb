# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '#findy!' do
  context 'when a hash is given' do
    context 'and record is found' do
      let!(:record) { Article.create id: 1 }
      let!(:hash)   { 'My' }

      it 'finds the record' do
        expect(Article.findy!(hash)).to eq record
      end
    end

    context 'and record is not found' do
      let!(:hash) { 'My' }

      it 'raises' do
        expect { Article.findy!(hash) }.to raise_error ActiveRecord::RecordNotFound, %(Couldn't find User with 'idy'="My")
      end
    end
  end
end
