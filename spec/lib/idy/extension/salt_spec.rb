# frozen_string_literal: true

RSpec.describe Clean do
  describe '#salt' do
    before { allow(described_class).to receive(:idy_options).and_return(salt: :salty) }

    it 'fetchs the salt options' do
      expect(described_class.salt).to eq(:salty)
    end
  end

  describe '.salt' do
    before { allow(described_class).to receive(:salt).and_return :salt }

    it 'delegates to class method' do
      expect(described_class.new.salt).to eq :salt
    end
  end
end
