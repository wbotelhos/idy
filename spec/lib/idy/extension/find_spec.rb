# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Article do
  context 'with idy enabled' do
    context 'on reload' do
      subject { described_class.create id: 42, title: 'title' }

      it 'reloads' do
        record = described_class.find(subject.to_param)

        record.update_attribute :title, 'title.updated'

        expect(subject.title).to        eq 'title'
        expect(subject.reload.title).to eq 'title.updated'
      end

      context 'while locking' do
        it 'does not throw an error' do
          expect(-> { subject.lock! }).not_to raise_error
        end
      end
    end

    context 'finding one record as id' do
      subject { described_class.find record.id }

      let!(:record) { described_class.create id: 42, title: 'title-1' }

      specify { expect(subject).to eq record }
    end

    context 'finding one record as idy' do
      subject { described_class.find record.to_param }

      let!(:record) { described_class.create id: 42, title: 'title-1' }

      specify { expect(subject).to eq record }
    end

    context 'finding multiple records' do
      subject { described_class.find [record_1.to_param, record_2.to_param] }

      let!(:record_1) { described_class.create id: 42, title: 'title-1' }
      let!(:record_2) { described_class.create id: 1 , title: 'title-2' }

      it 'finds all' do
        expect(subject).to eq [record_1, record_2]
      end
    end

    context 'finding via has_many' do
      let!(:article) { described_class.create }
      let!(:comment) { Comment.create article: article }

      specify { expect(article.comments.find(comment.id)).to eq comment }
    end

    context 'when id is an integer like' do
      let!(:record) { described_class.create id: 1 }
      let!(:idy)    { '1a' }

      it 'does not tries to use the integer part on normal find' do
        expect { described_class.find(idy) }.to raise_error ActiveRecord::RecordNotFound, %(Couldn't find User with 'idy'="1a")
      end
    end

    context 'when id is an integer' do
      let!(:record) { described_class.create id: 1 }
      let!(:id)     { 1 }

      it 'finds by normal id' do
        expect(described_class.find(id)).to eq record
      end
    end
  end

  context 'with idy disabled' do
    let!(:record) { Clean.create }

    context 'of one record' do
      it 'finds by normal id' do
        expect(Clean.find(record.id)).to eq record
      end
    end

    context 'of multiple record' do
      let!(:record_2) { Clean.create }

      it 'finds by normal id' do
        expect(Clean.find([record.id, record_2.id])).to eq [record, record_2]
      end
    end
  end
end
