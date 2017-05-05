# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Article, '.find_by' do
  subject { described_class.create title: 'title' }

  it 'works with normal id' do
    record = described_class.find_by(id: subject.id)

    expect(subject).to eq record
  end
end
