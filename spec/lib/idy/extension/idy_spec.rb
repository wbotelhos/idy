# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Article, '.idy' do
  subject { described_class.new id: 1 }

  it 'returns the encoded id' do
    expect(subject.idy).to eq 'My'
  end
end
