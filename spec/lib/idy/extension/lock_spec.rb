# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Article, '.lock!' do
  subject { described_class.create title: 'title' }

  it 'works' do
    record = described_class.find(subject.to_param)

    expect { record.lock! }.not_to raise_error
  end
end
