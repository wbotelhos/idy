# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '#idy_encode' do
  context 'with no given salt' do
    let!(:model) { Article.new id: 1 }

    it 'obfuscates the id with default class salt' do
      expect(model.class.idy_encode(model.id)).to eq 'My'
    end
  end

  context 'with empty salt' do
    let!(:model) { Article.new id: 1 }
    let!(:salt)  { '' }

    it 'obfuscates the id with empty salt' do
      expect(model.class.idy_encode(model.id, salt: salt)).to eq 'jR'
    end
  end

  context 'with salt' do
    let!(:model) { Article.new id: 1 }

    context 'as string' do
      let!(:salt) { 'salt' }

      it 'obfuscates the id with given salt' do
        expect(model.class.idy_encode(model.id, salt: salt)).to eq 'XG'
      end
    end

    context 'as number' do
      let!(:salt) { 1 }

      it 'obfuscates the id with given salt as string' do
        expect(model.class.idy_encode(model.id, salt: salt)).to eq 'kL'
      end
    end
  end

  context 'with nil id' do
    let!(:model) { Article.new }

    it 'returns nil' do
      expect(model.class.idy_encode(model.id)).to be_nil
    end
  end
end
