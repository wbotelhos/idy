# frozen_string_literal: true

RSpec.describe Article, '.idy' do
  it 'returns the encoded id' do
    expect(described_class.new(id: 1).idy).to eq 'My'
  end
end
